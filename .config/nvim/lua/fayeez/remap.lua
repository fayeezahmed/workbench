vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.api.nvim_set_keymap('n', '<Leader>y', ":let @+=expand('%:p')<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>sv', ":execute \"source \" . expand(\"~/.config/nvim/init.lua\")<CR>", {noremap = true, silent = true})
vim.keymap.set('n', '<leader>dn',vim.diagnostic.goto_next, { noremap = true, silent = true, desc = "Go to next diagnostic" })
vim.keymap.set('n', '<leader>dp',vim.diagnostic.goto_prev, { noremap = true, silent = true, desc = "Go to previous diagnostic" })



