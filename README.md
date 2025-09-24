# Nakama Lua Intellisense Module

A maintained fork of [KittySkin/Nakama-Intellisense-Module-for-Lua](https://github.com/KittySkin/Nakama-Intellisense-Module-for-Lua).  
The original project hasn’t been updated since 2022, and Nakama’s API has evolved since then.  
This fork brings the module up-to-date for **Nakama (2025)** and introduces an automated way to keep it in sync with the latest docs.

---

## ✨ Features
- Updated `nakama.lua` with current (2025) Nakama API.  
- Provides Intellisense for Nakama Lua functions and APIs.  
- Cross-IDE support via EmmyLua (works in VS Code, IntelliJ, and others).  
- Added Python scraper `nakama-lua-scraper.py` which parses Nakama’s official documentation and rebuilds `modules/nakama.lua` with up-to-date API signatures and types.

Shared originally on the [Nakama forums](https://forum.heroiclabs.com/t/nakama-lua-intellisense-implementation/2576).

---

## 📦 Installation

1. Install the [EmmyLua plugin](https://github.com/EmmyLua) in your IDE of choice.  
2. Download the **`modules`** folder from this repository (or just grab `modules/nakama.lua`).  
3. Place it into your project and import it with `require("nakama")`.  
   This enables Intellisense and autocompletion for Nakama functions.

---

## 🚀 Example Usage

Once the module is included, your IDE will provide autocomplete hints.  
For example, when writing Nakama Lua modules:

```lua
local nk = require("nakama")

---@param context Context
---@param payload table
local function my_rpc_func(context, payload)
    nk.logger_info("Received payload: " .. payload)

    local user_id = context.user_id
    nk.logger_info("Caller user id: " .. user_id)

    return "Hello from Nakama!"
end

nk.register_rpc(my_rpc_func, "my_rpc_func")
```
Your IDE should now show suggestions for nk.logger_info, nk.register_rpc, and other Nakama APIs.

---

## ⚠️ Important Note

Do **not** deploy the `nakama.lua` file to your production server.  
It’s only meant for development assistance, and uploading it may break the server runtime.

---

## 🐛 Contributing

If you spot missing APIs, incorrect types, or bugs in the annotations:  
- Open an [issue](../../issues)  
- Or submit a pull request  

Your contributions will help keep this Intellisense module up-to-date with Nakama.

---

## 📜 License
MIT License – feel free to use, modify, and share.
