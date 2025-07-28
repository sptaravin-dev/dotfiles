return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      layout_strategy = "vertical",
      layout_config = {
        preview_height = 0.7,
        vertical = {
          size = {
            width = "95%",
            height = "95%",
          },
        },
      },
    },
  },
}
