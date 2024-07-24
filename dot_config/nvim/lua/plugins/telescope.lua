return {
  "nvim-telescope/telescope.nvim",
  opts = {
    pickers = {
      grep_string = {
        additional_args = { "--hidden", "--glob", "!.git" },
      },
      live_grep = {
        additional_args = { "--hidden", "--glob", "!.git" },
      },
    },
  },
}
