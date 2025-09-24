---@diagnostic disable: undefined-doc-param, missing-return
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
    OK                  = 0,  -- HTTP 200
    CANCELED            = 1,  -- HTTP 499
    UNKNOWN             = 2,  -- HTTP 500
    INVALID_ARGUMENT    = 3,  -- HTTP 400
    DEADLINE_EXCEEDED   = 4,  -- HTTP 504
    NOT_FOUND           = 5,  -- HTTP 404
    ALREADY_EXISTS      = 6,  -- HTTP 409
    PERMISSION_DENIED   = 7,  -- HTTP 403
    RESOURCE_EXHAUSTED  = 8,  -- HTTP 429
    FAILED_PRECONDITION = 9,  -- HTTP 400
    ABORTED             = 10, -- HTTP 409
    OUT_OF_RANGE        = 11, -- HTTP 400
    UNIMPLEMENTED       = 12, -- HTTP 501
    INTERNAL            = 13, -- HTTP 500
    UNAVAILABLE         = 14, -- HTTP 503
    DATA_LOSS           = 15, -- HTTP 500
    UNAUTHENTICATED     = 16  -- HTTP 401
}

--- Delete an account by user ID.
---@param userID string REQUIRED - User ID for the account to be deleted. Must be valid UUID.
---@param recorded? bool Whether to record this deletion in the database. By default this is set to false.
---@return error error An optional error value if an error occurred.
function M.account_delete_id(userID, recorded)
end

--- Export account information for a specified user ID.
---@param userID string REQUIRED - User ID for the account to be exported. Must be valid UUID.
---@return string export Account information for the provided user ID, in JSON format.
---@return error error An optional error value if an error occurred.
function M.account_export_id(userID)
end

--- Fetch account information by user ID.
---@param userID string REQUIRED - User ID to fetch information for. Must be valid UUID.
---@return table account All account information including wallet, device IDs and more.
---@return error error An optional error value if an error occurred.
function M.account_get_id(userID)
end

--- Fetch information for multiple accounts by user IDs.
---@param userIDs table REQUIRED - Table of user IDs to fetch information for. Must be valid UUID.
---@return table account Table of accounts.
---@return error error An optional error value if an error occurred.
function M.accounts_get_id(userIDs)
end

--- Update an account by user ID.
---@param userID string REQUIRED - User ID for which the information is to be updated. Must be valid UUID.
---@param metadata? table The metadata to update for this account.
---@param username? string Username to be set. Must be unique. Use null if it is not being updated.
---@param displayName? string Display name to be updated. Use null if it is not being updated.
---@param timezone? string Timezone to be updated. Use null if it is not being updated.
---@param location? string Location to be updated. Use null if it is not being updated.
---@param langTag? string Lang tag to be updated. Use null if it is not being updated.
---@param avatarURL? string User's avatar URL. Use null if it is not being updated.
---@return error error An optional error value if an error occurred.
function M.account_update_id(userID, metadata, username, displayName, timezone, location, langTag, avatarURL)
end

--- Authenticate user and create a session token using an Apple sign in token.
---@param token string REQUIRED - Apple sign in token.
---@param username? string The user's username. If left empty, one is generated.
---@param create? bool Create user if one didn't exist previously.
---@return string userID The user ID of the authenticated user.
---@return string username The username of the authenticated user.
---@return bool created Value indicating if this account was just created or already existed.
---@return error error An optional error value if an error occurred.
function M.authenticate_apple(token, username, create)
end

--- Authenticate user and create a session token using a custom authentication managed by an external service or source not already supported by Nakama.
---@param id string REQUIRED - Custom ID to use to authenticate the user. Must be between 6-128 characters.
---@param username? string The user's username. If left empty, one is generated.
---@param create? bool Create user if one didn't exist previously.
---@return string userID The user ID of the authenticated user.
---@return string username The username of the authenticated user.
---@return bool created Value indicating if this account was just created or already existed.
---@return error error An optional error value if an error occurred.
function M.authenticate_custom(id, username, create)
end

--- Authenticate user and create a session token using a device identifier.
---@param id string REQUIRED - Device ID to use to authenticate the user. Must be between 1-128 characters.
---@param username? string The user's username. If left empty, one is generated.
---@param create? bool Create user if one didn't exist previously.
---@return string userID The user ID of the authenticated user.
---@return string username The username of the authenticated user.
---@return bool created Value indicating if this account was just created or already existed.
---@return error error An optional error value if an error occurred.
function M.authenticate_device(id, username, create)
end

--- Authenticate user and create a session token using an email address and password.
---@param email string REQUIRED - Email address to use to authenticate the user. Must be between 10-255 characters.
---@param password string REQUIRED - Password to set. Must be longer than 8 characters.
---@param username? string The user's username. If left empty, one is generated.
---@param create? bool Create user if one didn't exist previously.
---@return string userID The user ID of the authenticated user.
---@return string username The username of the authenticated user.
---@return bool created Value indicating if this account was just created or already existed.
---@return error error An optional error value if an error occurred.
function M.authenticate_email(email, password, username, create)
end

--- Authenticate user and create a session token using a Facebook account token.
---@param token string REQUIRED - Facebook OAuth or Limited Login (JWT) access token.
---@param importFriends? bool Whether to automatically import Facebook friends after authentication.
---@param username? string The user's username. If left empty, one is generated.
---@param create? bool Create user if one didn't exist previously.
---@return string userID The user ID of the authenticated user.
---@return string username The username of the authenticated user.
---@return bool created Value indicating if this account was just created or already existed.
---@return error error An optional error value if an error occurred.
function M.authenticate_facebook(token, importFriends, username, create)
end

--- Authenticate user and create a session token using a Facebook Instant Game.
---@param playerInfo string REQUIRED - Facebook Player info.
---@param username? string The user's username. If left empty, one is generated.
---@param create? bool Create user if one didn't exist previously.
---@return string userID The user ID of the authenticated user.
---@return string username The username of the authenticated user.
---@return bool created Value indicating if this account was just created or already existed.
---@return error error An optional error value if an error occurred.
function M.authenticate_facebook_instance_game(playerInfo, username, create)
end

--- Authenticate user and create a session token using Apple Game Center credentials.
---@param playerID string REQUIRED - PlayerId provided by GameCenter.
---@param bundleID string REQUIRED - BundleId of your app on iTunesConnect.
---@param timestamp number REQUIRED - Timestamp at which Game Center authenticated the client and issued a signature.
---@param salt string REQUIRED - A random string returned by Game Center authentication on client.
---@param signature string REQUIRED - A signature returned by Game Center authentication on client.
---@param publicKeyURL string REQUIRED - A URL to the public key returned by Game Center authentication on client.
---@param username? string The user's username. If left empty, one is generated.
---@param create? bool Create user if one didn't exist previously.
---@return string userID The user ID of the authenticated user.
---@return string username The username of the authenticated user.
---@return bool created Value indicating if this account was just created or already existed.
---@return error error An optional error value if an error occurred.
function M.authenticate_game_center(playerID, bundleID, timestamp, salt, signature, publicKeyURL, username, create)
end

--- Authenticate user and create a session token using a Google ID token.
---@param token string REQUIRED - Google OAuth access token.
---@param username? string The user's username. If left empty, one is generated.
---@param create? bool Create user if one didn't exist previously.
---@return string userID The user ID of the authenticated user.
---@return string username The username of the authenticated user.
---@return bool created Value indicating if this account was just created or already existed.
---@return error error An optional error value if an error occurred.
function M.authenticate_google(token, username, create)
end

--- Authenticate user and create a session token using a Steam account token.
---@param token string REQUIRED - Steam token.
---@param username? string The user's username. If left empty, one is generated.
---@param importFriends? bool Whether to automatically import Steam friends after authentication.
---@param create? bool Create user if one didn't exist previously.
---@return string userID The user ID of the authenticated user.
---@return string username The username of the authenticated user.
---@return bool created Value indicating if this account was just created or already existed.
---@return error error An optional error value if an error occurred.
function M.authenticate_steam(token, username, importFriends, create)
end

--- Generate a Nakama session token from a user ID.
---@param userID string REQUIRED - User ID to use to generate the token.
---@param username? string The user's username. If left empty, one is generated.
---@param exp? number UTC time in seconds when the token must expire. Defaults to server configured expiry time.
---@param vars? table Extra information that will be bundled in the session token.
---@return string token The Nakama session token.
---@return number validity The period for which the token remains valid.
---@return error error An optional error value if an error occurred.
function M.authenticate_token_generate(userID, username, exp, vars)
end

--- Link Apple authentication to a user ID.
---@param userID string REQUIRED - The user ID to be linked.
---@param token string REQUIRED - Apple sign in token.
---@return error error An optional error value if an error occurred.
function M.link_apple(userID, token)
end

--- Link custom authentication to a user ID.
---@param userID string REQUIRED - The user ID to be linked.
---@param customID string REQUIRED - Custom ID to be linked to the user.
---@return error error An optional error value if an error occurred.
function M.link_custom(userID, customID)
end

--- Link device authentication to a user ID.
---@param userID string REQUIRED - The user ID to be linked.
---@param deviceID string REQUIRED - Device ID to be linked to the user.
---@return error error An optional error value if an error occurred.
function M.link_device(userID, deviceID)
end

--- Link email authentication to a user ID.
---@param userID string REQUIRED - The user ID to be linked.
---@param email string REQUIRED - Authentication email to be linked to the user.
---@param password string REQUIRED - Password to set. Must be longer than 8 characters.
---@return error error An optional error value if an error occurred.
function M.link_email(userID, email, password)
end

--- Link Facebook authentication to a user ID.
---@param userID string REQUIRED - The user ID to be linked.
---@param username? string If left empty, one is generated.
---@param token string REQUIRED - Facebook OAuth or Limited Login (JWT) access token.
---@param importFriends? bool Whether to automatically import Facebook friends after authentication.
---@return error error An optional error value if an error occurred.
function M.link_facebook(userID, username, token, importFriends)
end

--- Link Facebook Instant Game authentication to a user ID.
---@param userID string REQUIRED - The user ID to be linked.
---@param playerInfo string REQUIRED - Facebook player info.
---@return error error An optional error value if an error occurred.
function M.link_facebook_instant_game(userID, playerInfo)
end

