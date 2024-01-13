vim.g.mapleader = " "

local km = vim.keymap

-- general

-- km.set("i", "jk", "<ESC>")

-- windows
km.set("n", "<leader>sv", "<C-w>v")
km.set("n", "<leader>sh", "<C-w>s")
km.set("n", "<leader>se", "<C-w>=")
km.set("n", "<leader>sx", ":close<CR>")

-- tabs
km.set("n", "<leader>to", ":tabnew<CR>")
km.set("n", "<leader>tx", ":tabclose<CR>")
km.set("n", "<leader>tn", ":tabn<CR>")
km.set("n", "<leader>tp", ":tabp<CR>")
