return {
  'nvim-telescope/telescope-file-browser.nvim',
  dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
  config = function()
    require('telescope').setup {
      defaults = {
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        hidden = { file_browser = true, folder_browser = true },
        prompt_prefix = ' >',
        color_devicons = true,
        file_previewer = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
        qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
        mappings = {
          i = {
            ['<C-x>'] = false,
            ['<C-q>'] = require('telescope.actions').send_to_qflist,
          },
        },
      },
    }
  end,
}
