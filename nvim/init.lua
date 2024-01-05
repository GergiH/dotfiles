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
-- end


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
vim.opt.smartcase = true
-- end


-- custom keybinds
vim.g.mapleader = " "
-- end


require("lazy").setup({
    --"ellisonleao/gruvbox.nvim",
    --"rebelot/kanagawa.nvim",
    "oxfist/night-owl.nvim",
    {
        "nvim-lua/plenary.nvim",
        name = "plenary"
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "plenary"
        },
        keys = {
            { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Telescope file searcher" },
            { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Telescope grep in files" },
            { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Telescope buffer switcher" }
        },
        config = function()
            require("telescope").setup({
                defaults = {
                    file_ignore_patterns = { "obj", "bin", "node_modules" }
                }
            })
        end
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            vim.cmd("colorscheme rose-pine")
        end
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate"
    },
    -- Code completion
    {
        "neoclide/coc.nvim",
        branch = "release"
    }
})
