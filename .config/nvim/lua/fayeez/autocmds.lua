vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = {"Jenkinsfile*"},
    command = "set syn=on | set ft=groovy",
})