--- Link Apple Game Center authentication to a user ID.
---@param userID string REQUIRED - The user ID to be linked.
---@param playerID string REQUIRED - Player ID provided by Game Center.
---@param bundleID string REQUIRED - Bundle ID of your app on iTunesConnect.
---@param timestamp int REQUIRED - Timestamp at which Game Center authenticated the client and issued a signature.
---@param salt string REQUIRED - A random string returned by Game Center authentication on client.
---@param signature string REQUIRED - A signature returned by Game Center authentication on client.
---@param publicKeyURL string REQUIRED - A URL to the public key returned by Game Center authentication on client.
---@return error error An optional error value if an error occurred.
function M.link_gamecenter(userID, playerID, bundleID, timestamp, salt, signature, publicKeyURL)
end

--- Link Google authentication to a user ID.
---@param userID string REQUIRED - The user ID to be linked.
---@param token string REQUIRED - Google OAuth access token.
---@return error error An optional error value if an error occurred.
function M.link_google(userID, token)
end

--- Link Steam authentication to a user ID.
---@param userID string REQUIRED - The user ID to be linked.
---@param username string REQUIRED - If left empty, one is generated.
---@param token string REQUIRED - Steam access token.
---@param importFriends bool REQUIRED - Whether to automatically import Steam friends after authentication.
---@return error error An optional error value if an error occurred.
function M.link_steam(userID, username, token, importFriends)
end

--- Unlink Apple authentication from a user ID.
---@param userID string REQUIRED - The user ID to be unlinked.
---@param token? string Apple sign in token.
---@return error error An optional error value if an error occurred.
function M.unlink_apple(userID, token)
end

--- Unlink custom authentication from a user ID.
---@param userID string REQUIRED - The user ID to be unlinked.
---@param customID? string Custom ID to be unlinked from the user.
---@return error error An optional error value if an error occurred.
function M.unlink_custom(userID, customID)
end

--- Unlink device authentication from a user ID.
---@param userID string REQUIRED - The user ID to be unlinked.
---@param deviceID string REQUIRED - Device ID to be unlinked to the user.
---@return error error An optional error value if an error occurred.
function M.unlink_device(userID, deviceID)
end

--- Unlink email authentication from a user ID.
---@param userID string REQUIRED - The user ID to be unlinked.
---@param email? string Email to be unlinked from the user.
---@return error error An optional error value if an error occurred.
function M.unlink_email(userID, email)
end

--- Unlink Facebook authentication from a user ID.
---@param userID string REQUIRED - The user ID to be unlinked.
---@param token? string Facebook OAuth or Limited Login (JWT) access token.
---@return error error An optional error value if an error occurred.
function M.unlink_facebook(userID, token)
end

--- Unlink Facebook Instant Game authentication from a user ID.
---@param userID string REQUIRED - The user ID to be unlinked.
---@param playerInfo? string Facebook player info.
---@return error error An optional error value if an error occurred.
function M.unlink_facebook_instant_game(userID, playerInfo)
end

--- Unlink Apple Game Center authentication from a user ID.
---@param userID string REQUIRED - The user ID to be unlinked.
---@param playerID string REQUIRED - Player ID provided by Game Center.
---@param bundleID string REQUIRED - Bundle ID of your app on iTunesConnect.
---@param timestamp int REQUIRED - Timestamp at which Game Center authenticated the client and issued a signature.
---@param salt string REQUIRED - A random string returned by Game Center authentication on client.
---@param signature string REQUIRED - A signature returned by Game Center authentication on client.
---@param publicKeyURL string REQUIRED - A URL to the public key returned by Game Center authentication on client.
---@return error error An optional error value if an error occurred.
function M.unlink_game_center(userID, playerID, bundleID, timestamp, salt, signature, publicKeyURL)
end

--- Unlink Google authentication from a user ID.
---@param userID string REQUIRED - The user ID to be unlinked.
---@param token? string Google OAuth access token.
---@return error error An optional error value if an error occurred.
function M.unlink_google(userID, token)
end

--- Unlink Steam authentication from a user ID.
---@param userID string REQUIRED - The user ID to be unlinked.
---@param token? string Steam access token.
---@return error error An optional error value if an error occurred.
function M.unlink_steam(userID, token)
end

--- Create a channel identifier to be used in other runtime calls. Does not create a channel.
---@param senderID string REQUIRED - UserID of the message sender (when applicable). An empty string defaults to the system user.
---@param target string REQUIRED - Can be the room name, group identifier, or another username.
---@param chanType int REQUIRED - The type of channel, either Room (1), Direct (2), or Group (3).
---@return string channelId The generated ID representing a channel.
---@return error error An optional error value if an error occurred.
function M.channel_id_build(senderID, target, chanType)
end

--- Remove a message on a realtime chat channel.
---@param channelID string REQUIRED - The ID of the channel to send the message on.
---@param messageID string REQUIRED - The ID of the message to remove.
---@param senderID? string The UUID for the sender of this message. If left empty, it will be assumed that it is a system message.
---@param senderUsername? string The username of the user to send this message as. If left empty, it will be assumed that it is a system message.
---@param persist? bool Whether to record this message in the channel history.
---@return table ack Message removed ack containing the following variables: 'channelId', 'messageId', 'code', 'username', 'createTime', 'updateTime', and 'persistent'.
---@return error error An optional error value if an error occurred.
function M.channel_message_remove(channelID, messageID, senderID, senderUsername, persist)
end

--- Send a message on a realtime chat channel.
---@param channelID string REQUIRED - The ID of the channel to send the message on.
---@param content table REQUIRED - Message content.
---@param senderID? string The UUID for the sender of this message. If left empty, it will be assumed that it is a system message.
---@param senderUsername? string The username of the user to send this message as. If left empty, it will be assumed that it is a system message.
---@param persist? bool Whether to record this message in the channel history.
---@return table ack Message sent ack containing the following variables: 'channelId', 'messageId', 'code', 'username', 'createTime', 'updateTime', and 'persistent'.
---@return error error An optional error value if an error occurred.
function M.channel_message_send(channelID, content, senderID, senderUsername, persist)
end

--- List messages from a realtime chat channel.
---@param channelID string REQUIRED - The ID of the channel to send the message on.
---@param limit? number The number of messages to return per page.
---@param forward? bool Whether to list messages from oldest to newest, or newest to oldest.
---@param cursor? string Pagination cursor from previous result. Don't set to start fetching from the beginning.
---@return table messages Messages from the specified channel.
---@return string nextCursor Cursor for the next page of messages, if any. Will be set to "" or nil when fetching last available page.
---@return string prevCursor Cursor for the previous page of messages, if any.
---@return error error An optional error value if an error occurred.
function M.channel_messages_list(channelID, limit, forward, cursor)
end

--- Update a message on a realtime chat channel.
---@param channelID string REQUIRED - The ID of the channel to send the message on.
---@param messageID string REQUIRED - The ID of the message to update.
---@param content table REQUIRED - Message content. Must be set.
---@param senderID? string The UUID for the sender of this message. If left empty, it will be assumed that it is a system message.
---@param senderUsername? string The username of the user to send this message as. If left empty, it will be assumed that it is a system message.
---@param persist? bool Whether to record this message in the channel history.
---@return table ack Message updated ack containing the following variables: 'channelId', 'messageId', 'code', 'username', 'createTime', 'updateTime', and 'persistent'.
---@return error error An optional error value if an error occurred.
function M.channel_message_update(channelID, messageID, content, senderID, senderUsername, persist)
end

--- Get a subset of the Nakama configuration values.
---@return table config A number of Nakama configuration values.
---@return error error An optional error value if an error occurred.
function M.get_config()
end

--- Generate an event.
---@param name string REQUIRED - The name of the event to be created.
---@param properties table REQUIRED - A table of event properties.
---@param timestamp int REQUIRED - Numeric UTC value of when event is created.
---@param external? bool Whether the event is external.
---@return error error An optional error value if an error occurred.
function M.event(name, properties, timestamp, external)
end

--- Update friend metadata.
---@param userID string REQUIRED - The ID of the user.
---@param friendUserID string REQUIRED - The ID of the friend of the user.
---@param metadata table REQUIRED - The custom metadata to set for the friend.
---@return error error An optional error value if an error occurred.
function M.friend_metadata_update(userID, friendUserID, metadata)
end

--- Add friends to a user.
---@param userID string REQUIRED - The ID of the user to whom you want to add friends.
---@param username string REQUIRED - The name of the user to whom you want to add friends.
---@param userIDs table REQUIRED - The IDs of the users you want to add as friends.
---@param usernames table REQUIRED - The usernames of the users you want to add as friends.
---@param metadataTable? table Custom information to store for this friend. Can be left empty as nil/null.
---@return error error An optional error value if an error occurred.
function M.friends_add(userID, username, userIDs, usernames, metadataTable)
end

--- Block friends for a user.
---@param userID string REQUIRED - The ID of the user for whom you want to block friends.
---@param username string REQUIRED - The name of the user for whom you want to block friends.
---@param userIDs table REQUIRED - The IDs of the users you want to block as friends.
---@param usernames table REQUIRED - The usernames of the users you want to block as friends.
---@return error error An optional error value if an error occurred.
function M.friends_block(userID, username, userIDs, usernames)
end

--- Delete friends from a user.
---@param userID string REQUIRED - The ID of the user from whom you want to delete friends.
---@param username string REQUIRED - The name of the user from whom you want to delete friends.
---@param userIDs table REQUIRED - The IDs of the users you want to delete as friends.
---@param usernames table REQUIRED - The usernames of the users you want to delete as friends.
---@return error error An optional error value if an error occurred.
function M.friends_delete(userID, username, userIDs, usernames)
end

--- List all friends, invites, invited, and blocked which belong to a user.
---@param userID string REQUIRED - The ID of the user whose friends, invites, invited, and blocked you want to list.
---@param limit? number The number of friends to retrieve in this page of results. No more than 100 limit allowed per result.
---@param state? number The state of the friendship with the user. If unspecified this returns friends in all states for the user.
---@param cursor? string Pagination cursor from previous result. Don't set to start fetching from the beginning.
---@return table friends The user information for users that are friends of the current user.
---@return string cursor An optional next page cursor that can be used to retrieve the next page of records (if any). Will be set to "" or nil when fetching last available page.
---@return error error An optional error value if an error occurred.
function M.friends_list(userID, limit, state, cursor)
end

