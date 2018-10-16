set exrc
set secure

set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set shellcmdflag=-ic

noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

"PATHOGEN
execute pathogen#infect()
syntax enable
filetype plugin indent on

"SOLARIZED COLORSCHEME
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized

"NERDTREE
map <silent> <C-n> :NERDTreeFocus<CR>

"CLANG-FORMAT
map <silent> <C-l> :ClangFormat<CR>

"YOUCOMPLETEME (DISABLED)
let g:loaded_youcompleteme=1
let g:ycm_max_diagnostics_to_display=0

"BUILD SYSTEM
nnoremap <C-b> :!build-orbit<CR>
nnoremap <C-t> :!build-test<CR>

set number relativenumber
highlight clear LineNr
highlight clear CursorLineNr
highlight clear SignColumn
highlight LineNr guibg=NONE
highlight CursorLineNr guibg=NONE
