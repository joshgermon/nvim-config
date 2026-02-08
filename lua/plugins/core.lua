return {
  {
    "vague2k/vague.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("vague").setup({
        transparent = false,
        style = {
          comments = "italic",
          strings = "italic",
        },
        colors = {
          bg = "#000000",
        },
      })
      vim.cmd([[colorscheme vague]])
      vim.api.nvim_set_hl(0, "Normal", { bg = "#000000" })
      vim.api.nvim_set_hl(0, "NormalNC", { bg = "#000000" })

      -- Dim diagnostic virtual text colors (must be after colorscheme)
      vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = "#8b5757", bg = "none" })
      vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { fg = "#8b7355", bg = "none" })
      vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { fg = "#5f7d8b", bg = "none" })
      vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { fg = "#5f8b7d", bg = "none" })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.config").setup({
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "typescript", "css", "html", "rust", "go" },
        highlight = { enable = true },
        indent = { enable = true }, 
      })
    end,
  },
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Git Diffview" },
      { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "File History" },
    }
  },
}
