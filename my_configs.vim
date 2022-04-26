" quick search for files in directories
let g:ctrlp_map = '<C-p>'

" vimwiki
" set path to store wiki
let g:vimwiki_list = [{'path': '~/.vimwiki/', 'ext': '.md','auto_toc': 1, 'template_path': '~/.vimwiki/templates/'}]

" auto-pairs plugin
" disabled because annoying
let g:AutoPairsLoaded = 0

" autocmd for filetypes
" python
autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab autoindent

" search highlighting
" clear highlighting when pressing return
nnoremap <silent> <CR> :nohlsearch<CR><CR>

" cursor: blinking in insert, block in normal
augroup cursor_behaviour
    autocmd!
    " cursor blinking bar on insert mode
    let &t_SI = "\e[5 q"
    " cursor steady block on command mode
    let &t_EI = "\e[2 q"

    " highlight current line when in insert mode
    autocmd InsertEnter * set cursorline
    " turn off current line highlighting when leaving insert mode
    autocmd InsertLeave * set nocursorline
augroup END
