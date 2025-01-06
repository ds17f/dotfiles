-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
-- Unmap Alt-j and Alt-k
vim.api.nvim_set_keymap("", "<M-j>", "", { noremap = true, silent = true })
vim.api.nvim_set_keymap("", "<M-k>", "", { noremap = true, silent = true })