--- List all friends, invites, invited, and blocked which belong to a user.
---@param userID string REQUIRED - The ID of the user whose friends, invites, invited, and blocked you want to list.
---@param limit? number The number of friends to retrieve in this page of results. No more than 100 limit allowed per result.
---@param cursor? string Pagination cursor from previous result. Don't set to start fetching from the beginning.
---@return table friendsOfFriends The user information for users that are friends of friends of the current user.
---@return string cursor An optional next page cursor that can be used to retrieve the next page of records (if any). Will be set to "" or nil when fetching last available page.
---@return error error An optional error value if an error occurred.
function M.friends_of_friends_list(userID, limit, cursor)
end

--- Set up a group with various configuration settings. The group will be created if they don't exist or fail if the group name is taken.
---@param userID string REQUIRED - Mandatory. The user ID to be associated as the group superadmin.
---@param name string REQUIRED - Mandatory. Group name, must be unique.
---@param creatorID? string The user ID to be associated as creator. If not set or nil/null, system user will be set.
---@param langTag? string Group language.
---@param description? string Group description, can be left empty as nil/null.
---@param avatarURL? string URL to the group avatar, can be left empty as nil/null.
---@param open? bool Whether the group is for anyone to join, or members will need to send invitations to join.
---@param metadata? table Custom information to store for this group. Can be left empty as nil/null.
---@param maxCount? number Maximum number of members to have in the group.
---@return string createGroup The ID of the newly created group.
---@return error error An optional error value if an error occurred.
function M.group_create(userID, name, creatorID, langTag, description, avatarURL, open, metadata, maxCount)
end

--- Delete a group.
---@param groupID string REQUIRED - The ID of the group to delete.
---@return error error An optional error value if an error occurred.
function M.group_delete(groupID)
end

--- Fetch one or more groups by their ID.
---@param groupIDs table REQUIRED - A list of strings of the IDs for the groups to get.
---@return table getGroups A table of groups with their fields.
---@return error error An optional error value if an error occurred.
function M.groups_get_id(groupIDs)
end

--- Fetch one or more groups randomly.
---@param count int REQUIRED - The number of groups to fetch.
---@return table users A list of group record objects.
---@return error error An optional error value if an error occurred.
function M.groupsGetRandom(count)
end

--- Find groups based on the entered criteria.
---@param name string REQUIRED - Search for groups that contain this value in their name.
---@param langTag? string Filter based upon the entered language tag.
---@param open bool REQUIRED - Filter based on whether groups are Open or Closed.
---@param edgeCount number REQUIRED - Search groups with an equal or lower number of members in descending order.
---@param limit? number Return only the required number of groups denoted by this limit value.
---@param cursor? string Pagination cursor from previous result. Don't set to start fetching from the beginning.
---@return string cursor An optional next page cursor that can be used to retrieve the next page of records (if any). Will be set to "" or nil when fetching last available page.
---@return error error An optional error value if an error occurred.
function M.groups_list(name, langTag, open, edgeCount, limit, cursor)
end

--- Update a group with various configuration settings. The group which is updated can change some or all of its fields.
---@param groupID string REQUIRED - The ID of the group to update.
---@param userID? string User ID calling the update operation for permission checking. Set as nil to enact the changes as the system user.
---@param name? string Group name, can be empty if not changed.
---@param creatorID? string The user ID to be associated as creator. Can be empty if not changed.
---@param langTag? string Group language. Empty if not updated.
---@param description? string Group description, can be left empty if not updated.
---@param avatarURL? string URL to the group avatar, can be left empty if not updated.
---@param open? bool Whether the group is for anyone to join or not.
---@param metadataTable? table Custom information to store for this group. Use nil if field is not being updated.
---@param maxCount? number Maximum number of members to have in the group. Use 0, nil/null if field is not being updated.
---@return error error An optional error value if an error occurred.
function M.group_update(groupID, userID, name, creatorID, langTag, description, avatarURL, open, metadataTable, maxCount)
end

--- Join a group for a particular user.
---@param groupID string REQUIRED - The ID of the group to join.
---@param userID string REQUIRED - The user ID to add to this group.
---@param username string REQUIRED - The username of the user to add to this group.
---@return error error An optional error value if an error occurred.
function M.group_user_join(groupID, userID, username)
end

--- Leave a group for a particular user.
---@param groupID string REQUIRED - The ID of the group to leave.
---@param userID string REQUIRED - The user ID to remove from this group.
---@param username string REQUIRED - The username of the user to remove from this group.
---@return error error An optional error value if an error occurred.
function M.group_user_leave(groupID, userID, username)
end

--- Add users to a group.
---@param groupID string REQUIRED - The ID of the group to add users to.
---@param userIDs table REQUIRED - Table of user IDs to add to this group.
---@param callerID? string User ID of the caller, will apply permissions checks of the user. If empty defaults to system user and permissions are bypassed.
---@return error error An optional error value if an error occurred.
function M.group_users_add(groupID, userIDs, callerID)
end

--- Ban users from a group.
---@param groupID string REQUIRED - The ID of the group to ban users from.
---@param userIDs table REQUIRED - Table of user IDs to ban from this group.
---@param callerID? string User ID of the caller, will apply permissions checks of the user. If empty defaults to system user and permission checks are bypassed.
---@return error error An optional error value if an error occurred.
function M.group_users_ban(groupID, userIDs, callerID)
end

--- Demote users in a group.
---@param groupID string REQUIRED - The ID of the group whose members are being demoted.
---@param userIDs table REQUIRED - Table of user IDs to demote.
---@param callerID? string User ID of the caller, will apply permissions checks of the user. If empty defaults to system user and permission checks are bypassed.
---@return error error An optional error value if an error occurred.
function M.group_users_demote(groupID, userIDs, callerID)
end

--- Kick users from a group. This can also be used to remove pending requests for groups that require acceptance.
---@param groupID string REQUIRED - The ID of the group to kick users from.
---@param userIDs table REQUIRED - Table of user IDs to kick.
---@param callerID? string User ID of the caller, will apply permissions checks of the user. If empty defaults to system user and permission checks are bypassed.
---@return error error An optional error value if an error occurred.
function M.group_users_kick(groupID, userIDs, callerID)
end

--- List all members, admins and superadmins which belong to a group. This also list incoming join requests.
---@param groupID string REQUIRED - The ID of the group to list members for.
---@param limit? int The maximum number of entries in the listing.
---@param state? int The state of the user within the group. If unspecified this returns users in all states.
---@param cursor? string Pagination cursor from previous result. Don't set to start fetching from the beginning.
---@return table groupUsers The user information for members, admins and superadmins for the group. Also users who sent a join request.
---@return error error An optional error value if an error occurred.
function M.group_users_list(groupID, limit, state, cursor)
end

--- Promote users in a group.
---@param groupID string REQUIRED - The ID of the group whose members are being promoted.
---@param userIDs table REQUIRED - Table of user IDs to promote.
---@param callerID? string User ID of the caller, will apply permissions checks of the user. If empty defaults to system user and permission checks are bypassed.
---@return error error An optional error value if an error occurred.
function M.group_users_promote(groupID, userIDs, callerID)
end

--- List all groups which a user belongs to and whether they've been accepted or if it's an invitation.
---@param userID string REQUIRED - The ID of the user to list groups for.
---@param limit? int The maximum number of entries in the listing.
---@param state? int The state of the user within the group. If unspecified this returns users in all states.
---@param cursor? string An optional next page cursor that can be used to retrieve the next page of records (if any).
---@return table userGroups A table of groups with their fields.
---@return error error An optional error value if an error occurred.
function M.user_groups_list(userID, limit, state, cursor)
end

--- Registers a function to be run when a leaderboard resets.
---@param fn function REQUIRED - A function reference which will be executed on each leaderboard reset.
---@return error error An optional error value if an error occurred.
function M.register_leaderboard_reset(fn)
end

--- Registers a function that will be called when matchmaking finds opponents.
---@param fn function REQUIRED - A function reference which will be executed on each matchmake completion.
---@return error error An optional error value if an error occurred.
function M.register_matchmaker_matched(fn)
end

--- Register a function with the server which will be executed after every non-realtime message as specified while registering the function.
---@param fn function REQUIRED - A function reference which will be executed on each message.
---@param id string REQUIRED - The specific message name to execute the function after.
---@return error error An optional error value if an error occurred.
function M.register_req_after(fn, id)
end

--- Register a function with the server which will be executed before any non-realtime message with the specified message name.
---@param fn function REQUIRED - A function reference which will be executed on each message.
---@param id string REQUIRED - The specific message name to execute the function after.
---@return error error An optional error value if an error occurred.
function M.register_req_before(fn, id)
end

--- Registers a function for use with client RPC to the server.
---@param fn function REQUIRED - A function reference which will be executed on each RPC message.
---@param id string REQUIRED - The unique identifier used to register the function for RPC.
---@return error error An optional error value if an error occurred.
function M.register_rpc(fn, id)
end

--- Register a function with the server which will be executed after every realtime message with the specified message name.
---@param fn function REQUIRED - A function reference which will be executed on each msgname message.
---@param id string REQUIRED - The specific message name to execute the function after.
---@return error error An optional error value if an error occurred.
function M.register_rt_after(fn, id)
end

--- Register a function with the server which will be executed before any realtime message with the specified message name.
---@param fn function REQUIRED - A function reference which will be executed on each msgname message. The function should pass the payload input back as a return argument so the pipeline can continue to execute the standard logic.
---@param id string REQUIRED - The specific message name to execute the function after.
---@return error error An optional error value if an error occurred.
function M.register_rt_before(fn, id)
end

--- Registers a function to be run when the server received a shutdown signal. The function only fires if grace_period_sec > 0.
---@param fn function REQUIRED - A function reference which will be executed on server shutdown.
---@return error error An optional error value if an error occurred.
function M.register_shutdown(fn)
end

