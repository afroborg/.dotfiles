-- local package = 'projekt0n/github-nvim-theme'
-- local theme_name = 'github_dark_dimmed'
--
local package = 'catppuccin/nvim'
local theme_name = 'catppuccin-mocha'

return {
  package,
  lazy = false,
  priority = 1000,
  config = function()
    require('catppuccin').setup {
      integrations = {
        mason = true,
        neotree = true,
      },
    }

    vim.cmd('colorscheme ' .. theme_name)
  end,
}
