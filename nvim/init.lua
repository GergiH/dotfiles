-- lazy.nvim bootstrapper
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
-- end - lazy.nvim bootstrapper


-- generic settings
vim.opt.nu = true -- line numbers
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = true
vim.opt.scrolloff = 6
vim.opt.colorcolumn = "100"
vim.opt.termguicolors = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.ignorecase = true
vim.opt.listchars = { space = "·", tab = ">~" }
vim.opt.clipboard = 'unnamedplus' -- use global clipboard for yank / paste
-- end - generic settings


-- custom keybinds
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>LS", "<cmd>set list<cr>", {})
vim.keymap.set("n", "<leader>LH", "<cmd>set nolist<cr>", {})
-- black hole register for Change commands
local changeoptions = { noremap = true, silent = true }
vim.keymap.set('v', 'c', '"_c', changeoptions)
vim.keymap.set('v', 'C', '"_C', changeoptions)
vim.keymap.set('n', 'c', '"_c', changeoptions)
vim.keymap.set('n', 'C', '"_C', changeoptions)
-- end - custom keybinds


require("lazy").setup({
    -- themes
    {
        "ellisonleao/gruvbox.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            contrast = "hard"
        },
        config = function()
            vim.cmd("colorscheme gruvbox")
        end
    },
    -- end - themes

    -- better syntax highlighting
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate"
    },
    -- end - better syntax highlighting
})
