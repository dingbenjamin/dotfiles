"MISC SETTINGS
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set mouse=a
set sidescroll=1
set clipboard=unnamed
set cursorline
set wildmode=longest,list,full
set esckeys
set hlsearch!
set showcmd
set backspace=indent,eol,start
set autoread
syntax on
filetype plugin indent on

"HIGHLIGHT COLOURS
"See colours :so $VIMRUNTIME/syntax/hitest.vim
highlight! link Visual LightlineLeft_normal_0

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

" Tweak the event and filetypes matched to your liking. 
" Note, perl automatically sets foldmethod in the syntax file
autocmd Syntax c,cpp,vim,xml,html,xhtml setlocal foldmethod=syntax

autocmd Syntax c,cpp,vim,xml,html,xhtml,perl normal zR

"VISUAL SELECTION
function! s:getVisualSelection()
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)

    if len(lines) == 0
        return ""
    endif

    let lines[-1] = lines[-1][:column_end - (&selection == "inclusive" ? 1 : 2)]
    let lines[0] = lines[0][column_start - 1:]

    return join(lines, "\n")
endfunction

"KEYBINDINGS
nnoremap <Space> <Nop>
let mapleader = " "

noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

nnoremap <Leader>q :q<Cr>
nnoremap <Leader>w :w<Cr>
nnoremap <Leader>fq :q!<Cr>

nnoremap <Leader>vs :vsplit<Cr>
nnoremap <Leader>hs :split<Cr>

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

nnoremap <Leader>hl :set hlsearch! hlsearch?<Cr>

nnoremap <Leader>t gt
nnoremap <Leader><S-t> gT

map # ^

let hlstate=0
nnoremap <Leader>* :if (hlstate == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=1-hlstate<Cr>
if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

"AUTOSAVE & AUTOLOAD
augroup focus
  autocmd!
  autocmd FocusLost,BufLeave * silent! wa
augroup END

augroup savealot
  autocmd!
  autocmd TextChanged,InsertLeave,WinLeave * silent! update
augroup END

au FocusGained,BufEnter * :silent! !

"VIM-PLUG
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-abolish'
Plug 'airblade/vim-gitgutter'
Plug 'terryma/vim-multiple-cursors'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'dingbenjamin/a.vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'nelstrom/vim-visual-star-search'
Plug 'mhinz/vim-grepper'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'kshenoy/vim-signature'
Plug 'lyuts/vim-rtags'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

"LIGHTLINE
set noshowmode
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'Tomorrow_Night',
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \ }
      \ }

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

"NERDTREE
map <silent> <C-n> :NERDTreeToggle<CR>

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
nmap <Leader>/ gcc

"VIM-FUGITIVE
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

"FZF

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg -F --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

function! RipgrepFzfBazelOut(query, fullscreen)
  let command = "rg -F --column --line-number --no-heading --color=always --files -g '*.h' bazel-out || true"
  call fzf#vim#grep(command, 1, fzf#vim#with_preview(), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
command! -nargs=* -bang RB call RipgrepFzfBazelOut(<q-args>, <bang>0)

map <Leader>ff :GFiles<Cr>
map <Leader>fi :RG<Cr>
map <Leader>fc :Rg ^class\|^struct<Cr>
map <Leader>fu :Rg ^using<Cr>
map <Leader>fg :RB<Cr>
map <Leader>fh :History<Cr>
map <Leader>fb :Buffers<Cr>
vnoremap <silent><leader>ff <Esc>:FZF -q <C-R>=<SID>getVisualSelection()<CR><CR>
vnoremap <silent><leader>fi <Esc>:Rg <C-R>=<SID>getVisualSelection()<CR><CR>
vnoremap <silent><leader>fh <Esc>:History <C-R>=<SID>getVisualSelection()<CR><CR>
vnoremap <silent><leader>fb <Esc>:Buffers <C-R>=<SID>getVisualSelection()<CR><CR>

let g:fzf_history_dir = '~/.fzf-history'

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

"VIM-GREPPER
let g:grepper={}
let g:grepper.tools=["rg"]

xmap gr <plug>(GrepperOperator)

" After searching for text, press this mapping to do a project wide find and
" replace. It's similar to <leader>r except this one applies to all matches
" across all files instead of just the current file.
nnoremap <Leader>R
  \ :let @s='\<'.expand('<cword>').'\>'<CR>
  \ :Grepper -cword -noprompt<CR>
  \ :cfdo %s/<C-r>s//g \| update
  \<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

" The same as above except it works with a visual selection.
xmap <Leader>R
    \ "sy
    \ gvgr
    \ :cfdo %s/<C-r>s//g \| update
     \<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

"BAZEL

" Get the path to pass to bazel
function! BazelDir()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p:h')
  if path[:len(root)-1] ==# root
    return join(["//", path[len(root)+1:], "/..."], "")
  endif
  return join(["//", expand('%'), "/..."], "")
endfunction

set makeprg=rrrb

command BuildRemote set makeprg=rrrb
command BuildLocal set makeprg=bazel

command TestForeground execute "Make test" BazelDir()
command BuildForeground execute "Make build" BazelDir()
command TestBackground execute "Make! test" BazelDir()
command BuildBackground execute "Make! build" BazelDir()

nnoremap <Leader>bbf BuildForeground
nnoremap <Leader>btf TestForeground
nnoremap <Leader>bbb BuildBackground
nnoremap <Leader>bbt TestBackground

"LINE NUMBERS
set number relativenumber
highlight clear LineNr
highlight clear CursorLineNr
highlight clear SignColumn
highlight LineNr guibg=NONE

"COC
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
" nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>cf  <Plug>(coc-format-selected)
nmap <leader>cf  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
" Note coc#float#scroll works on neovim >= 0.4.3 or vim >= 8.2.0750
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