--- Registers a function to be run when a tournament ends.
---@param fn function REQUIRED - A function reference which will be executed on each tournament end.
---@return error error An optional error value if an error occurred.
function M.register_tournament_end(fn)
end

--- Registers a function to be run when a tournament resets.
---@param fn function REQUIRED - A function reference which will be executed on each tournament reset.
---@return error error An optional error value if an error occurred.
function M.register_tournament_reset(fn)
end

--- Registers a function to be run only once.
---@param fn function REQUIRED - A function reference which will be executed only once.
---@return error error An optional error value if an error occurred.
function M.run_once(fn)
end

--- Set up a new dynamic leaderboard with the specified ID and various configuration settings. The leaderboard will be created if it doesn't already exist, otherwise its configuration will not be updated.
---@param leaderboardID string REQUIRED - The unique identifier for the new leaderboard. This is used by clients to submit scores.
---@param authoritative bool REQUIRED - Mark the leaderboard as authoritative which ensures updates can only be made via the Go runtime. No client can submit a score directly.
---@param sortOrder? string The sort order for records in the leaderboard. Possible values are "asc" or "desc".
---@param operator? string The operator that determines how scores behave when submitted; possible values are "best", "set", or "incr".
---@param resetSchedule? string The cron format used to define the reset schedule for the leaderboard. This controls when a leaderboard is reset and can be used to power daily/weekly/monthly leaderboards.
---@param metadata? table The metadata you want associated to the leaderboard. Some good examples are weather conditions for a racing game.
---@param enableRanks? bool Whether to enable rank values for the leaderboard.
---@return error error An optional error value if an error occurred.
function M.leaderboard_create(leaderboardID, authoritative, sortOrder, operator, resetSchedule, metadata, enableRanks)
end

--- Delete a leaderboard and all scores that belong to it.
---@param id string REQUIRED - The unique identifier for the leaderboard to delete.
---@return error error An optional error value if an error occurred.
function M.leaderboard_delete(id)
end

--- Find leaderboards which have been created on the server. Leaderboards can be filtered with categories.
---@param limit? number Return only the required number of leaderboards denoted by this limit value.
---@param cursor? string Pagination cursor from previous result. Don't set to start fetching from the beginning.
---@return table leaderboardList A list of leaderboard results and possibly a cursor. If cursor is empty/nil there are no further results.
---@return error error An optional error value if an error occurred.
function M.leaderboard_list(limit, cursor)
end

--- Disable a leaderboard rank cache freeing its allocated resources. If already disabled is a NOOP.
---@param id string REQUIRED - The leaderboard id.
---@return error error An optional error value if an error occurred.
function M.leaderboard_ranks_disable(id)
end

--- Remove an owner's record from a leaderboard, if one exists.
---@param id string REQUIRED - The unique identifier for the leaderboard to delete from.
---@param ownerID string REQUIRED - The owner of the score to delete.
---@return error error An optional error value if an error occurred.
function M.leaderboard_record_delete(id, ownerID)
end

--- Fetch the list of leaderboard records around the owner.
---@param id string REQUIRED - The ID of the leaderboard to list records for.
---@param ownerID string REQUIRED - The owner ID around which to show records.
---@param limit? number Return only the required number of leaderboard records denoted by this limit value. Between 1-100.
---@param cursor? string Pagination cursor from previous result. Don't set to start fetching from the beginning.
---@param expiry? number Time since epoch in seconds. Must be greater than 0.
---@return table records A list of leaderboard records.
---@return string prevCursor An optional previous page cursor that can be used to retrieve the previous page of records (if any).
---@return string nextCursor An optional next page cursor that can be used to retrieve the next page of records (if any). Will be set to "" or nil when fetching last available page.
---@return error error An optional error value if an error occurred.
function M.leaderboard_records_haystack(id, ownerID, limit, cursor, expiry)
end

--- List records on the specified leaderboard, optionally filtering to only a subset of records by their owners. Records will be listed in the preconfigured leaderboard sort order.
---@param id string REQUIRED - The unique identifier for the leaderboard to list. Mandatory field.
---@param ownerIDs table REQUIRED - List of owners to filter to.
---@param limit? number The maximum number of records to return (Max 10,000).
---@param cursor? string Pagination cursor from previous result. Don't set to start fetching from the beginning.
---@param expiryOverride? number Records with expiry in the past are not returned unless within this defined limit. Must be equal or greater than 0. If 0, currently active records will be returned.
---@return table records A page of leaderboard records.
---@return table ownerRecords A list of owner leaderboard records (empty if the owners input parameter is not set).
---@return string nextCursor An optional next page cursor that can be used to retrieve the next page of records (if any). Will be set to "" or nil when fetching last available page.
---@return string prevCursor An optional previous page cursor that can be used to retrieve the previous page of records (if any).
---@return error error An optional error value if an error occurred.
function M.leaderboard_records_list(id, ownerIDs, limit, cursor, expiryOverride)
end

--- Build a cursor to be used with leaderboardRecordsList to fetch records starting at a given rank. Only available if rank cache is not disabled for the leaderboard.
---@param leaderboardID string REQUIRED - The unique identifier of the leaderboard.
---@param rank number REQUIRED - The rank to start listing leaderboard records from.
---@param expiryOverride? number Records with expiry in the past are not returned unless within this defined limit. Must be equal or greater than 0. If 0, currently active records will be returned.
---@return string leaderboardListCursor A string cursor to be used with leaderboardRecordsList.
---@return error error An optional error value if an error occurred.
function M.leaderboard_records_list_cursor_from_rank(leaderboardID, rank, expiryOverride)
end

--- Use the preconfigured operator for the given leaderboard to submit a score for a particular user.
---@param id string REQUIRED - The unique identifier for the leaderboard to submit to.
---@param ownerID string REQUIRED - The owner of this score submission.
---@param username? string The owner username of this score submission, if it's a user.
---@param score? number The score to submit.
---@param subscore? number A secondary subscore parameter for the submission.
---@param metadata? table The metadata you want associated to this submission. Some good examples are weather conditions for a racing game.
---@param overrideOperatorString? number An override operator for the new record. The accepted values include: 0 (no override), 1 (best), 2 (set), 3 (incr), 4 (decr).
---@return table record The newly created leaderboard record.
---@return error error An optional error value if an error occurred.
function M.leaderboard_record_write(id, ownerID, username, score, subscore, metadata, overrideOperatorString)
end

--- Fetch one or more leaderboards by ID.
---@param IDs table REQUIRED - The table array of leaderboard ids.
---@return table leaderboards The leaderboard records according to ID.
---@return error error An optional error value if an error occurred.
function M.leaderboards_get_id(IDs)
end

--- Write a DEBUG level message to the server logs.
---@param message string REQUIRED - The message to write to server logs with DEBUG level severity.
---@return error error An optional error value if an error occurred.
function M.logger_debug(message)
end

--- Write an ERROR level message to the server logs.
---@param message string REQUIRED - The message to write to server logs with ERROR level severity.
---@param vars any REQUIRED - Variables to replace placeholders in message.
---@return error error An optional error value if an error occurred.
function M.logger_error(message, vars)
end

--- Write an INFO level message to the server logs.
---@param message string REQUIRED - The message to write to server logs with INFO level severity.
---@param vars any REQUIRED - Variables to replace placeholders in message.
---@return error error An optional error value if an error occurred.
function M.logger_info(message, vars)
end

--- Write a WARN level message to the server logs.
---@param message string REQUIRED - The message to write to server logs with WARN level severity.
---@param vars any REQUIRED - Variables to replace placeholders in message.
---@return error error An optional error value if an error occurred.
function M.logger_warn(message, vars)
end

--- Create a new authoritative realtime multiplayer match running on the given runtime module name. The given params are passed to the match's init hook.
---@param module string REQUIRED - The name of an available runtime module that will be responsible for the match. This was registered in InitModule.
---@param params? any Any value to pass to the match init hook.
---@return string matchId The match ID of the newly created match. Clients can immediately use this ID to join the match.
---@return error error An optional error value if an error occurred.
function M.match_create(module, params)
end

--- Get information on a running match.
---@param id string REQUIRED - The ID of the match to fetch.
---@return table match Information for the running match.
---@return error error An optional error value if an error occurred.
function M.match_get(id)
end

--- List currently running realtime multiplayer matches and optionally filter them by authoritative mode, label, and current participant count.
---@param limit? number The maximum number of matches to list.
---@param authoritativeIn? bool Set true to only return authoritative matches, false to only return relayed matches and nil to return both.
---@param labelIn? string A label to filter authoritative matches by. Default "" means any label matches.
---@param minSize? number Inclusive lower limit of current match participants.
---@param maxSize? number Inclusive upper limit of current match participants.
---@param query? string Additional query parameters to shortlist matches.
---@return table match A table of matches matching the parameters criteria.
---@return error error An optional error value if an error occurred.
function M.match_list(limit, authoritativeIn, labelIn, minSize, maxSize, query)
end

--- Allow the match handler to be sent a reservation signal to mark a user ID or session ID into the match state ahead of their join attempt and eventual join flow. Called when the match handler receives a runtime signal.
---@param id string REQUIRED - The user ID or session ID to send a reservation signal for.
---@param data string REQUIRED - An arbitrary input supplied by the runtime caller of the signal.
---@return any state An (optionally) updated state. May be any non-nil value, or nil to end the match.
---@return string data Arbitrary data to return to the runtime caller of the signal. May be a string or nil.
---@return error error An optional error value if an error occurred.
function M.match_signal(id, data)
end

--- Add a custom metrics counter.
---@param name string REQUIRED - The name of the custom metrics counter.
---@param tags table REQUIRED - The metrics tags associated with this counter.
---@param delta number REQUIRED - An integer value to update this metric with.
function M.metrics_counter_add(name, tags, delta)
end

--- Add a custom metrics gauge.
---@param name string REQUIRED - The name of the custom metrics gauge.
---@param tags table REQUIRED - The metrics tags associated with this gauge.
---@param value number REQUIRED - A value to update this metric with.
function M.metrics_gauge_set(name, tags, value)
end

