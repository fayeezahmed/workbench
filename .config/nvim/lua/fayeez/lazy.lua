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
            require('rose-pine').setup({
                disable_background = true,
            })
            color = color or "rose-pine-moon"
            print("hello color config")
            print(color)
            vim.cmd.colorscheme("rose-pine")

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
                ensure_installed = { "groovy", "tsx", "java", "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "typescript", "html" },
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
        branch = "harpoon2",
        keys = {
            { "<leader>a",     "<cmd>lua require('harpoon').setup():list():add()<cr>",                                            desc = "Mark file with harpoon" },
            { "<C-h>",         "<cmd>lua require('harpoon').setup().ui:toggle_quick_menu(require('harpoon').setup():list())<cr>", desc = "Show Harpoon quick menu" },

            { "<C-7>",         "<cmd>lua require('harpoon').setup():list():select(1)<cr>",                                        desc = "Navigate to Harpoon marked file 1" },
            { "<C-8>",         "<cmd>lua require('harpoon').setup():list():select(2)<cr>",                                        desc = "Navigate to Harpoon marked file 2" },
            { "<C-9>",         "<cmd>lua require('harpoon').setup():list():select(3)<cr>",                                        desc = "Navigate to Harpoon marked file 3" },
            { "<C-0>",         "<cmd>lua require('harpoon').setup():list():select(4)<cr>",                                        desc = "Navigate to Harpoon marked file 4" },
            { "<C-n>",         "<cmd>lua require('harpoon').setup():list():next()<cr>",                                           desc = "Navigate to the next file in the list" },
            { "<C-m>",         "<cmd>lua require('harpoon').setup():list():prev()<cr>",                                           desc = "Navigate to the previous file in the list" },

            { "<leader><C-7>", "<cmd>lua require('harpoon').setup():list():replace_at(1)<cr>",                                    desc = "Replace Harpoon marked file 1" },
            { "<leader><C-8>", "<cmd>lua require('harpoon').setup():list():replace_at(2)<cr>",                                    desc = "Replace Harpoon marked file 2" },
            { "<leader><C-9>", "<cmd>lua require('harpoon').setup():list():replace_at(3)<cr>",                                    desc = "Replace Harpoon marked file 3" },
            { "<leader><C-0>", "<cmd>lua require('harpoon').setup():list():replace_at(4)<cr>",                                    desc = "Replace Harpoon marked file 4" },
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
            vim.keymap.set("n", "<leader>gp", function() vim.cmd('Git "pull"') end)
            vim.keymap.set("n", "<leader>gst", function() vim.cmd('Git "stash"') end)
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
                ensure_installed = { 'jdtls', 'tsserver', 'eslint', 'cucumber_language_server' },
                handlers = {

                    -- this first function is the "default handler"
                    -- it applies to every language server without a "custom handler"
                    function(server_name)
                        require('lspconfig')[server_name].setup({})
                    end,

                    -- this is the "custom handler" for `jdtls`
                    -- noop is an empty function that doesn't do anything
                    jdtls = lsp_zero.noop,

                    cucumber_language_server = {
                        cucumber = {
                            features = { "**/*.feature" },
                            glue = { "**/steps/*.java", "**/StepDefinitions/*.cs" },
                        },
                        --on_attach = function(client, bufnr)
                        --    vim.keymap.set('n', "<C-]>", vim.lsp.buf.textDocument, { buffer = 0 })
                        --    vim.keymap.set('n', "gn", vim.diagnostic.goto_next, { buffer = 0 })
                        --    vim.keymap.set('n', "gb", vim.diagnostic.goto_prev, { buffer = 0 })
                        --end
                    },
                }
            })
        end
    },
    { "tpope/vim-cucumber" },

    { 'mfussenegger/nvim-jdtls', dependencies = { "mfussenegger/nvim-dap" } },
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
    {
        'sbdchd/neoformat',
        init = function ()
            vim.g.neoformat_try_node_exe = 1
        end
    },
})
