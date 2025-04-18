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
-- disabling netrw is advised by NvimTree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- end - generic settings


-- custom keybinds
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>LS", "<cmd>set list<cr>", {})
vim.keymap.set("n", "<leader>LH", "<cmd>set nolist<cr>", {})

-- navigate between left-right windows
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true })

-- black hole register for Change commands
local changeoptions = { noremap = true, silent = true }
vim.keymap.set('v', 'c', '"_c', changeoptions)
vim.keymap.set('v', 'C', '"_C', changeoptions)
vim.keymap.set('n', 'c', '"_c', changeoptions)
vim.keymap.set('n', 'C', '"_C', changeoptions)
vim.keymap.set('v', 'p', 'P', { noremap = true })

-- nvim-tree
vim.keymap.set('n', '<leader>e', ':NvimTreeFindFileToggle<CR>', { noremap = true, silent = true})
-- end - custom keybinds


require("lazy").setup({
    -- themes
    {
        "zenbones-theme/zenbones.nvim",
        lazy = false,
        priority = 1000,
        -- you can set set configuration options here
        config = function()
            vim.opt.background = 'light'
            vim.g.zenbones_compat = 1
            vim.g.zenbones_darken_comments = 45
            vim.cmd.colorscheme('zenbones')
        end
    },
    -- end - themes

    -- better syntax highlighting
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate"
    },
    -- end - better syntax highlighting

    -- file tree
    {
        "nvim-tree/nvim-tree.lua",
        config = function()
            require("nvim-tree").setup({
                sort = {
                    sorter = "case_sensitive",
                },
                view = {
                    width = 30,
                },
                renderer = {
                    group_empty = true,
                },
                filters = {
                    dotfiles = true,
                },
            })
        end
    },
    -- end - file tree

    -- cool stuff
    {
        "sphamba/smear-cursor.nvim",
        config = function()
            require('smear_cursor').enabled = true
        end
    },
    -- end - cool stuff
})
