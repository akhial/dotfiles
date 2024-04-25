return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local lazy = require("lazy.status")
        require("lualine").setup({
            sections = {
                lualine_x = { { lazy.updates, cond = lazy.has_updates, color = { fg = "#ff9815" } }, "encoding", "filetype" },
            },
        })
    end,
}
