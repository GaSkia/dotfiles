vim.lsp.config('lua_ls', {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_markers = {
        { ".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", "selene.yml", ".git" }
    },
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            }
        }
    }
})
vim.lsp.enable('lua_ls')

vim.lsp.config('ts_ls', {
    cmd = { 'typescript-language-server', '--stdio' },
    filetypes = {
        'typescript',
        'typescriptreact',
        'javascript',
        'javascriptreact',
    },
    root_markers = {
        { 'app', 'src', },
        '.git',
    },
    settings = {
        initializationOptions = {
            comletionDisableFilterText = false,
            disableAutomaticTypingAcquisition = false,
            maxTsServerMemory = 4096,
            npmLocation = '/usr/bin/npm',
            locale = 'en_us.UTF-8',
            plugins = { },
            preferences = { },
            supporstMoveToFileCodeAction = {}
        },

        format = {
            baseIndentSize = 2,
            convertTabsToSpace = true,
            indentSize = 2,
            indentStyle = 'Block',
            insertSpaceAfterCommaDelimiter = true,
            insertSpaceAfterKeywordsInControlFlowStatements = true,
        },
        tsserver = {

        }
    }
})

vim.lsp.enable('ts_ls')

vim.lsp.config('pyright', {
    cmd = { 'pyright-langserver', '--stdio' },
    filetypes = { 'python' },
    root_markers = {
        'main.py',
        { 'src', 'app' },
        '.git',
    },
    settings = {
        python = {
            analysis = {
                autoImportCompletions = true,
                autoSearchPaths = true,
                diagnosticMode = 'workspace',
                logLevel = "Information",
                typeCheckingMode = 'strict',
                useLibraryCodeForTypes = true,
            },
        },
        pyright = {
            disableLanguageServices = false,
            disableOrganizeImports = false,
            disableTaggedHints = false,
            openFilesOnly = false
        }
    }
})

vim.lsp.enable('pyright')

vim.lsp.config('docker_language_server', {
    cmd = { 'docker-language-server', 'start', '--stdio' },
    filetypes = { 'docker', 'yaml', 'docker-compose.yml', 'Dockerfile', },
})

vim.lsp.enable('docker_language_server')

