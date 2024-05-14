return {
  'windwp/nvim-autopairs',
  event = { "InsertEnter" },
  dependencies = {
    "ms-jpg/coq_nvim"
  },
  config = function()
    local autopairs = require "nvim-autopairs"

    autopairs.setup {
      check_ts = true,
      ts_config = {
        lua = { "string" },
        javascript = { "template_string" },
        java = false
      }
    }

    vim.api.nvim_set_keymap("i", "<CR>", "v:lua.MPairs.autopairs_cr()", { expr = true, noremap = true })

    _G.MPairs = {
      autopairs_cr = function()
        if vim.fn.pumvisible() == 1 and vim.fn.complete_info().selected ~= -1 then
          return vim.fn["compe#confirm"]()
        else
          return require("nvim-autopairs").autopairs_cr()
        end
      end
    }
  end,
}
