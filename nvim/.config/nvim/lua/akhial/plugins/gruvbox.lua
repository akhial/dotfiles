return {
    "ellisonleao/gruvbox.nvim",
    config = function()
        require("gruvbox").setup({
            strings = false,
            comments = true,
            operators = false,
            folds = false
        })
        vim.cmd("colorscheme gruvbox")
    end
}
