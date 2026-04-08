return {
  {
    "benlubas/molten-nvim",
    version = "^1.0.0", -- pin <2.0.0 to avoid breaking changes
    build = ":UpdateRemotePlugins",
    init = function()
      vim.g.molten_output_win_max_height = 12
    end,
  },
}
