"plugins stored in '$XDG_DATA_HOME/nvim/plugged'

call plug#begin()


Plug 'morhetz/gruvbox'
" auto insert brackets, parens, quotes in pairs
Plug 'jiangmiao/auto-pairs'
" colorize hexcodes and other stuff
Plug 'norcalli/nvim-colorizer.lua'
" comment functions
Plug 'preservim/nerdcommenter'
" complete code snippets
"Plug 'SirVer/ultisnips'
" markdown preview in browser
Plug 'JamshedVesuna/vim-markdown-preview'

call plug#end()

if (has("termguicolors"))
    set termguicolors
endif

lua require 'colorizer'.setup()

let g:UltiSnipsSnippetDirectories=['~/.config/nvim/ultisnips']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" Grip
let vim_markdown_preview_github=1 

syntax on
set number relativenumber
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

nmap <S-u> O<Esc>0"_D
nmap <CR> o<Esc>0"_D

" center screen after jumping
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz 
" center screen when searching
nnoremap n nzz
nnoremap N Nzz
" paste but keep text in register
xnoremap <leader>p "_dP
