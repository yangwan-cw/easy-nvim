-- Lazy.nvim 引导
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- 最新稳定版
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- 主入口：拆分基础配置到 lua 目录
require("basic")   -- 基础编辑行为
require("keymaps") -- 快捷键配置
require("plugins") -- 插件配置
