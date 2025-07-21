-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/markdown_oxide.lua
-- https://github.com/Feel-ix-343/markdown-oxide?tab=readme-ov-file#Neovim

return {
  root_markers = { '.git', '.obsidian', '.moxide.toml' },
  filetypes = { 'markdown' },
  cmd = { 'markdown-oxide' },
  on_attach = function(_, bufnr)
    vim.api.nvim_buf_create_user_command(bufnr, 'LspToday', function()
      vim.lsp.buf.execute_command { command = 'jump', arguments = { 'today' } }
    end, {
      desc = "Open today's daily note",
    })
    vim.api.nvim_buf_create_user_command(bufnr, 'LspTomorrow', function()
      vim.lsp.buf.execute_command { command = 'jump', arguments = { 'tomorrow' } }
    end, {
      desc = "Open tomorrow's daily note",
    })
    vim.api.nvim_buf_create_user_command(bufnr, 'LspYesterday', function()
      vim.lsp.buf.execute_command { command = 'jump', arguments = { 'yesterday' } }
    end, {
      desc = "Open yesterday's daily note",
    })

    local function check_codelens_support()
      local clients = vim.lsp.get_active_clients({ bufnr = 0 })
      for _, c in ipairs(clients) do
        if c.server_capabilities.codeLensProvider then
          return true
        end
      end
      return false
    end

    vim.api.nvim_create_autocmd({ 'TextChanged', 'InsertLeave', 'CursorHold', 'LspAttach', 'BufEnter' }, {
      buffer = bufnr,
      callback = function ()
      if check_codelens_support() then
        vim.lsp.codelens.refresh({bufnr = 0})
      end
    end
    })
    -- trigger codelens refresh
    vim.api.nvim_exec_autocmds('User', { pattern = 'LspAttached' })
  end,
}
