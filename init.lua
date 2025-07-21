require('options')


vim.lsp.config('*', {
    capabilities = {
        textDocument = {
            semanticTokens = {
                multilineTokenSupport = true,
            }
        },
        workspace = {
            didChangeWatchedFiles = {
                dynamicRegistration = true,
            },
        },
    },
    root_markers = { '.git' },
})

require('lsp')

vim.lsp.enable('luals')
vim.lsp.enable('gopls')
vim.lsp.enable('tsls')
vim.lsp.enable('pyright')
vim.lsp.enable('csharpls')
vim.lsp.enable('jdtls')
vim.lsp.enable('rustanal')
vim.lsp.enable('mdoxide')

-- waiting for 0.12
vim.pack.add({
    "https://github.com/zootedb0t/citruszest.nvim",
})

require('citruszest').setup()
vim.cmd("colorscheme citruszest")
