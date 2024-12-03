return {
    "williamboman/mason.nvim",
    opts = {
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            }
        },
        ensure_installed = { 'lua_ls', 'pylsp', 'clangd' },
        automatic_installation = true,
    }
}
