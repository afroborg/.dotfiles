return {
  'ms-jpq/coq_nvim',
  branch = 'coq',
  event = 'InsertEnter',
  dependencies = {
    { 'ms-jpq/coq.artifacts',  branch = 'artifacts' },
    { 'ms-jpq/coq.thirdparty', branch = '3p' },
  },
  init = function()
    require 'coq_3p' {
      { src = 'bc', short_name = 'MATH', precision = 6 },
    }

    vim.g.coq_settings = {
      auto_start = true,
      ['display.preview.border'] = 'solid',
      ['clients.lsp.resolve_timeout'] = 20,
      ['clients.lsp.always_on_top'] = {},
    }
  end,
}
