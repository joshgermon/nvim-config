return {
  {
    "mfussenegger/nvim-lint",
    lazy = false,
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      local lint = require("lint")

      lint.linters_by_ft = {
        lua = { "luacheck" },
        python = { "ruff" },
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescriptreact = { "eslint_d" },
      }

      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        callback = function()
          local linters = lint.linters_by_ft[vim.bo.filetype] or {}
          local has_linter = false
          for _, linter in ipairs(linters) do
            if vim.fn.executable(linter) == 1 then
              has_linter = true
              break
            end
          end
          if has_linter then
            lint.try_lint()
          end
        end,
      })
    end,
    keys = {
      {
        "<leader>cl",
        function()
          require("lint").try_lint()
        end,
        desc = "Lint",
      },
    },
  },

  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = vim.list_extend(opts.ensure_installed or {}, {
        "luacheck",
        "ruff",
        "eslint_d",
      })
    end,
  },
}
