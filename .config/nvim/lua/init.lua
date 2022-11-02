print("Hello Fayeez Lua")
require("nvimtree")
require('plugins')
require('lsp')
require('treesitter')
vim.g.python3_host_prog = os.getenv("CONDA_PREFIX")..'/bin/python'
