"SETTINGS
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set mouse=a

"KEYBINDINGS
nnoremap <Space> <Nop>
let mapleader = " "
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p
imap <C-l> <Esc>lwi
imap <C-h> <Esc>hbi
map <C-q> :q<Cr>
map <C-s> :w<Cr>
map <Leader>fq :q!<Cr>
map <Leader>gst :Gstatus<Cr>
map <Leader>gpu :Gpull<Cr>
map <Leader>gps :Gpush<Cr>
map <Leader>gpf :Gpush -f<Cr>
map <Leader>grb :Grebase 
map <Leader>ggr :Ggrep<Cr>
map <Leader>gcm :Gcommit<Cr>
map <Leader>gco :Git checkout  
map <Leader>gam :Gcommit --amend<Cr>
map <Leader>gwr :Gwrite<Cr>
map <Leader>gre :Gread<Cr>
map <Leader>gfe :Gfetch<Cr>
map <Leader>gdi :Gdiff<Cr>

"VIM-PLUG
call plug#begin('~/.vim/plugged')

Plug 'kien/ctrlp.vim'
Plug 'rhysd/vim-clang-format'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'scrooloose/nerdtree'
Plug 'altercation/vim-colors-solarized'
Plug 'ludovicchabant/vim-gutentags'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ajh17/VimCompletesMe'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'w0rp/ale'
Plug 'terryma/vim-multiple-cursors'
Plug 'gnattishness/cscope_maps'

call plug#end()

"LIGHTLINE
set noshowmode
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'Tomorrow_Night',
      \ }

"SOLARIZED COLORSCHEME
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized

"NERDTREE
map <silent> <C-n> :NERDTreeToggle<CR>

"CLANG-FORMAT
nmap <silent> <C-l> :ClangFormat<CR>

"CTRL-P
let g:ctrlp_map = '<C-k>'

"VIM_MULTIPLE_CURSORS
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_word_key      = '<C-m>'
let g:multi_cursor_select_all_word_key = '<A-m>'
let g:multi_cursor_start_key           = 'g<C-m>'
let g:multi_cursor_select_all_key      = 'g<A-m>'
let g:multi_cursor_next_key            = '<C-m>'
let g:multi_cursor_prev_key            = '<C-m>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

"VIM-GITGUTTER
autocmd BufEnter * :GitGutterDisable
nmap <C-g> :GitGutterToggle<CR>

"VIM-COMMENTARY
nmap <C-/> gcc

"ALE
let g:ale_linters = {'cpp': ['cppcheck', 'cpplint']}

"BUILD SYSTEM
set makeprg=/opt/ti/ccsv8/eclipse/eclipse\ -noSplash\ -data\ ~/workspace_v8\ -application\ com.ti.ccstudio.apps.projectBuild\ -ccs.projects\ MSP\ -ccs.configuration\ "zCoverity"

command CleanOrbit execute '!/opt/ti/ccsv8/eclipse/eclipse -noSplash -data ~/workspace_v8 -application com.ti.ccstudio.apps.projectBuild -ccs.projects MSP -ccs.configuration Orbit -ccs.clean' 
command CleanTests execute '!/opt/ti/ccsv8/eclipse/eclipse -noSplash -data ~/workspace_v8 -application com.ti.ccstudio.apps.projectBuild -ccs.projects MSP -ccs.configuration \"Tests MSP432E\" -ccs.clean' 
command CleanZcoverity execute '!/opt/ti/ccsv8/eclipse/eclipse -noSplash -data ~/workspace_v8 -application com.ti.ccstudio.apps.projectBuild -ccs.projects MSP -ccs.configuration zCoverity -ccs.clean'

command Orbit execute 'set makeprg=/opt/ti/ccsv8/eclipse/eclipse\ -noSplash\ -data\ ~/workspace_v8\ -application\ com.ti.ccstudio.apps.projectBuild\ -ccs.projects\ MSP\ -ccs.configuration\ \"Orbit\"'
command Tests execute 'set makeprg=/opt/ti/ccsv8/eclipse/eclipse\ -noSplash\ -data\ ~/workspace_v8\ -application\ com.ti.ccstudio.apps.projectBuild\ -ccs.projects\ MSP\ -ccs.configuration\ \"Tests MSP432E\"'
command ZCoverity execute 'set makeprg=/opt/ti/ccsv8/eclipse/eclipse\ -noSplash\ -data\ ~/workspace_v8\ -application\ com.ti.ccstudio.apps.projectBuild\ -ccs.projects\ MSP\ -ccs.configuration\ \"zCoverity\"'
command FakeMake execute 'set makeprg=/opt/ti'

map <C-b> :Make<CR>
autocmd QuickFixCmdPost * :copen

"LINE NUMBERS
set number relativenumber
highlight clear LineNr
highlight clear CursorLineNr
highlight clear SignColumn
highlight LineNr guibg=NONE
highlight CursorLineNr guibg=NONE
