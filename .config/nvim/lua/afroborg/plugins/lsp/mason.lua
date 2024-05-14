return {
  'williamboman/mason.nvim',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
  },
  config = function()
    local mason = require 'mason'
    local mason_lspconfig = require 'mason-lspconfig'
    local mason_tool_installer = require 'mason-tool-installer'

    mason.setup()

    mason_lspconfig.setup {
      ensure_installed = {
        'tsserver',
        'html',
        'cssls',
        'tailwindcss',
        'svelte',
        'lua_ls',
        'graphql',
        'emmet_ls',
        'pyright',
        'rust_analyzer',
        'gopls',
      },
    }

    mason_tool_installer.setup {
      ensure_installed = {
        'prettier',
        'stylua',
        'isort',
        'black',
        -- 'rustfmt',
        'goimports',
        'ormolu',
        'sql-formatter',
        'pylint',
        'eslint_d',
        'stylelint',
        'htmlhint',
        'jsonlint',
        'yamllint',
        'markdownlint',
        'luacheck',
      },
    }
  end,
}
