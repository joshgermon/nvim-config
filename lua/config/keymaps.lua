local map = vim.keymap.set

map("n", "J", "mzJ`z", { desc = "Join lines keep cursor" })

-- Better window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Clear search with <Esc>
map({ "i", "n" }, "<Esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

map("n", "<C-d>", "<C-d>zz", { desc = "Page down and center" })
map("n", "<C-u>", "<C-u>zz", { desc = "Page up and center" })

map("n", "<leader>y", "+y", { desc = "Yank to clipboard" })
map("n", "<leader>Y", "+Y", { desc = "Yank line to clipboard" })

map(
  "n",
  "<leader>s",
  ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",
  { desc = "Search and replace current word" }
)

-- Toggle inlay hints
map("n", "<leader>th", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle Inlay Hints" })

-- Toggle diagnostics
map("n", "<leader>td", function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = "Toggle Diagnostics" })
