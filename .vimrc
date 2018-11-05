"MISC SETTINGS
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set mouse=a
set sidescroll=1
set clipboard=unnamedplus
set cursorline
set wildmode=longest,list,full
set esckeys
set hlsearch!
set backspace=indent,eol,start

"FOLDING
set foldmethod=syntax
set foldnestmax=1
set foldopen+=jump
set foldopen+=quickfix
set foldopen+=search
set foldopen+=tag
set foldopen+=insert
set foldopen+=undo
set foldopen+=mark

"KEYBINDINGS
nnoremap <Space> <Nop>
let mapleader = " "

noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

map <C-q> :q<Cr>
map <C-s> :w<Cr>
map <Leader>fq :q!<Cr>

imap <C-l> <Esc>lei
imap <C-h> <Esc>hbi

nnoremap <Leader>hh :A<Cr>
nnoremap <Leader>hx :AS<Cr>
nnoremap <Leader>hv :AV<Cr>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
map <Cr><Cr> o<Esc>

nnoremap <S-h> 4h
nnoremap <S-j> 4j
nnoremap <S-k> 4k
nnoremap <S-l> 4l

noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>

let hlstate=0
nnoremap <Leader>* :if (hlstate == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=1-hlstate<Cr>
if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

"VIM-PLUG
call plug#begin('~/.vim/plugged')

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
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'dingbenjamin/a.vim'
Plug 'xuhdev/vim-latex-live-preview'
Plug 'lervag/vimtex'

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
nmap <silent> <Leader>af :ClangFormat<CR>

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

"CSCOPE
"Chopped and pasted from http://cscope.sourceforge.net/cscope_maps.vim
"
" use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
" set cscopetag

" check cscope for definition of a symbol before checking ctags: set to 1
" if you want the reverse search order.
set csto=0

" add any cscope database in current directory
if filereadable("cscope.out")
	cs add cscope.out  
" else add the database pointed to by environment variable 
elseif $CSCOPE_DB != ""
	cs add $CSCOPE_DB
endif

" show msg when any other cscope db added
set cscopeverbose  

nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>	
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

nmap <C-[>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-[>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-[>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-[>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-[>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-[>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>	
nmap <C-[>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
nmap <C-[>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>

"CTAGS
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

"VIM-GITGUTTER
autocmd BufEnter * :GitGutterDisable
nmap <C-g> :GitGutterToggle<CR>

"VIM-COMMENTARY
nmap <C-/> gcc

"VIM-FUGITIVE
set diffopt+=vertical
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

"ALE
let g:ale_linters = {'cpp': ['cppcheck', 'cpplint']}

"ULTISNIPS
let g:UltiSnipsSnippetDirectories=["UltiSnips","CppSnips"]
let g:UltiSnipsExpandTrigger="<S-Tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"FZF
map <C-P> :FZF<Cr>
let g:fzf_history_dir = '~/.fzf-history'

" Customize fzf colors to match your color scheme
let g:fzf_colors =
  \ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

"VIM-LATEX-LIVE-PREVIEW
autocmd Filetype tex setl updatetime=1

"MSP BUILD SYSTEM
nnoremap <Leader>n :cn<Cr>
nnoremap <Leader>p :cp<Cr>

au BufRead,Bufnewfile *.cpp,*.h set makeprg=/opt/ti/ccsv8/eclipse/eclipse\ -noSplash\ -data\ ~/workspace_v8_vim\ -application\ com.ti.ccstudio.apps.projectBuild\ -ccs.projects\ MSP\ -ccs.configuration\ "zCoverity"

au BufRead,Bufnewfile *.cpp,*.h set errorformat=../%f\:%l:%c:\ %m
au BufRead,Bufnewfile *.cpp,*.h set errorformat+=%f\:%l:%c:\ %m
au BufRead,Bufnewfile *.cpp,*.h set errorformat^=%-G%f:%l:\ warning:%m

command CleanOrbit execute '!/opt/ti/ccsv8/eclipse/eclipse -noSplash -data ~/workspace_v8_vim -application com.ti.ccstudio.apps.projectBuild -ccs.projects MSP -ccs.configuration Orbit -ccs.clean' 
command CleanTests execute '!/opt/ti/ccsv8/eclipse/eclipse -noSplash -data ~/workspace_v8_vim -application com.ti.ccstudio.apps.projectBuild -ccs.projects MSP -ccs.configuration \"Tests MSP432E\" -ccs.clean' 
command CleanZcoverity execute '!/opt/ti/ccsv8/eclipse/eclipse -noSplash -data ~/workspace_v8_vim -application com.ti.ccstudio.apps.projectBuild -ccs.projects MSP -ccs.configuration zCoverity -ccs.clean'

command Orbit execute 'set makeprg=/opt/ti/ccsv8/eclipse/eclipse\ -noSplash\ -data\ ~/workspace_v8_vim\ -application\ com.ti.ccstudio.apps.projectBuild\ -ccs.projects\ MSP\ -ccs.configuration\ \"Orbit\"'
command Tests execute 'set makeprg=/opt/ti/ccsv8/eclipse/eclipse\ -noSplash\ -data\ ~/workspace_v8_vim\ -application\ com.ti.ccstudio.apps.projectBuild\ -ccs.projects\ MSP\ -ccs.configuration\ \"Tests MSP432E\"'
command ZCoverity execute 'set makeprg=/opt/ti/ccsv8/eclipse/eclipse\ -noSplash\ -data\ ~/workspace_v8_vim\ -application\ com.ti.ccstudio.apps.projectBuild\ -ccs.projects\ MSP\ -ccs.configuration\ \"zCoverity\"'

map <C-b> :Make<CR>
autocmd QuickFixCmdPost * :copen

"LINE NUMBERS
set number relativenumber
highlight clear LineNr
highlight clear CursorLineNr
highlight clear SignColumn
highlight LineNr guibg=NONE