--- Add a custom metrics timer.
---@param name string REQUIRED - The name of the custom metrics timer.
---@param tags table REQUIRED - The metrics tags associated with this timer.
---@param value number REQUIRED - An integer value to update this metric with (in nanoseconds).
function M.metrics_timer_record(name, tags, value)
end

--- Delete one or more in-app notifications.
---@param notifications table REQUIRED - A list of notifications to be deleted.
---@return error error An optional error value if an error occurred.
function M.notifications_delete(notifications)
end

--- Delete notifications by their id.
---@param notificationIDs table REQUIRED - A list of notification ids.
---@param userID string REQUIRED - Optional userID to scope deletions to that user only.
---@return error error An optional error value if an error occurred.
function M.notifications_delete_id(notificationIDs, userID)
end

--- Send one in-app notification to a user.
---@param userID string REQUIRED - The user ID of the user to be sent the notification.
---@param subject string REQUIRED - Notification subject.
---@param contentMap table REQUIRED - Notification content. Must be set but can be an empty table.
---@param code number REQUIRED - Notification code to use. Must be equal or greater than 0.
---@param sender? string The sender of this notification. If left empty, it will be assumed that it is a system notification.
---@param persistent? bool Whether to record this in the database for later listing.
---@return error error An optional error value if an error occurred.
function M.notification_send(userID, subject, contentMap, code, sender, persistent)
end

--- Send an in-app notification to all users.
---@param subject string REQUIRED - Notification subject.
---@param content table REQUIRED - Notification content. Must be set but can be an empty table.
---@param code number REQUIRED - Notification code to use. Must be greater than or equal to 0.
---@param persistent? bool Whether to record this in the database for later listing.
---@return error error An optional error value if an error occurred.
function M.notification_send_all(subject, content, code, persistent)
end

--- Get notifications by their id.
---@param notificationIDs table REQUIRED - A list of notification ids.
---@param userID string REQUIRED - Optional userID to scope results to that user only.
---@return error error An optional error value if an error occurred.
function M.notifications_get_id(notificationIDs, userID)
end

--- List notifications by user id.
---@param userID string REQUIRED - Optional userID to scope results to that user only.
---@param limit? int Limit number of results. Must be a value between 1 and 1000.
---@param cursor? string Pagination cursor from previous result. Don't set to start fetching from the beginning.
---@return table notifications A list of notifications.
---@return string cursor A cursor to fetch the next page of results.
---@return error error An optional error value if an error occurred.
function M.notifications_list(userID, limit, cursor)
end

--- Send one or more in-app notifications to a user.
---@param notifications table REQUIRED - A list of notifications to be sent together.
---@return error error An optional error value if an error occurred.
function M.notifications_send(notifications)
end

--- Update notifications by their id.
---@param updates table REQUIRED - A list of notifications to be updated.
---@return error error An optional error value if an error occurred.
function M.notifications_update(updates)
end

--- Look up a purchase receipt by transaction ID.
---@param transactionID string REQUIRED - Transaction ID of the purchase to look up.
---@return table purchase A validated purchase and its owner.
---@return error error An optional error value if an error occurred.
function M.purchase_get_by_transaction_id(transactionID)
end

--- List stored validated purchase receipts.
---@param userID? string Filter by user ID. Can be an empty string to list purchases for all users.
---@param limit? number Limit number of records retrieved.
---@param cursor? string Pagination cursor from previous result. Don't set to start fetching from the beginning.
---@return table listPurchases A page of stored validated purchases and possibly a cursor. If cursor is empty/nil there are no further results.
---@return error error An optional error value if an error occurred.
function M.purchases_list(userID, limit, cursor)
end

--- Validates and stores the purchases present in an Apple App Store Receipt.
---@param userID string REQUIRED - The user ID of the owner of the receipt.
---@param receipt string REQUIRED - Base-64 encoded receipt data returned by the purchase operation itself.
---@param persist? bool Persist the purchase so that seenBefore can be computed to protect against replay attacks.
---@param passwordOverride? string Override the iap.apple.shared_password provided in your configuration.
---@return table validation The resulting successfully validated purchases. Any previously validated purchases are returned with a seenBefore flag.
---@return error error An optional error value if an error occurred.
function M.purchase_validate_apple(userID, receipt, persist, passwordOverride)
end

--- Validates and stores a purchase receipt from the Facebook Instant Games.
---@param userID string REQUIRED - The user ID of the owner of the receipt.
---@param signedRequest string REQUIRED - The Facebook Instant signedRequest receipt data.
---@param persist? bool Persist the purchase so that seenBefore can be computed to protect against replay attacks.
---@return table validation The resulting successfully validated purchases. Any previously validated purchases are returned with a seenBefore flag.
---@return error error An optional error value if an error occurred.
function M.purchase_validate_facebook_instant(userID, signedRequest, persist)
end

--- Validates and stores a purchase receipt from the Google Play Store.
---@param userID string REQUIRED - The user ID of the owner of the receipt.
---@param receipt string REQUIRED - JSON encoded Google receipt.
---@param persist? bool Persist the purchase so that seenBefore can be computed to protect against replay attacks.
---@param clientEmailOverride? string Override the iap.google.client_email provided in your configuration.
---@param privateKeyOverride? string Override the iap.google.private_key provided in your configuration.
---@return table validation The resulting successfully validated purchases. Any previously validated purchases are returned with a seenBefore flag.
---@return error error An optional error value if an error occurred.
function M.purchase_validate_google(userID, receipt, persist, clientEmailOverride, privateKeyOverride)
end

--- Validates and stores a purchase receipt from the Huawei App Gallery.
---@param userID string REQUIRED - The user ID of the owner of the receipt.
---@param signature string REQUIRED - The receipt signature.
---@param receipt string REQUIRED - The Huawei receipt data.
---@param persist? bool Persist the purchase so that seenBefore can be computed to protect against replay attacks.
---@return table validation The resulting successfully validated purchases. Any previously validated purchases are returned with a seenBefore flag.
---@return error error An optional error value if an error occurred.
function M.purchase_validate_huawei(userID, signature, receipt, persist)
end

--- Get the Satori client.
---@return table satori The satori client.
---@return error error An optional error value if an error occurred.
function M.getSatori()
end

--- Create a new identity.
---@param identifier string REQUIRED - The identifier of the identity.
---@param defaultProperties? table Default properties.
---@param customProperties? table Custom properties.
---@param noSession? bool Whether authenticate should skip session tracking.
---@param ipAddress string REQUIRED - An optional client IP address to pass on to Satori for geo-IP lookup.
---@return table properties Returned properties.
---@return error error An optional error value if an error occurred.
function M.satoriAuthenticate(identifier, defaultProperties, customProperties, noSession, ipAddress)
end

--- Publish an event.
---@param identifier string REQUIRED - The identifier of the identity.
---@param events table REQUIRED - An array of events to publish.
---@param ip string REQUIRED - Ip address.
---@return error error An optional error value if an error occurred.
function M.satoriEventsPublish(identifier, events, ip)
end

--- List experiments.
---@param identifier string REQUIRED - The identifier of the identity.
---@param names? table Optional list of experiment names to filter.
---@return table experiments The experiment list.
---@return error error An optional error value if an error occurred.
function M.satoriExperimentsList(identifier, names)
end

--- List flags.
---@param identifier string REQUIRED - The identifier of the identity. Set to empty string to fetch all default flag values.
---@param names? table Optional list of flag names to filter.
---@return table flags The flag list.
---@return error error An optional error value if an error occurred.
function M.satoriFlagsList(identifier, names)
end

--- List flags overrides.
---@param identifier string REQUIRED - The identifier of the identity. Set to empty string to fetch all default flag values.
---@param names? table Optional list of flag names to filter.
---@return table flagsOverrides The flag list.
---@return error error An optional error value if an error occurred.
function M.satoriFlagsOverridesList(identifier, names)
end

--- List live events.
---@param identifier string REQUIRED - The identifier of the identity.
---@param names? table Optional list of live event names to filter.
---@return table liveEvents The live event list.
---@return error error An optional error value if an error occurred.
function M.satoriLiveEventsList(identifier, names)
end

--- Delete message.
---@param identifier string REQUIRED - The identifier of the identity.
---@param messageID string REQUIRED - The identifier of the message.
---@return error error An optional error value if an error occurred.
function M.satoriMessageDelete(identifier, messageID)
end

--- List messages.
---@param identifier string REQUIRED - The identifier of the identity.
---@param limit? int The max number of messages to return.
---@param forward? bool True if listing should be older messages to newer, false if reverse.
---@param cursor? string A pagination cursor, if any.
---@return error error An optional error value if an error occurred.
function M.satoriMessagesList(identifier, limit, forward, cursor)
end

--- Update message.
---@param identifier string REQUIRED - The identifier of the identity.
---@param messageID string REQUIRED - The identifier of the message.
---@param readTime string REQUIRED - The time the message was read at the client.
---@param consumeTime string REQUIRED - The time the message was consumed by the identity.
---@return error error An optional error value if an error occurred.
function M.satoriMessageUpdate(identifier, messageID, readTime, consumeTime)
end

--- Get identity properties.
---@param identifier string REQUIRED - The identifier of the identity.
---@return table properties The identity properties.
---@return error error An optional error value if an error occurred.
function M.satoriPropertiesGet(identifier)
end

--- Update identity properties.
---@param identifier string REQUIRED - The identifier of the identity.
---@param properties table REQUIRED - The identity properties to update.
---@return error error An optional error value if an error occurred.
function M.satoriPropertiesUpdate(identifier, properties)
end

--- Disconnect a session.
---@param sessionID string REQUIRED - The ID of the session to be disconnected.
---@param reason []runtime.presencereason REQUIRED - The reason for the session disconnect.
---@return error error An optional error value if an error occurred.
function M.session_disconnect(sessionID, reason)
end

--- Log out a user from their current session.
---@param userID string REQUIRED - The ID of the user to be logged out.
---@param token string REQUIRED - The current session authentication token.
---@param refreshToken string REQUIRED - The current session refresh token.
---@return error error An optional error value if an error occurred.
function M.session_logout(userID, token, refreshToken)
end

