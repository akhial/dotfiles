if vim.g.neovide == true then
    vim.opt.guifont = "JetbrainsMono Nerd Font:h10"
    vim.keymap.set("n", "<F11>", ":let g:neovide_fullscreen = !g:neovide_fullscreen<CR>")
end
