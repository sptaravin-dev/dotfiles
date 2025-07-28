-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Enable true color support
vim.opt.termguicolors = true

-- Set cursor color in Normal mode
vim.cmd([[highlight Cursor guifg=#14171d guibg=#e2a478]])
