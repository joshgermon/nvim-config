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

-- Show diagnostic float
map("n", "<leader>d", function()
  vim.diagnostic.open_float(nil, { focusable = true })
end, { desc = "Show diagnostic" })

-- Code actions
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
map("v", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })

-- LSP navigation
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
map("n", "gr", function()
  require("mini.extra").pickers.lsp({ scope = "references" })
end, { desc = "Find References" })
map("n", "gD", vim.lsp.buf.declaration, { desc = "Go to Declaration" })
map("n", "gi", function()
  require("mini.extra").pickers.lsp({ scope = "implementation" })
end, { desc = "Go to Implementation" })
map("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename Symbol" })
map("n", "<leader>ss", function()
  require("mini.extra").pickers.lsp({ scope = "document_symbol" })
end, { desc = "Document Symbols" })
map("n", "<leader>sS", function()
  require("mini.extra").pickers.lsp({ scope = "workspace_symbol" })
end, { desc = "Workspace Symbols" })
