return {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
        require("nvim-tree").setup {
            view = {
                width = 40,
                relativenumber = true
            },
            renderer = {
                group_empty = true
            }
        }
        vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeFocus<CR>")
    end
}
