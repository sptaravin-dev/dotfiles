return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      layout_strategy = "vertical",
      layout_config = {
        vertical = {
          preview_height = 0.7,
          size = {
            width = "95%",
            height = "95%",
          },
        },
      },
      file_ignore_patterns = {
        "%.git/",
        "node_modules/",
        "%.cache/",
        "%.local/",
        "%.npm/",
        "%.pyenv/",
        "%.Trash/",
        "Library/",
        "Applications/",
        "Downloads/",
        "Movies/",
        "Music/",
        "Pictures/",
        "Postman/",
        "go/pkg/",
        "%.docker/",
        "%.ansible/",
      },
    },
  },
}
