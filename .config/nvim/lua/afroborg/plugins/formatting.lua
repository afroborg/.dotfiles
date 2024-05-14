return {
  "stevearc/conform.nvim",
  event = {"BufReadPre", "BufNewFile"},
  config = function()
    local conform = require "conform"

    conform.setup({
      formatters_by_ft = {
        javascript = {"pretter"},
        typescript = {"prettier"},
        javascriptreqct = {"prettier"},
        typescriptreact = {"prettier"},
        json = {"prettier"},
        yaml = {"prettier"},
        markdown = {"prettier"},
        html = {"prettier"},
        css = {"prettier"},
        scss = {"prettier"},
        less = {"prettier"},
        graphql = {"prettier"},
        lua = {"stylua"},
        rust = {"rustfmt"},
        python = {"isort", "black"},
        go = {"gofmt", "goimports"},
        svelte = {"prettier"},
        vue = {"prettier"},
        dockerfile = {"dockerfilefmt"},
        elixir = {"mix format"},
        haskell = {"ormolu"},
        sql = {"sqlformat"},
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000
      }
    })
  end
}
