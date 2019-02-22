if &compatible


end

syntax on
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete

set rtp+=~/.vim/bundle/Vundle.vim/
cal vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-surround'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'w0rp/ale'
Plugin 'scrooloose/nerdtree'
Plugin 'tmux/tmux'
Plugin 'Valloric/YouCompleteMe'
call vundle#end()            " required
filetype on

set term=xterm-256color

autocmd VimEnter * silent exec "! echo -ne '\e[1 q'"
autocmd VimLeave * silent exec "! echo -ne '\e[5 q'" 

set tabstop=4 shiftwidth=4 expandtab
set softtabstop=4
set number
set path+=~/dazn/catalog-web-chapter/**
set bs=2
set hlsearch
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Start autocompletion after 4 chars
let g:ycm_min_num_of_chars_for_completion = 4
let g:ycm_min_num_identifier_candidate_chars = 4
let g:ycm_enable_diagnostic_highlighting = 0

" Don't show YCM's preview window 
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0

" ###### CTRLP options ######
"" Remap ctrlp to easier shortcut
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

"" Ignore typical files from search
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
"" Ignore all those in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
"" Open file in a new buffer if file already open
let g:ctrlp_switch_buffer = 'et'
