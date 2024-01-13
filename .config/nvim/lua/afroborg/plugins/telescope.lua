return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
  },
  config = function()
    local telescope = require 'telescope'
    local config = require 'telescope.config'

    local args = { unpack(config.values.vimgrep_arguments) }

    table.insert(args, '--hidden')
    table.insert(args, '--glob')
    table.insert(args, '!**/.git/*')

    telescope.setup {
      defaults = {
        mappings = {
          i = {
            ['<C-f>'] = require('telescope.actions').preview_scrolling_down,
            ['<C-d>'] = require('telescope.actions').preview_scrolling_up,
          },
        },
      },
      pickers = {
        find_files = {
          -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
          hidden = true,
          follow = true,
          no_ignore = true,
          file_ignore_patterns = { '.git/' },
          find_command = { 'rg', '--files', '--hidden', '--glob', '!.git' },
        },
      },
    }

    telescope.load_extension 'fzf'

    -- telescope

    vim.keymap.set('n', '<leader>sf', '<cmd>Telescope find_files<cr>')
    vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
    vim.keymap.set('n', '<leader>sg', '<cmd>Telescope git_files<cr>')
    vim.keymap.set('n', '<leader>st', '<cmd>Telescope live_grep<cr>')
    vim.keymap.set('n', '<leader>sw', '<cmd>Telescope grep_string<cr>')
    vim.keymap.set('n', '<leader>fb', '<cmd>Telescope file_browser<cr>')
  end,
}
