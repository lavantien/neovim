vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
            vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy', 'popup' }
            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
            vim.keymap.set('i', '<C-Space>', function()
                vim.lsp.completion.get()
            end)
        end
    end,
})

vim.cmd("set completeopt+=noselect")

vim.diagnostic.config({
	virtual_lines = { current_line = true },
})
