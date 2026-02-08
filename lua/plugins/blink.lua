return {
  {
    "saghen/blink.cmp",
    lazy = false,
    dependencies = "rafamadriz/friendly-snippets",
    version = "1.*",
    config = function()
      require("blink.cmp").setup({
        fuzzy = {
          prebuilt_binaries = {
            download = true,
          },
        },
        keymap = {
          preset = "default",
          ["<Tab>"] = { "select_next", "fallback" },
          ["<S-Tab>"] = { "select_prev", "fallback" },
          ["<CR>"] = { "accept", "fallback" },
          ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
          ["<C-e>"] = { "hide" },
          ["<Up>"] = { "select_prev", "fallback" },
          ["<Down>"] = { "select_next", "fallback" },
        },
        completion = {
          menu = {
            border = "rounded",
            winhighlight = "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
          },
          documentation = {
            auto_show = true,
            window = {
              border = "rounded",
            },
          },
        },
        signature = {
          enabled = true,
          window = {
            border = "rounded",
          },
        },
        sources = {
          default = { "lsp", "path", "snippets", "buffer" },
        },
      })
    end,
  },
}
