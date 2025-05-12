return {
    {
        'echasnovski/mini.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons', -- This adds icon support
        },
        config = function()
            local statusline = require('mini.statusline')
            statusline.setup({ use_icons = true })
        end
    }
}
