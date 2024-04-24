return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("telescope").setup {
            pickers = {
                find_files = { prompt_prefix = "🔍 ", hidden = true },
                git_files = { prompt_prefix = "󰊢 " }
            }
        }
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
        vim.keymap.set("n", "<leader>fg", builtin.git_files, {})
        vim.keymap.set("n", "<leader>fs", builtin.live_grep, {})
    end
}
