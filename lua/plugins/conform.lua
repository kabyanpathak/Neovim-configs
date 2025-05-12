return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            "<leader>f",
            function()
                require("conform").format({ async = true, lsp_fallback = true })
            end,
            desc = "Format buffer",
        },
    },
    opts = {
        -- Define formatters here
        formatters_by_ft = {
            lua = { "stylua" },
            python = { "isort", "black" },
            javascript = { "prettier" },
            typescript = { "prettier" },
            css = { "css_beautify" },
            html = { "html_beautify" },
            java = { "google-java-format" },
            c = { "clang_format" },
            cpp = { "clang_format" },
            go = { "gofmt", "goimports" },
            sql = { "pg_format" },
            rust = { "rustfmt" },
        },
        -- Set up format-on-save
        format_on_save = {
            timeout_ms = 500,
            lsp_fallback = true,
        },
    },
}
