return {
  {
    "echasnovski/mini.nvim",
    version = false,
    lazy = false,
    priority = 100,
    dependencies = { "echasnovski/mini.extra" },
    config = function()
      -- Icons
      require("mini.icons").setup()

      -- Trailspace
      require("mini.trailspace").setup()

      -- Indentscope
      require("mini.indentscope").setup({
        draw = {
          delay = 0,
          animation = require("mini.indentscope").gen_animation.none(),
        },
        options = {
          border = "both",
          try_as_border = true,
        },
        symbol = "│",
      })

      -- Set subtle indentscope color using vague theme comment color
      vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = "#3a3a3a", bg = "NONE" })

      -- Starter
      local starter = require("mini.starter")
      starter.setup({
        evaluate_single = true,
        items = {
          starter.sections.builtin_actions(),
          starter.sections.recent_files(5, false),
          starter.sections.recent_files(5, true),
        },
        content_hooks = {
          starter.gen_hook.adding_bullet(),
          starter.gen_hook.indexing("all", { "Builtin actions" }),
          starter.gen_hook.padding(3, 2),
        },
        header = [[
░░▒█░▄▀▄░▄▀▀░█▄█░░░▄▀▒▒██▀▒█▀▄░█▄▒▄█░▄▀▄░█▄░█
░▀▄█░▀▄▀▒▄██▒█▒█░▄░▀▄█░█▄▄░█▀▄░█▒▀▒█░▀▄▀░█▒▀█
        ]],
        footer = "",
      })

      -- Files
      require("mini.files").setup()

      -- Pick (fuzzy finder)
      require("mini.pick").setup({
        source = {
          items = nil,
          name = nil,
          cwd = nil,
        },
      })

      -- Extra (LSP pickers)
      require("mini.extra").setup()
    end,
    keys = {
      {
        "<leader>e",
        function()
          require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
        end,
        desc = "Explorer (mini.files)",
      },
      {
        "<leader>ff",
        function()
          require("mini.pick").builtin.files({
            tool = "fd",
            args = {
              "--no-ignore",
              "--exclude", ".git",
              "--exclude", "node_modules",
              "--exclude", "dist",
              "--exclude", "build",
              "--exclude", "target",
              "--exclude", ".next",
              "--exclude", "out",
              "--exclude", "coverage",
            },
          })
        end,
        desc = "Find Files",
      },
      {
        "<leader>sg",
        function()
          require("mini.pick").builtin.grep_live()
        end,
        desc = "Grep",
      },
      {
        "<leader>sh",
        function()
          require("mini.pick").builtin.help()
        end,
        desc = "Help Pages",
      },
      {
        "<leader>sb",
        function()
          require("mini.pick").builtin.buffers()
        end,
        desc = "Buffers",
      },
      {
        "<leader>so",
        function()
          require("mini.pick").builtin.oldfiles()
        end,
        desc = "Recent Files",
      },
      {
        "<leader>sc",
        function()
          require("mini.pick").builtin.colorschemes()
        end,
        desc = "Colorschemes",
      },
      {
        "<leader>sd",
        function()
          require("mini.pick").builtin.diagnostic()
        end,
        desc = "Diagnostics",
      },
      {
        "<leader>sw",
        function()
          require("mini.pick").builtin.grep({ pattern = vim.fn.expand("<cword>") })
        end,
        desc = "Word under cursor",
        mode = { "n", "v" },
      },
    },
  },
}
