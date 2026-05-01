"plugins stored in '$XDG_DATA_HOME/nvim/plugged'

" $HOME/.local/share/nvim/plugged
call plug#begin(stdpath('data') . '/plugged')

Plug 'morhetz/gruvbox'
" auto insert brackets, parens, quotes in pairs
Plug 'windwp/nvim-autopairs'
" colorize hexcodes and other stuff
Plug 'norcalli/nvim-colorizer.lua'
" comment functions
Plug 'preservim/nerdcommenter'
" complete code snippets
"Plug 'SirVer/ultisnips'
" markdown preview in browser
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': 'v0.2.1' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' }
Plug 'nvim-treesitter/nvim-treesitter', { 'branch': 'main', 'do': ':TSUpdate' }
Plug 'neovim/nvim-lspconfig'
Plug 'saghen/blink.cmp', {'tag': 'v1.*'}

call plug#end()

if (has("termguicolors"))
    set termguicolors
endif

lua << EOF
-- can be added to other languages
local on_attach = function(_, bufnr)
  local opts = { buffer = bufnr }

  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.rename, opts)
end

vim.lsp.config['zls'] = {
  cmd = { 'zls' },
  filetypes = { 'zig', 'zir' },
  root_markers = { 'zls.json', 'build.zig', '.git' },
  on_attach = on_attach,
  settings = {
    zls = {
      enable_autofix = true,
      enable_snippets = true,
      warn_style = true,
    },
  },
}
vim.diagnostic.config({
  virtual_text = true,   -- shows errors inline
  signs = true,          -- gutter signs
  underline = true,      -- underline errors
  update_in_insert = false,
  severity_sort = true,
})
EOF

lua require 'colorizer'.setup()
lua require('config.treesitter')
lua vim.lsp.enable('zls')
lua << EOF
require('blink.cmp').setup({
    keymap = { 
        preset = 'default',
        ["<C-y>"] = false,                    -- disable Ctrl+y
        ["<CR>"] = { "select_and_accept", "fallback" },  -- use Enter to confirm
    },
    appearance = {
        nerd_font_variant = 'mono'
    },
    completion = {
        documentation = { auto_show = false }
    },
    sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    fuzzy = {
        implementation = "prefer_rust_with_warning"
    }
})
EOF

let g:UltiSnipsSnippetDirectories=['~/.config/nvim/ultisnips']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" Grip
let vim_markdown_preview_github=1 

syntax on
set relativenumber
set encoding=utf-8
colorscheme gruvbox
" cursor floats n lines above the bottom line on screen
set scrolloff=5 
" smartcase search: ignorecase if lowercase
"   word> word,WORD,Word
"   Word> Word
set ignorecase smartcase

" tab is 4 spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set fileformat=unix
filetype plugin on

augroup YamlCode
	autocmd!
	autocmd BufReadPre,FileReadPre *.yml set ft=yaml
augroup END

let filetype_i = "nasm"

" disable prompt to save file when changing buffer goes to 'hidden'
set hidden

autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2 expandtab


" === Keybinds ===
let mapleader = " "

" center screen after jumping
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz 
" center screen when searching
nnoremap n nzz
nnoremap N Nzz
" paste but keep text in register
xnoremap <leader>p "_dP
" Fuzzy find (Telescope)
nnoremap <leader>ff <cmd>Telescope find_files<CR>
nnoremap <leader>fg <cmd>Telescope git_files<CR>
nnoremap <leader>fs <cmd>Telescope live_grep<CR>
nnoremap <leader><Esc> :bd<CR>