--- Follow a player's status changes on a given session.
---@param sessionID string REQUIRED - A valid session identifier.
---@param userIDs table REQUIRED - A list of userIDs to follow.
---@return error error An optional error value if an error occurred.
function M.status_follow(sessionID, userIDs)
end

--- Unfollow a player's status changes on a given session.
---@param sessionID string REQUIRED - A valid session identifier.
---@param userIDs table REQUIRED - A list of userIDs to unfollow.
---@return error error An optional error value if an error occurred.
function M.status_unfollow(sessionID, userIDs)
end

--- Create a new storage index.
---@param indexName string REQUIRED - Name of the index to list entries from.
---@param collection string REQUIRED - Collection of storage engine to index objects from.
---@param key string REQUIRED - Key of storage objects to index. Set to empty string to index all objects of collection.
---@param fields table REQUIRED - A table of strings with the keys of the storage object whose values are to be indexed.
---@param sortableFields? table A table of strings with the keys of the storage object whose values are to be sortable. The keys must exist within the previously specified fields to be indexed.
---@param maxEntries int REQUIRED - Maximum number of entries kept in the index.
---@param indexOnly? bool Only index the storage object with the given key.
---@return error error An optional error value if an error occurred.
function M.register_storage_index(indexName, collection, key, fields, sortableFields, maxEntries, indexOnly)
end

--- List storage index entries
---@param indexName string REQUIRED - Name of the index to register filter function.
---@param fn function REQUIRED - A function reference which will be executed on each storage object to be written that is a candidate for the index.
---@return error error An optional error value if an error occurred.
function M.register_storage_index_filter(indexName, fn)
end

--- Remove one or more objects by their collection/keyname and optional user.
---@param keys table REQUIRED - A list of object identifiers to be deleted.
---@return error error An optional error value if an error occurred.
function M.storage_delete(keys)
end

--- List storage index entries
---@param index string REQUIRED - Name of the index to list entries from.
---@param query string REQUIRED - Query to filter index entries.
---@param limit int REQUIRED - Maximum number of results to be returned.
---@param orderTable? []string The storage object fields to sort the query results by. The prefix '-' before a field name indicates descending order. All specified fields must be indexed and sortable.
---@param callerID? string User ID of the caller, will apply permissions checks of the user. If empty defaults to system user and permission checks are bypassed.
---@param cursor? string A cursor to fetch the next page of results.
---@return table objects A list of storage objects.
---@return string objects A cursor, if there's a next page of results, nil otherwise.
---@return error error An optional error value if an error occurred.
function M.storage_index_list(index, query, limit, orderTable, callerID, cursor)
end

--- List records in a collection and page through results. The records returned can be filtered to those owned by the user or "" for public records.
---@param userID string REQUIRED - User ID to list records for or "" (empty string) | void for public records.
---@param collection string REQUIRED - Collection to list data from.
---@param limit? number Limit number of records retrieved.
---@param cursor? string Pagination cursor from previous result. Don't set to start fetching from the beginning.
---@param callerID? string User ID of the caller, will apply permissions checks of the user. If empty defaults to system user and permission checks are bypassed.
---@return table objects A list of storage objects.
---@return string cursor Pagination cursor.
---@return error error An optional error value if an error occurred.
function M.storage_list(userID, collection, limit, cursor, callerID)
end

--- Fetch one or more records by their bucket/collection/keyname and optional user.
---@param keys table REQUIRED - A table of object identifiers to be fetched.
---@return table objects A list of storage objects matching the parameters criteria.
---@return error error An optional error value if an error occurred.
function M.storage_read(keys)
end

--- Write one or more objects by their collection/keyname and optional user.
---@param keys table REQUIRED - A table of object identifiers to be written.
---@return table acks A list of acks with the version of the written objects.
---@return error error An optional error value if an error occurred.
function M.storage_write(keys)
end

--- Close a stream and remove all presences on it.
---@param streamTable table REQUIRED - A stream object consisting of a `mode` (int), `subject` (string), `descriptor` (string) and `label` (string).
---@return error error An optional error value if an error occurred.
function M.stream_close(streamTable)
end

--- Get a count of stream presences.
---@param streamTable table REQUIRED - A stream object consisting of a `mode` (int), `subject` (string), `descriptor` (string) and `label` (string).
---@return number countByStream Number of current stream presences.
---@return error error An optional error value if an error occurred.
function M.stream_count(streamTable)
end

--- Send data to presences on a stream.
---@param streamTable table REQUIRED - A stream object consisting of a `mode` (int), `subject` (string), `descriptor` (string) and `label` (string).
---@param data string REQUIRED - The data to send.
---@param presences table REQUIRED - Table of presences to receive the sent data. If not set, will be sent to all presences.
---@param reliable bool REQUIRED - Whether the sender has been validated prior.
---@return error error An optional error value if an error occurred.
function M.stream_send(streamTable, data, presences, reliable)
end

--- Send a message to presences on a stream.
---@param streamTable table REQUIRED - A stream object consisting of a `mode` (int), `subject` (string), `descriptor` (string) and `label` (string).
---@param envelope any REQUIRED - The message to send.
---@param presences table REQUIRED - Table of presences to receive the sent data. If not set, will be sent to all presences.
---@param reliable? bool Whether the sender has been validated prior.
---@return error error An optional error value if an error occurred.
function M.stream_send_raw(streamTable, envelope, presences, reliable)
end

--- Retrieve a stream presence and metadata by user ID.
---@param userID string REQUIRED - The user ID to fetch information for.
---@param sessionID string REQUIRED - The current session ID for the user.
---@param streamTable table REQUIRED - A stream object consisting of a `mode` (int), `subject` (string), `descriptor` (string) and `label` (string).
---@return table meta Presence and metadata for the user.
---@return error error An optional error value if an error occurred.
function M.stream_user_get(userID, sessionID, streamTable)
end

--- Add a user to a stream.
---@param userID string REQUIRED - The user ID to be added.
---@param sessionID string REQUIRED - The current session ID for the user.
---@param streamTable table REQUIRED - A stream object consisting of a `mode` (int), `subject` (string), `descriptor` (string) and `label` (string).
---@param hidden? bool Whether the user will be marked as hidden.
---@param persistence? bool Whether message data should be stored in the database.
---@param status? string User status message.
---@return bool success Whether the user was successfully added.
---@return error error An optional error value if an error occurred.
function M.stream_user_join(userID, sessionID, streamTable, hidden, persistence, status)
end

--- Kick user(s) from a stream.
---@param presences table REQUIRED - The presence(s) to be kicked.
---@param streamTable table REQUIRED - A stream object consisting of a `mode` (int), `subject` (string), `descriptor` (string) and `label` (string).
---@return error error An optional error value if an error occurred.
function M.stream_user_kick(presences, streamTable)
end

--- Remove a user from a stream.
---@param userID string REQUIRED - The user ID to be removed.
---@param sessionID string REQUIRED - The current session ID for the user.
---@param streamTable table REQUIRED - A stream object consisting of a `mode` (int), `subject` (string), `descriptor` (string) and `label` (string).
---@return error error An optional error value if an error occurred.
function M.stream_user_leave(userID, sessionID, streamTable)
end

--- List all users currently online and connected to a stream.
---@param streamTable table REQUIRED - A stream object consisting of a `mode` (int), `subject` (string), `descriptor` (string) and `label` (string).
---@param includeHidden? bool Include stream presences marked as hidden in the results.
---@param includeNotHidden? bool Include stream presences not marked as hidden in the results.
---@return Presence presences Table of stream presences and their information.
---@return error error An optional error value if an error occurred.
function M.stream_user_list(streamTable, includeHidden, includeNotHidden)
end

--- Update a stream user by ID.
---@param userID string REQUIRED - The user ID to be updated.
---@param sessionID string REQUIRED - The current session ID for the user.
---@param streamTable table REQUIRED - A stream object consisting of a `mode` (int), `subject` (string), `descriptor` (string) and `label` (string).
---@param hidden? bool Whether the user will be marked as hidden.
---@param persistence? bool Whether message data should be stored in the database.
---@param status? string User status message.
---@return error error An optional error value if an error occurred.
function M.stream_user_update(userID, sessionID, streamTable, hidden, persistence, status)
end

--- Look up a subscription by product ID.
---@param userID string REQUIRED - The user ID of the subscription owner.
---@param productID string REQUIRED - Transaction ID of the purchase to look up.
---@return table purchase A validated purchase and its owner.
---@return error error An optional error value if an error occurred.
function M.subscription_get_by_product_id(userID, productID)
end

--- List stored validated subscription receipts.
---@param userID? string Filter by user ID. Can be an empty string to list subscriptions for all users.
---@param limit? number Limit number of records retrieved.
---@param cursor? string Pagination cursor from previous result. Don't set to start fetching from the beginning.
---@return table listPurchases A page of stored validated subscriptions and possibly a cursor. If cursor is empty/nil there are no further results.
---@return error error An optional error value if an error occurred.
function M.subscriptions_list(userID, limit, cursor)
end

--- Validates and stores the subscription present in an Apple App Store Receipt.
---@param userID string REQUIRED - The user ID of the owner of the receipt.
---@param receipt string REQUIRED - Base-64 encoded receipt data returned by the subscription operation itself.
---@param persist? bool Persist the subscription.
---@param passwordOverride? string Override the iap.apple.shared_password provided in your configuration.
---@return table validation The resulting successfully validated subscriptions.
---@return error error An optional error value if an error occurred.
function M.subscription_validate_apple(userID, receipt, persist, passwordOverride)
end

--- Validates and stores a subscription receipt from the Google Play Store.
---@param userID string REQUIRED - The user ID of the owner of the receipt.
---@param receipt string REQUIRED - JSON encoded Google receipt.
---@param persist? bool Persist the subscription.
---@param clientEmailOverride? string Override the iap.google.client_email provided in your configuration.
---@param privateKeyOverride? string Override the iap.google.private_key provided in your configuration.
---@return table validation The resulting successfully validated subscriptions.
---@return error error An optional error value if an error occurred.
function M.subscription_validate_google(userID, receipt, persist, clientEmailOverride, privateKeyOverride)
end

