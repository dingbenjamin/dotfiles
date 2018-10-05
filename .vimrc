set exrc
set secure

set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set shellcmdflag=-ic

highlight ColorColumn ctermbg=darkgray

"FILETYPE DETECTION
augroup project
    autocmd!
    autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
augroup END

"SETTING PATH VARIABLE
let &path.="src/include,/usr/include/AL,"

"AUTOCOMPLETE
"let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"

"BUILD SYSTEM
nnoremap <c-b> :!build-orbit
nnoremap <c-t> :!build-test
