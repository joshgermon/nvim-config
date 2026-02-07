return {
  { "ellisonleao/gruvbox.nvim", lazy = true },
  { "slugbyte/lackluster.nvim", lazy = true },
  { "webhooked/kanso.nvim", lazy = true },
  { "bettervim/yugen.nvim", lazy = true },
  { "ficcdaf/ashen.nvim", lazy = true },
  { "rose-pine/neovim", name = "rose-pine", lazy = true },
  { "ntk148v/komau.vim", name = "komau", lazy = true },
  {
    "kyza0d/xeno.nvim",
    config = function()
      require("xeno").new_theme("mclaren", {
        base = "#000000",
        accent = "#1a4d6b",
        contrast = 0.08,
      })
    end,
  },
}
