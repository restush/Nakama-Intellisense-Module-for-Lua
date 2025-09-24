# nakama_scraper.py
import requests
from bs4 import BeautifulSoup
import re

URL = "https://heroiclabs.com/docs/nakama/server-framework/lua-runtime/function-reference"
OUT_FILE = "./modules/nakama.lua"

# Manual type overrides: (function_name, param_name) -> forced type
TYPE_OVERRIDES = {
    ("json_encode", "value"): "any",  # value param should accept any, not just string
    ("logger_info", "vars"): "any",   # vars should be any
    ("logger_error", "vars"): "any",
    ("logger_warn", "vars"): "any",
}

def clean_func_name(raw: str) -> str:
    name = raw.replace("#", "").strip()
    name = re.sub(r'[^0-9A-Za-z_]', '', name)
    return name

def normalize_type(ptype: str) -> str:
    return (ptype or "any").strip().lower()

def parse_param_cell(td):
    spans = [s.get_text(strip=True) for s in td.find_all("span")]
    name = spans[0] if len(spans) >= 1 else td.get_text(" ", strip=True).split()[0]
    ptype = spans[1] if len(spans) >= 2 and spans[1].upper() != "REQUIRED" else "any"
    required = any(("REQUIRED" == s.upper()) or ("REQUIRED" in s.upper()) for s in spans)
    return name, normalize_type(ptype), required

def parse_return_cell(td):
    spans = [s.get_text(strip=True) for s in td.find_all("span")]
    if len(spans) >= 2:
        return normalize_type(spans[1]), spans[0]
    text = td.get_text(" ", strip=True)
    parts = text.split()
    if len(parts) >= 2:
        return normalize_type(parts[1]), parts[0]
    return "any", text or "result"

def scrape():
    resp = requests.get(URL)
    resp.raise_for_status()
    soup = BeautifulSoup(resp.text, "lxml")

    functions = []
    start_collecting = False

    for section in soup.find_all("h3"):
        raw_name = section.get_text(strip=True)
        if not start_collecting:
            if raw_name.lower().startswith("account_delete_id"):
                start_collecting = True
            else:
                continue

        func_name_clean = clean_func_name(raw_name)
        table = section.find_next("table")
        if not table:
            continue

        description = None
        for sib in section.next_siblings:
            if getattr(sib, "name", None) == "p":
                description = sib.get_text(strip=True)
                break
            if getattr(sib, "name", None) == "table":
                break

        params, returns = [], []
        mode = None

        for row in table.find_all("tr"):
            ths = row.find_all("th")
            if ths:
                header_text = ths[0].get_text(" ", strip=True).lower()
                if "parameters" in header_text:
                    mode = "params"
                elif "returns" in header_text:
                    mode = "returns"
                continue

            cols = row.find_all("td")
            if not cols:
                continue

            if mode == "params":
                name, ptype, required = parse_param_cell(cols[0])
                # Apply type override if exists
                ptype = TYPE_OVERRIDES.get((func_name_clean, name), ptype)
                desc = cols[-1].get_text(" ", strip=True)
                params.append({"name": name, "type": ptype, "required": required, "desc": desc})
            elif mode == "returns":
                rtype, rname = parse_return_cell(cols[0])
                desc = cols[-1].get_text(" ", strip=True) if len(cols) > 1 else ""
                returns.append({"name": rname, "type": rtype, "desc": desc})

        if func_name_clean:
            functions.append({
                "title": raw_name,
                "desc": description,
                "name": func_name_clean,
                "params": params,
                "returns": returns
            })

    with open(OUT_FILE, "w", encoding="utf-8") as f:
        # Header with predefined classes
        f.write("""---@diagnostic disable: undefined-doc-param, missing-return
local M = {}

---@class Account
---@field public metadata table
---@field public wallet table
---@field public username string
---@field public display_name string
---@field public timezone string
---@field public location string
---@field public language string
---@field public avatar_url string
M.account = {}

---@class CollectionObject
---@field public collection string
---@field public key string
---@field public user_id string
---@field public value table
---@field public version string
---@field public permission_read number
---@field public permission_write number
M.collection_object = {}

---@class Context
---@field env table A table of key/value pairs which are defined in the YAML configuration of the server. This is useful to store API keys and other secrets which may be different between servers run in production and in development.
---@field execution_mode string The mode associated with the execution context. It's one of these values: "run_once", "rpc", "before", "after", "match", "matchmaker", "leaderboard_reset", "tournament_reset", "tournament_end".
---@field query_params table Query params that was passed through from HTTP request.
---@field session_id string The user session associated with the execution context.
---@field user_id string The user ID associated with the execution context.
---@field username string The username associated with the execution context.
---@field user_session_exp number The user session expiry in seconds associated with the execution context.
---@field client_ip string The IP address of the client making the request.
---@field client_port string The port number of the client making the request.
---@field match_id string The match ID that is currently being executed. Only applicable to server authoritative multiplayer.
---@field match_node string The node ID that the match is being executed on. Only applicable to server authoritative multiplayer.
---@field match_label string Labels associated with the match. Only applicable to server authoritative multiplayer.
---@field match_tick_rate number Tick rate defined for this match. Only applicable to server authoritative multiplayer.
M.context = {}

---@class Presence
---@field user_id string
---@field session_id string
---@field username string
---@field node string
M.presence = {}

---@class GameMessage
---@field sender Presence
---@field op_code number
---@field data string
M.game_message = {}

---@class Dispatcher
M.dispatcher = {}

---@enum error
M.error = {
    OK                  = 0, -- HTTP 200
    CANCELED            = 1, -- HTTP 499
    UNKNOWN             = 2, -- HTTP 500
    INVALID_ARGUMENT    = 3, -- HTTP 400
    DEADLINE_EXCEEDED   = 4, -- HTTP 504
    NOT_FOUND           = 5, -- HTTP 404
    ALREADY_EXISTS      = 6, -- HTTP 409
    PERMISSION_DENIED   = 7, -- HTTP 403
    RESOURCE_EXHAUSTED  = 8, -- HTTP 429
    FAILED_PRECONDITION = 9, -- HTTP 400
    ABORTED             = 10, -- HTTP 409
    OUT_OF_RANGE        = 11, -- HTTP 400
    UNIMPLEMENTED       = 12, -- HTTP 501
    INTERNAL            = 13, -- HTTP 500
    UNAVAILABLE         = 14, -- HTTP 503
    DATA_LOSS           = 15, -- HTTP 500
    UNAUTHENTICATED     = 16 -- HTTP 401
}

""")

        # Functions
        for fn in functions:
            if fn["desc"]:
                f.write(f"--- {fn['desc']}\n")
            else:
                pretty = re.sub(r'[_]+', ' ', fn["title"])
                f.write(f"--- {pretty}\n")

            for p in fn["params"]:
                if p["required"]:
                    f.write(f"---@param {p['name']} {p['type']} REQUIRED - {p['desc']}\n")
                else:
                    f.write(f"---@param {p['name']}? {p['type']} {p['desc']}\n")

            for r in fn["returns"]:
                rname = r["name"] if r["name"] else "result"
                f.write(f"---@return {r['type']} {rname} {r['desc']}\n")

            param_names = ", ".join([p["name"] for p in fn["params"]])
            f.write(f"function M.{fn['name']}({param_names})\nend\n\n")

            # Dramatic log for each function
            print(f"⚡ Added function: {fn['name']}")

        f.write("return M\n")

    print(f"\n✅ Done! Generated {OUT_FILE} with {len(functions)} functions.")

if __name__ == "__main__":
    scrape()
