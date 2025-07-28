# vanilla and sane config for neovim

giga minimal neovim config for programmers

## requirements

- neovim 0.12+
- **lua, luajit**, lua-language-server
- **go**, gopls
- **rust**, rust-analyzer
- **python**, pyright
- **typescript**, typescript-language-server
- **java, jdk**, jdtls
- **csharp**, csharp-ls
- **typst**, tinymist
- **docker**, dockerls, compose-language-service
- yaml-language-server
- codebook-lsp

## update all dependencies

### windows

```bash
gup update && cargo install-update -a && scoop update -a && winget upgrade --all -u
```

## references

- <https://neovim.io/doc/user/lsp.html#lsp-config>
- <https://gpanders.com/blog/whats-new-in-neovim-0-11/>
- <https://www.youtube.com/watch?v=xGkL2N8w0H4>

## keymap

### Custom Keymaps

These are the keybindings explicitly defined in the configuration files.

| Keymap | Mode | Action | Description |
| :--- | :--- | :--- | :--- |
| ` ` (Space) | | `mapleader` | The leader key for custom shortcuts. |
| `<leader>q` | Normal | `:quit<CR>` | Quits Neovim. |
| `-` | Normal | `<CMD>Oil<CR>` | Opens the parent directory using oil.nvim. |
| `<leader>b` | Normal | `vim.lsp.buf.format` | Formats the current buffer using the LSP. |
| `<leader>f` | Normal | `MiniPick.builtin.files` | Finds files using mini.pick. |
| `<leader>g` | Normal | `MiniPick.builtin.grep_live` | Performs a live grep search using mini.pick. |
| `<leader>h` | Normal | `MiniPick.builtin.help` | Shows help for mini.pick. |
| `<leader>p` | Normal | `:TypstPreviewToggle<CR>` | Toggles the typst-preview. |
| `<C-Space>` | Insert | `vim.lsp.completion.get()` | Triggers LSP completion. |

### Neovim LSP Default Keymaps (0.11+)

These are the modern default keybindings that Neovim provides when an LSP client attaches to a buffer.

| Keymap | Mode | Action | Description |
| :--- | :--- | :--- | :--- |
| `K` | Normal | `vim.lsp.buf.hover()` | Shows hover information for the symbol under the cursor. |
| `gd` | Normal | `vim.lsp.buf.definition()` | Goes to the definition of the symbol under the cursor. |
| `gD` | Normal | `vim.lsp.buf.declaration()` | Goes to the declaration of the symbol under the cursor. |
| `gri` | Normal | `vim.lsp.buf.implementation()` | Lists all implementations for the symbol under the cursor. |
| `gO` | Normal | `vim.lsp.buf.document_symbol()` | Shows a "table of contents" or outline of symbols in the current document. |
| `go` | Normal | `vim.lsp.buf.type_definition()` | Goes to the type definition of the symbol under the cursor. |
| `grr` | Normal | `vim.lsp.buf.references()` | Lists all references to the symbol under the cursor. |
| `grn` | Normal | `vim.lsp.buf.rename()` | Renames all references to the symbol under the cursor. |
| `gra` | Normal, Visual | `vim.lsp.buf.code_action()` | Selects a code action from a list of available actions. |
| `CTRL-S` | Insert, Select | `vim.lsp.buf.signature_help()` | Displays signature information for the function being called. |

### Diagnostic and List Navigation

These keymaps are for navigating through diagnostics (errors, warnings) and various lists like quickfix and location lists.

| Keymap | Action |
| :--- | :--- |
| `[d`, `]d` | Move between diagnostics in the current buffer. |
| `[D`, `]D` | Jump to the first or last diagnostic in the buffer. |
| `[q`, `]q` | Navigate through the quickfix list. |
| `[Q`, `]Q` | Jump to the first or last item in the quickfix list. |
| `[l`, `]l` | Navigate through the location list. |
| `[L`, `]L` | Jump to the first or last item in the location list. |
| `[b`, `]b` | Navigate through the buffer list. |
| `[B`, `]B` | Jump to the first or last buffer in the list. |
| `[t`, `]t` | Navigate through the tag matchlist. |
| `[a`, `]a` | Navigate through the argument list. |

### Insert and Completion Keymaps

These are standard Neovim keybindings for completion in insert mode.

| Keymap | Action | Description |
| :--- | :--- | :--- |
| `<C-x><C-o>` | `vim.lsp.omnifunc` | Triggers omni completion, typically powered by the LSP. |
| `<C-n>` / `<C-p>` | Next/Previous Item | Navigates up and down the completion menu. |
| `<C-e>` | End Completion | Stops completion without inserting the selected item. |
| `<C-y>` | Accept Completion | Stops and accepts the currently selected completion item. |
| `<C-x><C-f>` | File Path Completion | Completes file and directory names. |
| `<C-x><C-l>` | Whole Line Completion | Completes entire lines based on other lines in the buffer. |
