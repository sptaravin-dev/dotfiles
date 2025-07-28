return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      layout_strategy = "vertical",
      layout_config = {
        mirror = true, -- Preview above the results
        preview_height = 0.6, -- Adjust to your liking
        height = 0.9,
        prompt_position = "bottom",
      },
    },
  },
}
