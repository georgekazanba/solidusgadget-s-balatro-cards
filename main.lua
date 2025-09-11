--- STEAMODDED HEADER
--- MOD_NAME: solidusgadget_'s balatro cards
--- MOD_ID: SOLIDUS_CARDS
--- MOD_AUTHOR: [solidusgadget_]
--- MOD_DESCRIPTION: 101 guys
--- PREFIX: xmpl
--- 
--- MOD CODE ---

SMODS.Atlas({
    key = "CustomJokers",
    path = "Stas.png",
    px=71,
    py=95,
    atlas_table = "ASSET_ATLAS"
}):register()

local function load_jokers_folder()
    local mod_path = SMODS.current_mod.path
    local jokers_path = mod_path .. "/jokers"
    local files = NFS.getDirectoryItemsInfo(jokers_path)
    for i = 1, #files do
        local file_name = files[i].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("jokers/" .. file_name))()
        end
    end
end

load_jokers_folder()

--- MOD CODE END ---