local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
  { import = 'afroborg.plugins' },
  { import = 'afroborg.plugins.lsp' },
  { 'HiPhish/rainbow-delimiters.nvim' },
  { 'tpope/vim-fugitive' },
  { 'mbbill/undotree' },
}

local opts = {
  checker = {
    enable = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
}

local status, lazy = pcall(require, 'lazy')

if not status then
  return
end

return lazy.setup(plugins, opts)
