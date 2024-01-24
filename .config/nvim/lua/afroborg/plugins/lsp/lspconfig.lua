return {
    'neovim/nvim-lspconfig',
    event = 'BufReadPre',
    dependencies = {
        {
            'j-hui/fidget.nvim',
            event = 'LspAttach',
            tag = 'legacy',
            opts = {},
        },
        {
            'creativenull/efmls-configs-nvim',
            event = 'LspAttach',
            version = 'v1.x.x',
        },
        {
            'folke/neodev.nvim',
            ft = 'lua',
            opts = {},
        },
        'b0o/schemastore.nvim',
        {
            'SmiteshP/nvim-navic',
            event = 'LspAttach',
            opts = {
                highlight = true,
            },
        },
    },
    config = function()
        local lspconfig = require 'lspconfig'
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.textDocument.completion.completionItem.snippetSupport = true

        lspconfig.util.default_config = vim.tbl_extend('force', lspconfig.util.default_config, {
            capabilities = capabilities,
        })

        local servers = require('afroborg.servers')()

        for server, conf in pairs(servers) do
            lspconfig[server].setup(conf)
        end

        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.g.augroup,
            callback = function(args)
                local bufnr = args.buf
                local client = vim.lsp.get_client_by_id(args.data.client_id)

                if client.server_capabilities.documentSymbolProvider then
                    require('nvim-navic').attach(client, bufnr)
                    vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
                end

                local lspmap = function(mode, keys, func, desc)
                    if desc then
                        desc = 'LSP: ' .. desc
                    end

                    vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = desc })
                end

                lspmap('n', '<leader>cr', vim.lsp.buf.rename, '[R]ename')
                lspmap('n', '<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
                lspmap('v', 'ga', vim.lsp.buf.code_action, 'Code [A]ction')

                lspmap('n', 'gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
                lspmap('n', 'gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
                lspmap('n', 'gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
                lspmap('n', '<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')

                if client.server_capabilities.documentFormattingProvider then
                    lspmap('n', '<leader>ss', require('telescope.builtin').lsp_document_symbols,
                        '[S]earch Document [S]ymbols')
                    lspmap('n', '<leader>sS', require('telescope.builtin').lsp_dynamic_workspace_symbols,
                        '[S]earch Workspace [S]ymbols')
                end

                -- See `:help K` for why this keymap
                lspmap('n', 'K', vim.lsp.buf.hover, 'Hover Documentation')

                -- Lesser used LSP functionality
                lspmap('n', 'gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

                -- Create a command `:Format` local to the LSP buffer
                if client.server_capabilities.documentFormattingProvider then
                    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
                        vim.lsp.buf.format()
                    end, { desc = 'Format current buffer with LSP' })
                end

                require 'which-key'.register({
                    c = { name = 'code', }
                }, { prefix = '<leader>' })

                -- Diagnostic keymaps
                lspmap('n', '[d', vim.diagnostic.goto_prev, 'Go to previous diagnostic message')
                lspmap('n', ']d', vim.diagnostic.goto_next, 'Go to next diagnostic message')
                lspmap('n', 'gl', vim.diagnostic.open_float, 'Open floating diagnostic message')
                lspmap('n', '<leader>cd', vim.diagnostic.setloclist, 'Open diagnostics list')
                lspmap('n', '<leader>cD', vim.diagnostic.setloclist, 'Search workspace diagnostics list')
            end
        })
    end,
}
