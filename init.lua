require('options')

vim.lsp.config('*', {
    capabilities = {
        textDocument = {
            semanticTokens = {
                multilineTokenSupport = true,
            }
        }
    },
    root_markers = { '.git' },
})

require('lsp')

vim.lsp.enable('luals')
vim.lsp.enable('gopls')
