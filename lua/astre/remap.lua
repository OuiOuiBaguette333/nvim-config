vim.keymap.set("n", "<leader>v", "<c-w>v")
vim.keymap.set("n", "<tab>", "<c-w>w")
vim.keymap.set("n", "<s-tab>", "<c-w>W")
vim.keymap.set("n", "<c-b>", ":b#<cr>")
vim.keymap.set("n", "yyy", "gg\"+yG")
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<cr>")
vim.keymap.set("n", "<leader>p", ":CompetiTest receive problem<cr>")
vim.keymap.set("n", "pp", ":CompetiTest run<cr>")

vim.keymap.set({'n', 't'}, "<c-\\>", "<cmd>ToggleTerm direction=float<cr>")

vim.keymap.set("n", "<c-f>", ":RG<cr>")
vim.keymap.set("n", "<leader>w", ":UndotreeToggle<cr>")

vim.api.nvim_create_autocmd("FileType", {
        pattern = {'cpp'},
        callback = function(args)
                vim.keymap.set("n", "<leader>c", ":up<cr>:!g++ -O2 -std=gnu++20 -DDEBUG -DLOCAL -Wall -Wextra -Wshadow \"%\" -o \"%:r\"<cr>", { buffer = args.buf })
        end
})

-- vim.api.nvim_create_autocmd("FileType", {
--         pattern = {'cpp'},
--         callback = function(args)
--                 vim.keymap.set("n", "<leader><leader>", ":vsplit<cr><c-w>w:term \"./%:r\"<cr>", { buffer = args.buf })
--         end
-- })
--experiment
vim.api.nvim_exec([[
augroup FileTypeCPP
        autocmd!
        autocmd FileType cpp nnoremap <buffer> <leader><leader> :term ./<C-r>=expand('%:r')<CR><CR>
augroup END
]], true)


vim.api.nvim_set_keymap(
        "n",
        "<space>fb",
        ":Telescope file_browser<CR>",
        { noremap = true }
)

-- open file_browser with the path of the current buffer
vim.api.nvim_set_keymap(
        "n",
        "<space>fb",
        ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
        { noremap = true }
)
vim.keymap.set("n", "<leader>m", ":!sudo make<cr>")
