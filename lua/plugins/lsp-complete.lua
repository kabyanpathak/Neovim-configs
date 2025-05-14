-- lua/plugins/lsp-complete.lua
return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "L3MON4D3/LuaSnip" },
            { "saadparwaiz1/cmp_luasnip" },
        },
        config = function()
            -- 1. Setup Mason
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "html",
                    "cssls",
                    "ts_ls",
                    "sqls",
                    "rust_analyzer",
                    "luacheck", -- Lua linter
                    "htmlhint", -- HTML linter
                    "csslint",  -- CSS linter (or consider 'stylelint')
                    "eslint_d", -- JavaScript/TypeScript linter (using daemonized version)
                    "sqlfluff", -- SQL linter/formatter
                },
                automatic_installation = true,
            })

            -- 2. Setup cmp
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-s>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<Tab>'] = cmp.mapping.confirm({ select = true }), -- Press tab to confirm completion
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                    { name = 'buffer' },
                    { name = 'path' },
                }),
            })

            -- 3. Setup LSP servers
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            require("mason-lspconfig").setup_handlers({
                function(server_name)
                    require("lspconfig")[server_name].setup({
                        capabilities = capabilities,
                    })
                end,
                ["rust_analyzer"] = function()
                    require("lspconfig").rust_analyzer.setup({
                        capabilities = capabilities,
                        on_attach = function(client, bufnr)
                            client.server_capabilities.documentFormattingProvider = false
                            client.server_capabilities.documentRangeFormattingProvider = false
                        end,
                        settings = {
                            ["rust-analyzer"] = {
                                enable = true,
                                completion = {
                                    autoimport = { enable = true }, -- Automatically import items when completing
                                },
                                cargo = { allFeatures = true },
                                procMacro = { enable = true },
                            }
                        }
                    })
                end
            })

            -- 4. Setup diagnostic icons
            local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
            end
        end,
    },
}
