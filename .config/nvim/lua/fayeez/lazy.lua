local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.6',
        dependencies = { 'nvim-lua/plenary.nvim' },
        keys = {
            { "<leader>pf", "<cmd>lua require('telescope.builtin').find_files()<cr>",                                    desc = "Find project files" },
            { "<C-p>",      "<cmd>lua require('telescope.builtin').git_files()<cr>",                                     desc = "Find git files" },
            { "<leader>ps", "<cmd>lua require('telescope.builtin').grep_string({search = vim.fn.input('Grep > ')})<cr>", desc = "Search grep with telescope" },
        }
    },
    {
        "rose-pine/neovim",
        name = "rose-pine-moon",
        config = function()
            color = color or "rose-pine-moon"
            print("hello color config")
            print(color)
            vim.cmd.colorscheme(color)

            vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        end
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = { "tsx", "java", "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "typescript", "html" },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end
    },
    {
        "ThePrimeagen/harpoon",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        keys = {
            { "<leader>a", "<cmd>lua require('harpoon.mark').add_file()<cr>",        desc = "Mark file with harpoon" },
            { "<C-a>",     "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Show harpoon marks" },

            { "<C-7>",     "<cmd>lua require('harpoon.ui').nav_file(1)<cr>",         desc = "Navigate to harpoon marked file 1" },
            { "<C-8>",     "<cmd>lua require('harpoon.ui').nav_file(2)<cr>",         desc = "Navigate to harpoon marked file 2" },
            { "<C-9>",     "<cmd>lua require('harpoon.ui').nav_file(3)<cr>",         desc = "Navigate to harpoon marked file 3" },
            { "<C-0>",     "<cmd>lua require('harpoon.ui').nav_file(4)<cr>",         desc = "Navigate to harpoon marked file 4" },
            { "<C-n>",     "<cmd>lua require('harpoon.ui').nav_next()<cr>",          desc = "Navigate to the next file in the list" },
            { "<C-m>",     "<cmd>lua require('harpoon.ui').nav_prev()<cr>",          desc = "Navigate to the previous file in the list" },
        }
    },
    {
        "mbbill/undotree",
        keys = {
            { "<leader>u", vim.cmd.UndotreeToggle, desc = "Toggle the Undo-Tree panel" }
        }
    },
    {
        "tpope/vim-fugitive",
        config = function()
            vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
            vim.keymap.set("n", "<leader>gp", function() vim.cmd('Git "pull"')end)
            vim.keymap.set("n", "<leader>gst", function() vim.cmd('Git "stash"')end)
        end
    },
    -- LSP
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        lazy = true,
        config = false,
        init = function()
            vim.g.lsp_zero_extend_cmp = 0
            vim.g.lsp_zero_extend_lspconfig = 0
        end
    },
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp' },
    { 'L3MON4D3/LuaSnip' },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    {
        'neovim/nvim-lspconfig',
        cmd = 'LspInfo',
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            { 'hrsh7th/cmp-nvim-lsp' },
        },
        config = function()
            print("LSP CONFIG")
            local lsp_zero = require('lsp-zero')

            lsp_zero.on_attach(function(client, bufnr)
                -- see :help lsp-zero-keybindings
                -- to learn the available actions
                lsp_zero.default_keymaps({ buffer = bufnr })
            end)

            local cmp = require('cmp')
            local cmp_select = { behavior = cmp.SelectBehavior.Select }
            local cmp_lsp = require("cmp_nvim_lsp")

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-n>'] = cmp.mapping.select_prev_item(cmp_select),
                    ['<C-m>'] = cmp.mapping.select_next_item(cmp_select),
                    ['<Enter>'] = cmp.mapping.confirm({ select = true }),
                    ["<C-Space>"] = cmp.mapping.complete(),
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' }, -- For luasnip users.
                }, {
                    { name = 'buffer' },
                })
            })


            require('mason').setup({})
            require('mason-lspconfig').setup({
                ensure_installed = { 'prettier', 'jdtls', 'tsserver', 'eslint', 'sumneko_lua' },
                handlers = {

                    -- this first function is the "default handler"
                    -- it applies to every language server without a "custom handler"
                    function(server_name)
                        require('lspconfig')[server_name].setup({})
                    end,

                    -- this is the "custom handler" for `jdtls`
                    -- noop is an empty function that doesn't do anything
                    jdtls = lsp_zero.noop,
                }
            })
        end
    },
    { 'mfussenegger/nvim-jdtls' },
    {
        "kdheepak/lazygit.nvim",
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        -- setting the keybinding for LazyGit with 'keys' is recommended in
        -- order to load the plugin when the command is run for the first time
        keys = {
            { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
        }
    },
})
