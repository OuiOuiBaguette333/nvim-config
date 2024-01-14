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
                autocmd BufRead,BufNewFile *.cpp normal! 256G9|
        augroup END
]], false)

vim.api.nvim_exec([[
        augroup SetCcStartingLine
                autocmd!
                autocmd BufRead,BufNewFile *.cc normal! 40G9|
        augroup END
]], false)
local function hello()
  return [[樱]]
end

local function h2()
        return [[Oui Oui Oui Oui Oui Oui Oui Oui]]
end

require("lazy").setup({
        {
                "folke/tokyonight.nvim",
                lazy = false,
                priority = 1000,
                config = function()
                        vim.cmd([[colorscheme tokyonight-night]])
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
                                        theme = 'ayu_dark',
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
                                        lualine_b = {'branch', 'diff', 'diagnostics'},
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
                'willothy/veil.nvim',
                lazy = false,
                priority = 500,
                dependencies = {
                        -- All optional, only required for the default setup.
                        -- If you customize your config, these aren't necessary.
                        "nvim-telescope/telescope.nvim",
                        "nvim-lua/plenary.nvim",
                        "nvim-telescope/telescope-file-browser.nvim"
                },
                config = true,
                -- or configure with:
                -- opts = { ... }
        },
})

require("telescope").setup ({})
require("transparent").setup ({})
require("telescope").load_extension "file_browser"
require('competitest').setup({
        template_file = "~/.config/nvim/template.cpp",
        compile_command = {
                cpp = { exec = "g++", args = { "-O2", "-std=gnu++20",  "-DDEBUG", "-Wall", "-Wextra", "-Wshadow", "$(FNAME)", "-o", "$(FNOEXT)" } },
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

require("tokyonight").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
        light_style = "day", -- The theme is used when the background is set to light
        transparent = true, -- Enable this to disable setting the background color
        terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
        styles = {
                -- Style to be applied to different syntax groups
                -- Value is any valid attr-list value for `:help nvim_set_hl`
                comments = { italic = true },
                keywords = { italic = true },
                functions = {},
                variables = {},
                -- Background styles. Can be "dark", "transparent" or "normal"
                sidebars = "dark", -- style for sidebars, see below
                floats = "dark", -- style for floating windows
        },
        sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
        day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
        hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
        dim_inactive = false, -- dims inactive windows
        lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

        --- You can override specific color groups to use other groups or a hex color
        --- function will be called with a ColorScheme table
        ---@param colors ColorScheme
        on_colors = function(colors) end,

        --- You can override specific highlights to use other groups or a hex color
        --- function will be called with a Highlights and ColorScheme table
        ---@param highlights Highlights
        ---@param colors ColorScheme
        on_highlights = function(highlights, colors) end,
})
require("astre")


