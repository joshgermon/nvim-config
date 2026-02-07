return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("gitsigns").setup({
        signs = {
          add = { text = "▌" },
          change = { text = "▌" },
          delete = { text = "▁" },
          topdelete = { text = "▔" },
          changedelete = { text = "▌" },
        },
        signs_staged = {
          add = { text = "▌" },
          change = { text = "▌" },
          delete = { text = "▁" },
          topdelete = { text = "▔" },
          changedelete = { text = "▌" },
        },
        signs_staged_enable = true,
        signcolumn = true,
        numhl = false,
        linehl = false,
        word_diff = false,
        watch_gitdir = {
          follow_files = true,
        },
        attach_to_untracked = true,
        current_line_blame = true,
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = 'eol',
          delay = 1000,
          ignore_whitespace = false,
          virt_text_priority = 100,
        },
        current_line_blame_formatter = '<author>, <abbrev_sha> • <summary>',
        current_line_blame_formatter = "<author> • <abbrev_sha>",
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil,
        max_file_length = 40000,
        preview_config = {
          border = "rounded",
          style = "minimal",
          relative = "cursor",
          row = 0,
          col = 1,
        },
      })

      -- Set sign colors matching vague theme (green add, blue change, red delete)
      vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#5a7a5a", bg = "NONE" })
      vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#5a7a9a", bg = "NONE" })
      vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#8a5a5a", bg = "NONE" })
      vim.api.nvim_set_hl(0, "GitSignsAddNr", { fg = "NONE", bg = "NONE" })
      vim.api.nvim_set_hl(0, "GitSignsChangeNr", { fg = "NONE", bg = "NONE" })
      vim.api.nvim_set_hl(0, "GitSignsDeleteNr", { fg = "NONE", bg = "NONE" })
      
      -- Set subtle blame virtual text color (comment color)
      vim.api.nvim_set_hl(0, "GitSignsCurrentLineBlame", { fg = "#4a4a4a", bg = "NONE" })
    end,
  },
}
