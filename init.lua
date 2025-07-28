vim.opt.clipboard:append({ "unnamed", "unnamedplus" })
vim.opt.winborder = 'rounded'
vim.opt.inccommand = 'split'
vim.opt.signcolumn = 'yes'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.undofile = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.expandtab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

vim.g.mapleader = " "
vim.g.loaded_netrw = 0
vim.g.loaded_netrwPlugin = 0
vim.g.have_nerd_font = true

vim.pack.add({
    { src = 'https://github.com/vague2k/vague.nvim' },
    { src = 'https://github.com/neovim/nvim-lspconfig' },
    { src = 'https://github.com/stevearc/oil.nvim' },
    { src = 'https://github.com/echasnovski/mini.pick' },
    { src = 'https://github.com/chomosuke/typst-preview.nvim' },
})

vim.lsp.enable({ 'lua_ls', 'gopls', 'rust_analyzer', 'pyright', 'ts_ls', 'jdtls', 'csharp_ls', 'tinymist', 'dockerls',
    'docker_compose_language_service', 'yamlls', 'codebook' })

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

require('mini.pick').setup()
require('oil').setup()
require('typst-preview').setup()

vim.keymap.set('n', '<leader>q', ':quit<CR>')
vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
vim.keymap.set('n', '<leader>b', vim.lsp.buf.format)
vim.keymap.set('n', '<leader>f', MiniPick.builtin.files)
vim.keymap.set('n', '<leader>g', MiniPick.builtin.grep_live)
vim.keymap.set('n', '<leader>h', MiniPick.builtin.help)
vim.keymap.set('n', '<leader>p', ':TypstPreviewToggle<CR>')

vim.cmd('colorscheme vague')
vim.cmd(':hi statusline guibg=NONE')

-- plugins hidden keymaps

-- oil

-- keymaps = {
--     ["g?"] = { "actions.show_help", mode = "n" },
--     ["<CR>"] = "actions.select",
--     ["<C-s>"] = { "actions.select", opts = { vertical = true } },
--     ["<C-h>"] = { "actions.select", opts = { horizontal = true } },
--     ["<C-t>"] = { "actions.select", opts = { tab = true } },
--     ["<C-p>"] = "actions.preview",
--     ["<C-c>"] = { "actions.close", mode = "n" },
--     ["<C-l>"] = "actions.refresh",
--     ["-"] = { "actions.parent", mode = "n" },
--     ["_"] = { "actions.open_cwd", mode = "n" },
--     ["`"] = { "actions.cd", mode = "n" },
--     ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
--     ["gs"] = { "actions.change_sort", mode = "n" },
--     ["gx"] = "actions.open_external",
--     ["g."] = { "actions.toggle_hidden", mode = "n" },
--     ["g\\"] = { "actions.toggle_trash", mode = "n" },
-- }

-- mini.pick

-- mappings = {
--     caret_left        = '<Left>',
--     caret_right       = '<Right>',
--
--     choose            = '<CR>',
--     choose_in_split   = '<C-s>',
--     choose_in_tabpage = '<C-t>',
--     choose_in_vsplit  = '<C-v>',
--     choose_marked     = '<M-CR>',
--
--     delete_char       = '<BS>',
--     delete_char_right = '<Del>',
--     delete_left       = '<C-u>',
--     delete_word       = '<C-w>',
--
--     mark              = '<C-x>',
--     mark_all          = '<C-a>',
--
--     move_down         = '<C-n>',
--     move_start        = '<C-g>',
--     move_up           = '<C-p>',
--
--     paste             = '<C-r>',
--
--     refine            = '<C-Space>',
--     refine_marked     = '<M-Space>',
--
--     scroll_down       = '<C-f>',
--     scroll_left       = '<C-h>',
--     scroll_right      = '<C-l>',
--     scroll_up         = '<C-b>',
--
--     stop              = '<Esc>',
--
--     toggle_info       = '<S-Tab>',
--     toggle_preview    = '<Tab>',
-- }
