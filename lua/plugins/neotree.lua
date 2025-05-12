return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- optional but recommended
        "MunifTanjim/nui.nvim",
    },
    cmd = "Neotree",
    keys = {
        { "<leader>e", "<cmd>Neotree toggle<CR>", desc = "Toggle NeoTree" },
    },
    config = function()
        require("neo-tree").setup({
            close_if_last_window = true,
            popup_border_style = "rounded",
            enable_git_status = true,
            enable_diagnostics = true,
            sort_case_insensitive = true,
            window = {
                position = "right",
                width = 30,
                mappings = {
                    ["<space>"] = "toggle_node",
                    ["<cr>"] = "open",
                    ["S"] = "open_split",
                    ["s"] = "open_vsplit",
                    ["t"] = "open_tabnew",
                    ["C"] = "close_node",
                    ["z"] = "close_all_nodes",
                    ["R"] = "refresh",
                    ["a"] = {
                        "add",
                        config = {
                            show_path = "relative" -- "none", "relative", "absolute"
                        }
                    },
                    ["d"] = "delete",
                    ["r"] = "rename",
                    ["y"] = "copy_to_clipboard",
                    ["x"] = "cut_to_clipboard",
                    ["p"] = "paste_from_clipboard",
                    ["q"] = "close_window",
                }
            },
            filesystem = {
                filtered_items = {
                    visible = true,
                    hide_dotfiles = false,
                    hide_gitignored = true,
                },
                follow_current_file = {
                    enabled = true,
                },
                use_libuv_file_watcher = true,
            },
            buffers = {
                follow_current_file = {
                    enabled = true,
                },
            },
        })
    end,
}
