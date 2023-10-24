return {
  "scalameta/nvim-metals",
  name = "metals",
  ft = { "scala", "sbt", "java", "maven" },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
    -- stylua: ignore
    keys = {
      { "<leader>cW", function () require('metals').hover_worksheet() end, desc = "Metals Worksheet" },
      { "<leader>cM", function () require('telescope').extensions.metals.commands() end, desc = "Telescope Metals Commands" },
    },
  init = function()
    local metals_config = require("metals").bare_config()
    local map = vim.keymap.set

    -- LSP mappings
    map("n", "gD", vim.lsp.buf.definition)
    map("n", "K", vim.lsp.buf.hover)
    map("n", "gi", vim.lsp.buf.implementation)
    map("n", "gr", vim.lsp.buf.references)
    map("n", "gds", vim.lsp.buf.document_symbol)
    map("n", "gws", vim.lsp.buf.workspace_symbol)
    map("n", "<leader>cl", vim.lsp.codelens.run)
    map("n", "<leader>sh", vim.lsp.buf.signature_help)
    map("n", "<leader>rn", vim.lsp.buf.rename)
    map("n", "<leader>f", vim.lsp.buf.format)
    map("n", "<leader>ca", vim.lsp.buf.code_action)

    map("n", "<leader>ws", function()
      require("metals").hover_worksheet()
    end)

    -- all workspace diagnostics
    map("n", "<leader>aa", vim.diagnostic.setqflist)

    -- all workspace errors
    map("n", "<leader>ae", function()
      vim.diagnostic.setqflist({ severity = "E" })
    end)

    -- all workspace warnings
    map("n", "<leader>aw", function()
      vim.diagnostic.setqflist({ severity = "W" })
    end)

    -- buffer diagnostics only
    map("n", "<leader>d", vim.diagnostic.setloclist)

    map("n", "[c", function()
      vim.diagnostic.goto_prev({ wrap = false })
    end)

    map("n", "]c", function()
      vim.diagnostic.goto_next({ wrap = false })
    end)

    -- Example mappings for usage with nvim-dap. If you don't use that, you can
    -- skip these
    map("n", "<leader>dc", function()
      require("dap").continue()
    end)

    map("n", "<leader>dr", function()
      require("dap").repl.toggle()
    end)

    map("n", "<leader>dK", function()
      require("dap.ui.widgets").hover()
    end)

    map("n", "<leader>dt", function()
      require("dap").toggle_breakpoint()
    end)

    map("n", "<leader>dso", function()
      require("dap").step_over()
    end)

    map("n", "<leader>dsi", function()
      require("dap").step_into()
    end)

    map("n", "<leader>dl", function()
      require("dap").run_last()
    end)

    metals_config.settings = {
      showImplicitArguments = true,
      showImplicitConversionsAndClasses = true,
      showInferredType = true,
      superMethodLensesEnabled = true,
    }
    metals_config.init_options.statusBarProvider = "on"
    metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

    local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "scala", "sbt", "maven" },
      callback = function()
        require("metals").initialize_or_attach(metals_config)
      end,
      group = nvim_metals_group,
    })
  end,
}
