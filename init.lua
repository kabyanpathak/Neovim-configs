local keymap = vim.keymap
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.lazy")

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.clipboard:append("unnamedplus")
vim.opt.clipboard = "unnamedplus"

vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
