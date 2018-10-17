set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set mouse=a

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
command Clean execute '!/opt/ti/ccsv8/eclipse/eclipse -noSplash -data ~/workspace_v8 -application com.ti.ccstudio.apps.projectBuild -ccs.workspace -ccs.configuration "zCoverity" -ccs.clean' 
set makeprg=/opt/ti/ccsv8/eclipse/eclipse\ -noSplash\ -data\ ~/workspace_v8\ -application\ com.ti.ccstudio.apps.projectBuild\ -ccs.workspace\ -ccs.configuration\ "zCoverity"
map <C-b> :make<CR>
autocmd QuickFixCmdPost * :copen

set number relativenumber
highlight clear LineNr
highlight clear CursorLineNr
highlight clear SignColumn
highlight LineNr guibg=NONE
highlight CursorLineNr guibg=NONE
