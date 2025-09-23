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

-- Hop 설정 (안전하게)
local ok, hop = pcall(require, "hop")
if ok then
  local directions = require("hop.hint").HintDirection

  vim.keymap.set("", "f", function()
    hop.hint_char1({ current_line_only = false })
  end, { remap = true })

  vim.keymap.set("", "F", function()
    hop.hint_anywhere() -- 수정됨: 불필요한 ({}) 제거
  end, { remap = true })

  vim.keymap.set("", "t", function()
    hop.hint_patterns() -- 수정됨: ()({}) → ()
  end, { remap = true })
else
  vim.notify("Hop plugin not found. Please install it first.", vim.log.levels.WARN)
end
