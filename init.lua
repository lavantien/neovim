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

vim.lsp.enable('luals')
vim.lsp.enable('gopls')
vim.lsp.enable('tsls')
vim.lsp.enable('pyright')
vim.lsp.enable('csharpls')
vim.lsp.enable('jdtls')
vim.lsp.enable('rustanal')
vim.lsp.enable('mdoxide')

require('lsp')

-- waiting for 0.12
-- vim.pack.add({
--     "https://github.com/zenbones-theme/zenbones.nvim",
-- })
--
-- require('zenbones').setup()
vim.cmd("colorscheme zenbones")
