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
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "macchiato", -- latte, frappe, macchiato, mocha
            })

            vim.cmd("colorscheme catppuccin")
            --vim.cmd([[highlight Normal guibg=NONE]])
            --vim.cmd([[highlight NonText guibg=NONE]])
            --vim.cmd([[highlight SignColumn guibg=NONE]])
        end
    },
    --{
    --    "rebelot/kanagawa.nvim",
    --    priority = 1000,
    --    config = function()
    --        vim.cmd("colorscheme kanagawa")
    --        vim.cmd([[highlight Normal guibg=NONE]])
    --        vim.cmd([[highlight NonText guibg=NONE]])
    --        vim.cmd([[highlight SignColumn guibg=NONE]])
    --    end
    --},
    -- end - themes

    -- file/buffer switcher, searcher
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
            { "<C-p>", "<cmd>Telescope find_files<cr>", desc = "Telescope file searcher" },
            { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Telescope grep in files" },
            { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Telescope buffer switcher" }
        },
        config = function()
            require("telescope").setup({
                defaults = {
                    -- hide C# and JS build folders
                    file_ignore_patterns = { "obj", "bin", "node_modules" }
                }
            })
        end
    },
    -- end - file/buffer switcher, searcher

    -- better syntax highlighting
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate"
    },
    -- end - better syntax highlighting

    -- file tree
    {
        "nvim-neo-tree/neo-tree.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- optional
            "MunifTanjim/nui.nvim"
        },
        keys = {
            { "<leader>e", ":Neotree toggle float<cr>", silent = true, desc = "Float file tree" },
            { "<leader><tab>", ":Neotree toggle left<cr>", silent = true, desc = "Left file tree" }
        }
    },
    -- end - file tree

    -- LSP
    {
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp"
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "hrsh7th/nvim-cmp"
        },
        config = function()
            local lspconfig = require("lspconfig")
            local mason = require("mason")

            mason.setup()

            --TODO: keymaps for all LSPs, autocompletion, go-to-definition, etc

            lspconfig.lua_ls.setup({})
            -- Current version of Omnisharp has an issue, if this is not needed comment out,
            -- or do a :MasonInstall omnisharp@v1.39.8 instead of getting the latest
            lspconfig.omnisharp.setup({
                capabilities = capabilities,
                cmd = { "dotnet", vim.fn.stdpath "data" .. "/mason/packages/omnisharp/libexec/OmniSharp.dll" },
                enable_import_completion = true,
                organize_imports_on_format = true,
                enable_roslyn_analyzers = true,
                root_dir = function ()
                    return vim.loop.cwd() -- current working directory
                end,
            })
        end
    }
    -- end - LSP
})
