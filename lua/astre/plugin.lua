require('nvim-treesitter.configs').setup {
        ensure_installed = { "c", "lua", "vim", "cpp", "python", "cuda" },

        highlight = {
                enable = true,
        },
}



require('Comment').setup({
        toggler = {
                line = '//',
        },
        opleader = {
                line = '/',
        },
})

vim.g.loaded_netrw = 0
vim.g.loaded_netrwPlugin = 0

require("nvim-tree").setup {
        filters = {
                dotfiles = false,
        },
        git = {
                enable = true,
                ignore = false,
                timeout = 5000,
        }
}

require("toggleterm").setup {}

local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
        lsp_zero.default_keymaps({buffer = bufnr})

        vim.keymap.set("n", "lf", function() vim.lsp.buf.format() end, {buffer = bufnr})
        vim.keymap.set("n", "lr", function() vim.lsp.buf.references() end, {buffer = bufnr})
        vim.keymap.set("n", "ln", function() vim.lsp.buf.rename() end, {buffer = bufnr})
        vim.keymap.set("n", "ld", function() vim.lsp.buf.definition() end, {buffer = bufnr})
        vim.keymap.set("n", "la", function() vim.lsp.buf.code_action() end, {buffer = bufnr})
end)

local luasnip = require 'luasnip'
local cmp = require 'cmp'
cmp.setup {
        snippet = {
                expand = function(args)
                        luasnip.lsp_expand(args.body)
                end,
        },
        mapping = cmp.mapping.preset.insert({
                ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
                ['<C-d>'] = cmp.mapping.scroll_docs(4), -- Down
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<CR>'] = cmp.mapping.confirm {
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true,
                },
                ['<Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                                cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                                luasnip.expand_or_jump()
                        else
                                fallback()
                        end
                end, { 'i', 's' }),
                ['<S-Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                                cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                                luasnip.jump(-1)
                        else
                                fallback()
                        end
                end, { 'i', 's' }),
        }),
        sources = {
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
        },
}

require('lspconfig').clangd.setup {}
require("lspconfig").bashls.setup {}
