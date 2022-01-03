set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'ajh17/vimcompletesme'
Plugin 'preservim/nerdcommenter'
Plugin 'frazrepo/vim-rainbow'
Plugin 'itchyny/lightline.vim'
Plugin 'raimondi/delimitmate'
Plugin 'aperezdc/vim-template'
Plugin 'matze/vim-move'
Plugin 'arcticicestudio/nord-vim'
Plugin 'vim-python/python-syntax'
Plugin 'mengelbrecht/lightline-bufferline'
Plugin 'itchyny/vim-gitbranch'

call vundle#end() 
filetype plugin indent on 

" Sets line numbs
set number

" Sets up tabs spacing
set tabstop=4       
set shiftwidth=4   
set softtabstop=4 
set expandtab

"sets up colorscheme
syntax enable
colorscheme nord

"set up termguicolors for nord
if (has("termguicolors"))
    set termguicolors
endif

" sets up lightline
set noshowmode
set showtabline=2
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ ['lineinfo' ]]
      \ },
      \ 'tabline': {
      \   'left': [ [ 'buffers' ] ],
      \   'right': [ ['fileformat', 'fileencoding', 'filetype'] ]
      \ },
      \ 'component': {
      \     'lineinfo': "\ue0a1 %l:%-2c", 'line': '%l', 'column': '%c', 'close': '%999X X ', 'winnr': '%{winnr()}' 
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tasel'
      \ },
      \ 'component_function': {
      \   'gitbranch': 'AddGitSymbol'
      \ },
      \ }
let g:lightline.separator = { 'left': "\ue0b0", 'right': "\ue0b2" }

" bufferline configs
let g:lightline#bufferline#enable_nerdfont = 1
let g:lightline#bufferline#unicode_symbols = 1
let g:lightline#bufferline#show_number = 1
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#min_buffer_count = 2
let g:lightline#bufferline#unnamed = '[No Name]'

" Adds the unicode git symbol
function! AddGitSymbol()
    if gitbranch#name() !=# ''
        return "\ue0a0" . gitbranch#name() 
    else
        return ""
    endif
endfunction

" sets the middle of the lightline status bar to no color
autocmd VimEnter * call SetupLightlineColors()
function SetupLightlineColors() abort
  let l:palette = lightline#palette()
  let l:palette.normal.middle = [ [ 'NONE', 'NONE', 'NONE', 'NONE' ] ]
  let l:palette.inactive.middle = l:palette.normal.middle
  let l:palette.tabline.middle = l:palette.normal.middle
  call lightline#colorscheme()
endfunction

" enables python syntax
let g:python_highlight_all = 1

" sets custom keys
map <Space> i<Space><Esc>
map <Return> o<Esc>
map <Tab> i<Tab><Esc>
map <C-Right> $
map <C-Left> ^
map! <C-Right> <Esc>$i
map! <C-Left> <Esc>^i

" sets up move lines up/down
map <C-Up> <C-k>
map <C-Down> <C-j>
let g:move_key_modifier = 'C'

" jump to certain buffer
nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)
nmap <Leader>c1 <Plug>lightline#bufferline#delete(1)
nmap <Leader>c2 <Plug>lightline#bufferline#delete(2)
nmap <Leader>c3 <Plug>lightline#bufferline#delete(3)
nmap <Leader>c4 <Plug>lightline#bufferline#delete(4)
nmap <Leader>c5 <Plug>lightline#bufferline#delete(5)
nmap <Leader>c6 <Plug>lightline#bufferline#delete(6)
nmap <Leader>c7 <Plug>lightline#bufferline#delete(7)
nmap <Leader>c8 <Plug>lightline#bufferline#delete(8)
nmap <Leader>c9 <Plug>lightline#bufferline#delete(9)
nmap <Leader>c0 <Plug>lightline#bufferline#delete(10)

" Remembers Folds
augroup remember_folds
    autocmd!
    autocmd BufWinLeave * mkview
    autocmd BufWinEnter * silent! loadview
augroup END
