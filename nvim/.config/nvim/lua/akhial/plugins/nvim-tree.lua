return {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("nvim-tree").setup {
            view = {
                width = 40
            },
            renderer = {
                group_empty = true
            }
        }
    end
}
