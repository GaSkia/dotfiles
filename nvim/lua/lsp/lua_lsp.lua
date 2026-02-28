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
            },
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
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
                typeCheckingMode = 'standard',
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

vim.lsp.config('rust-analyzer', {
    cmd = {'rust-analyzer'},
    filetypes = {'rust'},
    settings = {
        rust_analyzer = {
            imports = {
                granularity = {
                    group = "module",
                },
                prefix = "self",
            },
            cargo = {
                buildScripts = {
                    enable = true,
                },
            },
            procMacro = {
                enable = true
            },
        }
    }
})
vim.lsp.enable('rust-analyzer')

vim.lsp.config('postgres_lsp', {
    cmd = {"postgrestools", "lsp-proxy" },
    filetypes = {"sql"},
    root_markers = {"postgrestools.jsonc"},

})
vim.lsp.enable('postgres_lsp')

vim.lsp.config('csharp_ls', {
    cmd = {'/home/gaskia/.local/share/nvim/mason/packages/csharp-language-server/csharp-ls'},
    filetypes = {'cs'},
    root_markers = { {"sln", "csproj"}, "git" },
    settings = {
        csharp = {
            formatting = {
                enabled = true,
            },
            diagnostics = {
                enable = true,
            }
        }
    },
    on_attach = function(client, bufnr)
        vim.opt.colorcolumn = '120'
    end,
    on_detach = function(client, bufnr)
        vim.opt.colorcolumn = '80'
    end,
})
vim.lsp.enable('csharp_ls')

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = "*.axaml",
    command = "set filetype=xml"
})
-- vim.lsp.config('lemminx', {
--     cmd = {"lemminx"},
--     filetypes = {'xaml', 'xml'} --, 'axaml'}
-- })
-- INFO: lemminx is not enabled
-- vim.lsp.enable('lemminx')

vim.lsp.config('avalonia-ls', {
    cmd = {'avalonia-ls'},
    root_dir = vim.fn.getcwd(),
    filetypes = { 'axaml' },
    on_attach = function(client, bufnr)
        vim.o.tabstop = 2
        vim.o.softtabstop = 2
        vim.o.shiftwidth = 2
        vim.opt.colorcolumn = '0'
    end,
    on_detach = function(client, bufnr)
    end,
})
vim.lsp.enable('avalonia-ls')
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
	pattern = { "*.axaml" },
	callback = function(event)
		vim.lsp.start {
			name = "avalonia",
			cmd = { "avalonia-ls" },
			root_dir = vim.fn.getcwd(),
		}
	end
})
vim.filetype.add({
	extension = {
		axaml = "xml",
	},
})
-- TODO: implement linters and formatters for every language-server
vim.lsp.config('clang-format', {
    cmd = { 'clang-format',  },
    root_dir = vim.fn.getcwd(),
    root_markers = { 'git', { 'sln', 'csproj' }, },
    filetypes = { 'cs', 'cpp', 'c'},
})
vim.lsp.enable('clang-format')
vim.lsp.config('ast_grep', {
    cmd = { 'ast-grep' },
    root_dir = vim.fn.getcwd(),
    root_markers = { 'git', { 'sln', 'csproj' }, },
    filetypes = { 'cs', 'cpp', 'c'},

})
vim.lsp.enable('ast-grep')

local port = os.getenv 'GDScript_Port' or '6005'
local cmd = vim.lsp.rpc.connect('127.0.0.1', tonumber(port))

vim.lsp.config('gdscript', {
    cmd = cmd,
    filetypes = { 'gd', 'gdscript', 'gdscript3' },
    root_markers = { 'project.godot', '.git'},
})
vim.lsp.enable('gdscript')

