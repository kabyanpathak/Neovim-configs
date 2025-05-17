return {
    "trstringer/psql.nvim",
    name = "psql",
    config = function()
        require("psql")
    end,
    dependencies = { "nvim-lua/plenary.nvim" }
}

--Execute line under cursor (normal mode) <leader>-e
--Execute selection (visual mode) <leader>-e
--Execute current paragraph (normal mode) <leader>-r
--Close last result buffer <leader>-w
--Close all result buffers <leader>-W
--
--
--
--:PgRun (<leader>x)
--:PgCancel
--PgTemp to get a temporary SQL workspace
--PgGetTable
--PgGetFunction
--PgGetDatabase
