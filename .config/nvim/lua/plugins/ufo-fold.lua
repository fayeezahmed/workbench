return {
  "kevinhwang91/nvim-ufo",
  requires = {
    "kevinhwang91/promise-async",
  },
  opts = function(_, opts)
    vim.o.foldcolumn = "1" -- '0' is not bad
    vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true

    provider_selector = function(bufnr, filetype, buftype)
      return { "treesitter", "indent" }
    end
  end,
}
