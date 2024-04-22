return {
    {
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
    },
    {
        "neanias/everforest-nvim",
        version = false,
        lazy = false,
        priority = 1000, -- make sure to load this before all the other start plugins
    }
}
