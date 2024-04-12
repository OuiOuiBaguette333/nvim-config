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
vim.cmd("au BufNewFile *.cpp 0r ~/.config/nvim/template.cpp")
vim.cmd("au BufNewFile *.cc 0r ~/.config/nvim/tcc.cc")
vim.g.mapleader = " "
-- Set starting line for C++ files
vim.api.nvim_exec([[
augroup SetCppStartingLine
autocmd!
autocmd BufRead,BufNewFile *.cpp normal! 23G9|
augroup END
]], false)

vim.api.nvim_exec([[
augroup SetCcStartingLine
autocmd!
autocmd BufRead,BufNewFile *.cc normal! 5G9|
augroup END
]], false)
local function hello()
        return [[影]]
end

local function h2()
        return [[Oui Oui Oui Oui Oui Oui Oui Oui]]
end
local function h3()
        return [[luv louis king]]
end
require("lazy").setup({
        -- {
                --         "folke/tokyonight.nvim",
                --         lazy = false,
                --         priority = 1000,
                --         config = function()
                        --                 vim.cmd([[colorscheme tokyonight-night]])
                        --         end,
                        -- },
                        -- {
                                -- 	"lycuid/vim-far",
                                -- 	-- lazy = false,
                                -- 	-- priority = 1000,
                                -- 	-- config = function()
                                        -- 	-- 	vim.cmd([[colorscheme far]])
                                        -- 	-- end,
                                        -- },
                                        { 
                                                "loctvl842/monokai-pro.nvim",
                                                lazy = false,
                                                priority = 1000,
                                                config = function()
                                                        vim.cmd([[colorscheme monokai-pro]])
                                                end,
                                        },

                                        {
                                                "hoob3rt/lualine.nvim",
                                                dependencies = { "nvim-tree/nvim-web-devicons" },
                                                event = { "BufEnter" },
                                                config = function()
                                                        require('lualine').setup {
                                                                options = {
                                                                        icons_enabled = true,
                                                                        theme = 'powerline_dark',
                                                                        component_separators = { left = '', right = ''},
                                                                        section_separators = { left = '', right = ''},
                                                                        disabled_filetypes = {
                                                                                statusline = {},
                                                                                winbar = {},
                                                                        },
                                                                        ignore_focus = {},
                                                                        always_divide_middle = true,
                                                                        globalstatus = false,
                                                                        refresh = {
                                                                                statusline = 1000,
                                                                                tabline = 1000,
                                                                                winbar = 1000,
                                                                        }
                                                                },
                                                                sections = {
                                                                        lualine_a = {'mode'},
                                                                        lualine_b = {'branch', 'diagnosis'},
                                                                        lualine_c = {'filename'},
                                                                        lualine_x = {h2, hello, 'filetype'},
                                                                        lualine_y = {'progress'},
                                                                        lualine_z = {'location'}
                                                                },
                                                                inactive_sections = {
                                                                        lualine_a = {},
                                                                        lualine_b = {},
                                                                        lualine_c = {'filename'},
                                                                        lualine_x = {'location'},
                                                                        lualine_y = {},
                                                                        lualine_z = {}
                                                                },
                                                                tabline = {},
                                                                winbar = {},
                                                                inactive_winbar = {},
                                                                extensions = {}
                                                        }
                                                end,
                                        },
                                        {
                                                'xeluxee/competitest.nvim',
                                                dependencies = 'MunifTanjim/nui.nvim',
                                                config = function() require('competitest').setup() end,
                                        },

                                        "nvim-treesitter/nvim-treesitter",
                                        'nvim-tree/nvim-tree.lua',
                                        'nvim-tree/nvim-web-devicons',
                                        'akinsho/toggleterm.nvim',
                                        'mbbill/undotree',
                                        'ervandew/supertab',
                                        'numToStr/Comment.nvim',
                                        'lukas-reineke/indent-blankline.nvim',

                                        'junegunn/fzf',
                                        'junegunn/fzf.vim',
                                        'eandrju/cellular-automaton.nvim',
                                        'xiyaowong/transparent.nvim',


                                        {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
                                        {'neovim/nvim-lspconfig'},
                                        {'hrsh7th/cmp-nvim-lsp'},
                                        {'hrsh7th/nvim-cmp'},
                                        {'rafamadriz/friendly-snippets'},
                                        {'L3MON4D3/LuaSnip'},
                                        {'ggandor/lightspeed.nvim'},
                                        {'nvim-telescope/telescope.nvim'},
                                        {'nvim-lua/plenary.nvim'},
                                        {
                                                "nvim-telescope/telescope-file-browser.nvim",
                                                dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
                                        },
                                        {
                                                'nvimdev/dashboard-nvim',
                                                event = 'VimEnter',
                                                config = function()
                                                        require('dashboard').setup {
                                                                -- config
                                                        }
                                                end,
                                                dependencies = { {'nvim-tree/nvim-web-devicons'}}
                                        },
                                })

                                require("telescope").setup ({})
                                require("transparent").setup ({})
                                require("telescope").load_extension "file_browser"
                                require('competitest').setup({
                                        template_file = "~/.config/nvim/template.cpp",
                                        compile_command = {
                                                cpp = { exec = "g++", args = { "-O2", "-std=gnu++20",  "-DDEBUG", "-DLOCAL", "-Wall", "-Wextra", "-Wshadow", "$(FNAME)", "-o", "$(FNOEXT)" } },
                                        },
                                        popup_ui = {
                                                total_width = 0.8,
                                                total_height = 0.8,
                                                layout = {
                                                        { 1, {
                                                                { 1, "so" },
                                                                { 1, {
                                                                        { 1, "tc" },
                                                                        { 1, "se" },
                                                                } },
                                                        } },
                                                        { 1, {
                                                                { 1, "eo" },
                                                                { 1, "si" },
                                                        } },
                                                }
                                        }
                                })
                                -- vim.opt.termguicolors = true
                                -- vim.cmd("colorscheme far")
require("astre")


