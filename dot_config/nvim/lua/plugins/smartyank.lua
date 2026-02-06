-- lua/plugins/smartyank.lua
return {
  "ibhagwan/smartyank.nvim",
  event = { "TextYankPost" },
  opts = {
    highlight = {
      enabled = true, -- briefly highlight yanked text
    },
    clipboard = {
      enabled = true,
    },
  },
}
