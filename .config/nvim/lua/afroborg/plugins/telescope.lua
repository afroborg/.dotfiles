return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  event = 'VimEnter',
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

    local actions = require 'telescope.actions'

    telescope.setup {
      defaults = {
        mappings = {
          i = {
            ['<esc>'] = actions.close,
            ['<C-j>'] = actions.move_selection_next,
            ['<C-k>'] = actions.move_selection_previous,
            ['C-q'] = actions.send_to_qflist + actions.open_qflist,
          },
        },
      },
      pickers = {
        find_files = {
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
