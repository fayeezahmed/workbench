return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        cucumber_language_server = {
          settings = {
            features = { "src/features/**/*.feature" },
            glue = { "src/steps/**/*.ts" },
          },
        },
      },
    },
  },
}
