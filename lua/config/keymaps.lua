-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "jk", "<ESC>", { silent = true })

-- buffer
vim.keymap.set("n", "<leader>n", ":bn<CR>")
vim.keymap.set("n", "<leader>p", ":bp<CR>")
vim.keymap.set("n", "<leader>x", ":bd<CR>")

-- markdown preview
vim.keymap.set("n", "<leader>mp", ":MarkdownPreview<CR>")

-- Resize Windows
vim.keymap.set("n", "<C-S-h>", "<C-w><")
vim.keymap.set("n", "<C-S-j>", "<C-w>-")
vim.keymap.set("n", "<C-S-k>", "<C-w>+")
vim.keymap.set("n", "<C-S-l>", "<C-w>>")

-- Hop 설정
-- f/F/t/T 는 flash.nvim + vim 기본 동작(dt, 등)에 양보하고 <leader>h 프리픽스를 사용합니다.
vim.keymap.set({ "n", "x", "o" }, "<leader>hc", function()
  require("hop").hint_char1({ current_line_only = false })
end, { desc = "Hop: 문자 1개" })

vim.keymap.set({ "n", "x", "o" }, "<leader>ha", function()
  require("hop").hint_anywhere()
end, { desc = "Hop: 아무 위치" })

vim.keymap.set({ "n", "x", "o" }, "<leader>hp", function()
  require("hop").hint_patterns()
end, { desc = "Hop: 패턴" })

vim.keymap.set({ "n", "x", "o" }, "<leader>hw", function()
  require("hop").hint_words()
end, { desc = "Hop: 단어" })
