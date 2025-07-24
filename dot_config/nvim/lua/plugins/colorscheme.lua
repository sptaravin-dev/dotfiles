return {
  { "ellisonleao/gruvbox.nvim" },
  { "catppuccin/nvim", name = "catppuccin", lazy = false },
  { "cocopon/iceberg.vim" },
  {
    "webhooked/kanso.nvim",
    lazy = false,
    priority = 1000,
  },

  -- Configure LazyVim to load colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanso-ink",
    },
  },
}
