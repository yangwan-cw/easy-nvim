-- 基础编辑行为
local opt = vim.opt

opt.number = true
opt.relativenumber = true

-- 允许在未保存的情况下切换/隐藏缓冲区，避免 E37 报错
opt.hidden = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.smartindent = true
opt.wrap = false

opt.termguicolors = true
opt.cursorline = true
opt.signcolumn = "yes"

opt.clipboard = "unnamedplus"
opt.splitright = true
opt.splitbelow = true

