local package = 'projekt0n/github-nvim-theme'
local theme_name = 'github_dark_dimmed'

return {
  package,
  lazy = false,
  priority = 1000,
  config = function()
    require('github-theme').setup()

    vim.cmd('colorscheme ' .. theme_name)
  end,
}
