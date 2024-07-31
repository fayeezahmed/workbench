local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

-- to learn how to use mason.nvim
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {},
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
  },
})

-- File: lua/user/lsp/configs.lua (or wherever you prefer to keep custom LSP configs)
--local lspconfig = require('lspconfig')
--
--
--local home = os.getenv('HOME')
--local workspace_folder = home .. "/.workspace/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
--local jdtls_path = '/path/to/jdtls'  -- Modify this path as necessary
--
--local config = {
--  cmd = {
--    -- Modify these paths and options according to your Java installation
--    '/path/to/java', 
--    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
--    '-Dosgi.bundles.defaultStartLevel=4',
--    '-Declipse.product=org.eclipse.jdt.ls.core.product',
--    '-Dlog.level=ALL',
--    '-Xms1g',
--    '--add-modules=ALL-SYSTEM',
--    '--add-opens=java.base/java.util=ALL-UNNAMED',
--    '--add-opens=java.base/java.lang=ALL-UNNAMED',
--    '-jar', jdtls_path .. '/plugins/org.eclipse.equinox.launcher_VERSION.jar',
--    '-configuration', jdtls_path .. '/config_linux',
--    '-data', workspace_folder
--  },
--  root_dir = lspconfig.util.root_pattern(".git", "mvnw", "gradlew"),
--  settings = {
--    java = {}
--  },
--  on_attach = function(client, bufnr)
--    require('lsp-zero').on_attach(client, bufnr)
--    -- Additional setup can be done here, like key mappings and buffer options
--  end
--}
--
--lspconfig.jdtls.setup(config)

