-- iceberg theme
return {
  -- Install iceberg
  { "cocopon/iceberg.vim", lazy = true },
  -- Tell LazyVim to pick iceberg as the default
  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "iceberg" },
  },
}

-- gruvbox-material theme
-- return {
--   "sainnhe/gruvbox-material",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     -- Optionally configure and load the colorscheme
--     -- directly inside the plugin declaration.
--     vim.g.gruvbox_material_enable_italic = true
--     vim.cmd.colorscheme("gruvbox-material")
--   end,
-- }