--- Add additional score attempts to the owner's tournament record. This overrides the max number of score attempts allowed in the tournament for this specific owner.
---@param id string REQUIRED - The unique identifier for the tournament to update.
---@param ownerID string REQUIRED - The owner of the records to increment the count for.
---@param count number REQUIRED - The number of attempt counts to increment. Can be negative to decrease count.
---@return error error An optional error value if an error occurred.
function M.tournament_add_attempt(id, ownerID, count)
end

--- Set up a new dynamic tournament with the specified ID and various configuration settings. The underlying leaderboard will be created if it doesn't already exist, otherwise its configuration will not be updated.
---@param id string REQUIRED - The unique identifier for the new tournament. This is used by clients to submit scores.
---@param authoritative? bool Whether the tournament created is server authoritative.
---@param sortOrder? string The sort order for records in the tournament. Possible values are "asc" or "desc".
---@param operator? string The operator that determines how scores behave when submitted. The possible values are "best", "set", or "incr".
---@param resetSchedule? string The cron format used to define the reset schedule for the tournament. This controls when the underlying leaderboard resets and the tournament is considered active again.
---@param metadata? table The metadata you want associated to the tournament. Some good examples are weather conditions for a racing game.
---@param title? string The title of the tournament.
---@param description? string The description of the tournament.
---@param category? number A category associated with the tournament. This can be used to filter different types of tournaments. Between 0 and 127.
---@param startTime? number The start time of the tournament. Leave empty for immediately or a future time.
---@param endTime? number The end time of the tournament. When the end time is elapsed, the tournament will not reset and will cease to exist. Must be greater than startTime if set.
---@param duration number REQUIRED - The active duration for a tournament. This is the duration when clients are able to submit new records. The duration starts from either the reset period or tournament start time whichever is sooner. A game client can query the tournament for results between end of duration and next reset period.
---@param maxSize? number Maximum size of participants in a tournament.
---@param maxNumScore? number Maximum submission attempts for a tournament record.
---@param joinRequired bool REQUIRED - Whether the tournament needs to be joined before a record write is allowed.
---@param enableRanks? bool Whether to enable rank values for the tournament.
---@return error error An optional error value if an error occurred.
function M.tournament_create(id, authoritative, sortOrder, operator, resetSchedule, metadata, title, description,
                             category, startTime, endTime, duration, maxSize, maxNumScore, joinRequired, enableRanks)
end

--- Delete a tournament and all records that belong to it.
---@param id string REQUIRED - The unique identifier for the tournament to delete.
---@return error error An optional error value if an error occurred.
function M.tournament_delete(id)
end

--- A tournament may need to be joined before the owner can submit scores. This operation is idempotent and will always succeed for the owner even if they have already joined the tournament.
---@param id string REQUIRED - The unique identifier for the tournament to join.
---@param userID string REQUIRED - The owner of the record.
---@param username string REQUIRED - The username of the record owner.
---@return error error An optional error value if an error occurred.
function M.tournament_join(id, userID, username)
end

--- Find tournaments which have been created on the server. Tournaments can be filtered with categories and via start and end times.
---@param categoryStart number REQUIRED - Filter tournament with categories greater or equal than this value.
---@param categoryEnd number REQUIRED - Filter tournament with categories equal or less than this value.
---@param startTime? number Filter tournament with that start after this time.
---@param endTime? number Filter tournament with that end before this time.
---@param limit? number Return only the required number of tournament denoted by this limit value.
---@param cursor? string Pagination cursor from previous result. Don't set to start fetching from the beginning.
---@return table tournamentList A list of tournament results and possibly a cursor and possibly a cursor. If cursor is empty/nil there are no further results.
---@return error error An optional error value if an error occurred.
function M.tournament_list(categoryStart, categoryEnd, startTime, endTime, limit, cursor)
end

--- Disable a tournament rank cache freeing its allocated resources. If already disabled is a NOOP.
---@param id string REQUIRED - The tournament id.
---@return error error An optional error value if an error occurred.
function M.tournament_ranks_disable(id)
end

--- Remove an owner's record from a tournament, if one exists.
---@param id string REQUIRED - The unique identifier for the tournament to delete from.
---@param ownerID string REQUIRED - The owner of the score to delete.
---@return error error An optional error value if an error occurred.
function M.tournamentRecordDelete(id, ownerID)
end

--- Fetch the list of tournament records around the owner.
---@param id string REQUIRED - The ID of the tournament to list records for.
---@param ownerID string REQUIRED - The owner ID around which to show records.
---@param limit? number Return only the required number of tournament records denoted by this limit value. Between 1-100.
---@param cursor? string Pagination cursor from previous result. Don't set to start fetching from the beginning.
---@param expiry? number Time since epoch in seconds. Must be greater than 0.
---@return table records A page of tournament records.
---@return string prevCursor An optional previous page cursor that can be used to retrieve the previous page of records (if any).
---@return string nextCursor An optional next page cursor that can be used to retrieve the next page of records (if any). Will be set to "" or nil when fetching last available page.
---@return error error An optional error value if an error occurred.
function M.tournament_records_haystack(id, ownerID, limit, cursor, expiry)
end

--- List records on the specified tournament, optionally filtering to only a subset of records by their owners. Records will be listed in the preconfigured tournament sort order.
---@param tournamentID string REQUIRED - The ID of the tournament to list records for.
---@param ownerIDs? table List of owner IDs to filter results by.
---@param limitNumber number REQUIRED - Return only the required number of tournament records denoted by this limit value. Max is 10000.
---@param cursor? string Pagination cursor from previous result. Don't set to start fetching from the beginning.
---@param expiryOverride? number Records with expiry in the past are not returned unless within this defined limit. Must be equal or greater than 0. If 0, currently active records will be returned.
---@return table records A page of tournament records.
---@return table ownerRecords A list of owner tournament records (empty if the owners input parameter is not set).
---@return string prevCursor An optional previous page cursor that can be used to retrieve the previous page of records (if any).
---@return string nextCursor An optional next page cursor that can be used to retrieve the next page of records (if any). Will be set to "" or nil when fetching last available page.
---@return error error An optional error value if an error occurred.
function M.tournament_records_list(tournamentID, ownerIDs, limitNumber, cursor, expiryOverride)
end

--- Submit a score and optional subscore to a tournament leaderboard. If the tournament has been configured with join required this will fail unless the owner has already joined the tournament.
---@param id string REQUIRED - The unique identifier for the tournament leaderboard to submit to.
---@param ownerID string REQUIRED - The owner of this score submission.
---@param username? string The owner username of this score submission, if it's a user.
---@param score? number The score to submit.
---@param subscore? number A secondary subscore parameter for the submission.
---@param metadata? table The metadata you want associated to this submission. Some good examples are weather conditions for a racing game.
---@param overrideOperatorString? number An override operator for the new record. The accepted values include: 0 (no override), 1 (best), 2 (set), 3 (incr), 4 (decr).
---@return table result The newly created leaderboard record.
---@return error error An optional error value if an error occurred.
function M.tournament_record_write(id, ownerID, username, score, subscore, metadata, overrideOperatorString)
end

--- Fetch one or more tournaments by ID.
---@param tournamentIDs table REQUIRED - The table of tournament ids.
---@return table result List of tournament records.
---@return error error An optional error value if an error occurred.
function M.tournaments_get_id(tournamentIDs)
end

--- Update account, storage, and wallet information simultaneously.
---@param accountUpdates table REQUIRED - List of account information to be updated.
---@param storageWrites table REQUIRED - List of storage objects to be updated.
---@param storageDeletes table REQUIRED - A list of storage objects to be deleted.
---@param walletUpdates table REQUIRED - List of wallet updates to be made.
---@param updateLedger? bool Whether to record this wallet update in the ledger.
---@return table storageWriteAcks A list of acks with the version of the written objects.
---@return table walletUpdateAcks A list of wallet updates results.
---@return error error An optional error value if an error occurred.
function M.multi_update(accountUpdates, storageWrites, storageDeletes, walletUpdates, updateLedger)
end

--- Ban one or more users by ID.
---@param userIDs table REQUIRED - A table of user IDs to ban.
---@return error error An optional error value if an error occurred.
function M.users_ban_id(userIDs)
end

--- Get user's friend status information for a list of target users.
---@param userID string REQUIRED - The current user ID.
---@param userIDs table REQUIRED - An array of target user IDs.
---@return table friends A list of user friends objects.
---@return error error An optional error value if an error occurred.
function M.users_get_friend_status(userID, userIDs)
end

--- Fetch one or more users by ID.
---@param userIDs table REQUIRED - A Lua table of user IDs to fetch.
---@param facebookIDs []string REQUIRED - An array of Facebook IDs to fetch.
---@return table users A table of user record objects.
---@return error error An optional error value if an error occurred.
function M.users_get_id(userIDs, facebookIDs)
end

--- Fetch one or more users randomly.
---@param count int REQUIRED - The number of users to fetch.
---@return table users A list of user record objects.
---@return error error An optional error value if an error occurred.
function M.users_get_random(count)
end

--- Fetch one or more users by username.
---@param usernames table REQUIRED - A table of usernames to fetch.
---@return table users A table of user record objects.
---@return error error An optional error value if an error occurred.
function M.users_get_username(usernames)
end

--- Unban one or more users by ID.
---@param userIDs table REQUIRED - A table of user IDs to unban.
---@return error error An optional error value if an error occurred.
function M.users_unban_id(userIDs)
end

--- Decrypt an aes128 encrypted string.
---@param input string REQUIRED - The string to be decrypted.
---@param key string REQUIRED - The 16 Byte decryption key.
---@return string clearText The deciphered input.
---@return error error An optional error value if an error occurred.
function M.aes128_decrypt(input, key)
end

--- aes128 encrypt a string input.
---@param input string REQUIRED - The string which will be aes128 encrypted.
---@param key string REQUIRED - The 16 Byte encryption key.
---@return string cipherText The ciphered input.
---@return error error An optional error value if an error occurred.
function M.aes128_encrypt(input, key)
end

--- Decrypt an aes256 encrypted string.
---@param input string REQUIRED - The string to be decrypted.
---@param key string REQUIRED - The 32 Byte decryption key.
---@return string clearText The deciphered input.
---@return error error An optional error value if an error occurred.
function M.aes256_decrypt(input, key)
end

