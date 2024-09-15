require("mason").setup {
    ensure_installed = { "lua_ls", "pylsp", "clangd" },

}
local DEFAULT_SETTINGS = {
    automatic_installation = true,
}