--- aes256 encrypt a string input.
---@param input string REQUIRED - The string which will be aes256 encrypted.
---@param key string REQUIRED - The 32 Byte encryption key.
---@return string cipherText The ciphered input.
---@return error error An optional error value if an error occurred.
function M.aes256_encrypt(input, key)
end

--- Decode a base16 encoded string.
---@param input string REQUIRED - The string to be decoded.
---@return string output Decoded string.
---@return error error An optional error value if an error occurred.
function M.base16_decode(input)
end

--- base16 encode a string input.
---@param input string REQUIRED - The string to be encoded.
---@return string output Encoded string.
---@return error error An optional error value if an error occurred.
function M.base16_encode(input)
end

--- Decode a base64 encoded string.
---@param input string REQUIRED - The string which will be base64 decoded.
---@param padding? bool Pad the string if padding is missing.
---@return string output Decoded string.
---@return error error An optional error value if an error occurred.
function M.base64_decode(input, padding)
end

--- Base64 encode a string input.
---@param input string REQUIRED - The string which will be base64 encoded.
---@param padding? bool Pad the string if padding is missing.
---@return string output Encoded string.
---@return error error An optional error value if an error occurred.
function M.base64_encode(input, padding)
end

--- Decode a base64 URL encoded string.
---@param input string REQUIRED - The string to be decoded.
---@param padding? bool Pad the string if padding is missing.
---@return string output Decoded string.
---@return error error An optional error value if an error occurred.
function M.base64url_decode(input, padding)
end

--- Base64 URL encode a string input.
---@param input string REQUIRED - The string which will be base64 URL encoded.
---@param padding? bool Pad the string if padding is missing.
---@return string output Encoded string.
---@return error error An optional error value if an error occurred.
function M.base64url_encode(input, padding)
end

--- Compare hashed input against a plaintext input.
---@param hash string REQUIRED - The bcrypted input string.
---@param plaintext string REQUIRED - Plaintext input to compare against.
---@return bool result True if they are the same, false otherwise.
---@return error error An optional error value if an error occurred.
function M.bcrypt_compare(hash, plaintext)
end

--- Generate one-way hashed string using bcrypt.
---@param input string REQUIRED - The input string to bcrypt.
---@return string hash Hashed string.
---@return error error An optional error value if an error occurred.
function M.bcrypt_hash(input)
end

--- Parses a CRON expression and a timestamp in UTC seconds, and returns the next matching timestamp in UTC seconds.
---@param expression string REQUIRED - A valid CRON expression in standard format, for example "0 0 * * *" (meaning at midnight).
---@param timestamp number REQUIRED - A time value expressed as UTC seconds.
---@return number next_timestamp The next UTC seconds timestamp (number) that matches the given CRON expression, and is immediately after the given timestamp.
---@return error error An optional error value if an error occurred.
function M.cron_next(expression, timestamp)
end

--- Parses a CRON expression and a timestamp in UTC seconds, and returns the previous matching timestamp in UTC seconds.
---@param expression string REQUIRED - A valid CRON expression in standard format, for example "0 0 * * *" (meaning at midnight).
---@param timestamp number REQUIRED - A time value expressed as UTC seconds.
---@return number prev_timestamp The previous UTC seconds timestamp (number) that matches the given CRON expression, and is immediately before the given timestamp.
---@return error error An optional error value if an error occurred.
function M.cron_prev(expression, timestamp)
end

--- Read file from user device.
---@param relPath string REQUIRED - Relative path to the file to be read.
---@return string fileContent The read file contents.
---@return error error An optional error value if an error occurred.
function M.file_read(relPath)
end

--- Create a HMAC-SHA256 hash from input and key.
---@param input string REQUIRED - The input string to hash.
---@param key string REQUIRED - The hashing key.
---@return string mac Hashed input as a string using the key.
---@return error error An optional error value if an error occurred.
function M.hmac_sha256_hash(input, key)
end

--- Send a HTTP request that returns a data type containing the result of the HTTP response.
---
---@param url string REQUIRED - The URL of the web resource to request.
---@param method string REQUIRED - The HTTP method verb used with the request.
---@param headers? table A table of headers used with the request.
---@param body? string The bytes to send with the request.
---@param timeout? number Timeout of the request in milliseconds.
---@param insecure? bool Set to true to skip request TLS validations.
---@return number code The HTTP response status code.
---@return table headers A table of HTTP response headers.
---@return string|table body The HTTP response body. This will be a string or a table if the content-type is JSON.
---@return error err An optional error value if an error occurred.
function M.http_request(url, method, headers, body, timeout, insecure)
end

--- Decode the JSON input as a Lua table.
---@param jsonString string REQUIRED - The JSON encoded input.
---@return table jsonData Decoded JSON input as a Lua table.
---@return error error An optional error value if an error occurred.
function M.json_decode(jsonString)
end

--- Encode the input as JSON.
---@param value any REQUIRED - The input to encode as JSON.
---@return string jsonBytes The encoded JSON string.
---@return error error An optional error value if an error occurred.
function M.json_encode(value)
end

--- Generate a JSON Web Token.
---@param signingMethod string REQUIRED - The signing method to be used, either HS256 or RS256.
---@param signingKey string REQUIRED - The signing key to be used.
---@param claims table REQUIRED - The JWT payload.
---@return string token The newly generated JWT.
---@return error error An optional error value if an error occurred.
function M.jqt_generate(signingMethod, signingKey, claims)
end

--- Create an md5 hash from the input.
---@param input string REQUIRED - The input string to hash.
---@return string hash A string with the md5 hash of the input.
---@return error error An optional error value if an error occurred.
function M.md5_hash(input)
end

--- Create a RSA encrypted SHA256 hash from the input.
---@param input string REQUIRED - The input string to hash.
---@param key string REQUIRED - The RSA private key.
---@return string signature A string with the RSA encrypted SHA256 hash of the input.
---@return error error An optional error value if an error occurred.
function M.rsaSHA256Hash(input, key)
end

--- Create an SHA256 hash from the input.
---@param input string REQUIRED - The input string to hash.
---@return string hash A string with the SHA256 hash of the input.
---@return error error An optional error value if an error occurred.
function M.sha256_hash(input)
end

--- Execute an arbitrary SQL query and return the number of rows affected. Typically an "INSERT", "DELETE", or "UPDATE" statement with no return columns.
---@param query string REQUIRED - A SQL query to execute.
---@param parameters table REQUIRED - Arbitrary parameters to pass to placeholders in the query.
---@return number count A list of matches matching the parameters criteria.
---@return error error An optional error value if an error occurred.
function M.sql_exec(query, parameters)
end

--- Execute an arbitrary SQL query that is expected to return row data. Typically a "SELECT" statement.
---@param query string REQUIRED - A SQL query to execute.
---@param parameters table REQUIRED - Arbitrary parameters to pass to placeholders in the query.
---@return table result A table of rows and the respective columns and values.
---@return error error An optional error value if an error occurred.
function M.sql_query(query, parameters)
end

--- Get the current UTC time in milliseconds using the system wall clock.
---@param tbl? table Unix epoch override.
---@return int t A number representing the current UTC time in milliseconds.
---@return error error An optional error value if an error occurred.
function M.time(tbl)
end

--- Convert the 16-byte raw representation of a UUID into the equivalent 36-character standard UUID string representation. Will raise an error if the input is not valid and cannot be converted.
---@param uuidBytes string REQUIRED - The UUID bytes to convert.
---@return string u A string containing the equivalent 36-character standard representation of the UUID.
---@return error error An optional error value if an error occurred.
function M.uuid_bytes_to_string(uuidBytes)
end

--- Convert the 36-character string representation of a UUID into the equivalent 16-byte raw UUID representation. Will raise an error if the input is not valid and cannot be converted.
---@param uuidString string REQUIRED - The UUID string to convert.
---@return string u A string containing the equivalent 16-byte representation of the UUID.
---@return error error An optional error value if an error occurred.
function M.uuid_string_to_bytes(uuidString)
end

--- Generate a version 4 UUID in the standard 36-character string representation.
---@return string u The newly generated version 4 UUID identifier string.
---@return error error An optional error value if an error occurred.
function M.uuid_v4()
end

--- List all wallet updates for a particular user from oldest to newest.
---@param userID string REQUIRED - The ID of the user to list wallet updates for.
---@param limit? number Limit number of results.
---@param cursor? string Pagination cursor from previous result. Don't set to start fetching from the beginning.
---@return table itemsTable A table containing wallet entries with Id, UserId, CreateTime, UpdateTime, Changeset, Metadata parameters.
---@return string newCursor Pagination cursor. Will be set to "" or nil when fetching last available page.
---@return error error An optional error value if an error occurred.
function M.wallet_ledger_list(userID, limit, cursor)
end

--- Update the metadata for a particular wallet update in a user's wallet ledger history. Useful when adding a note to a transaction for example.
---@param itemID string REQUIRED - The ID of the wallet ledger item to update.
---@param metadata table REQUIRED - The new metadata to set on the wallet ledger item.
---@return table itemTable The updated wallet ledger item.
---@return error error An optional error value if an error occurred.
function M.wallet_ledger_update(itemID, metadata)
end

--- Update one or more user wallets with individual changesets. This function will also insert a new wallet ledger item into each user's wallet history that tracks their update.
---@param updates table REQUIRED - The set of user wallet update operations to apply.
---@param updateLedger? bool Whether to record this update in the ledger.
---@return table updateWallets A list of wallet update results.
---@return error error An optional error value if an error occurred.
function M.wallets_update(updates, updateLedger)
end

--- Update a user's wallet with the given changeset.
---@param userID string REQUIRED - The ID of the user whose wallet to update.
---@param changeset table REQUIRED - The set of wallet operations to apply.
---@param metadata? table Additional metadata to tag the wallet update with.
---@param updateLedger? bool Whether to record this update in the ledger.
---@return table result The changeset after the update and before to the update, respectively.
---@return error error An optional error value if an error occurred.
function M.wallet_update(userID, changeset, metadata, updateLedger)
end

return M
