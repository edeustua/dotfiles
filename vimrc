set nocompatible              " be iMproved, required
filetype off                  " required

""" PLUGINS {
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Colors and visual
Plugin 'w0ng/vim-hybrid'

" Functionality
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'jamessan/vim-gnupg'
Plugin 'tpope/vim-surround'

" Language dependent
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'nathangrigg/vim-beancount'
Plugin 'rust-lang/rust.vim'
Plugin 'sirtaj/vim-openscad'

call vundle#end()            " required
filetype plugin indent on    " required

" Colors
set t_Co=16				" 256 colors
let g:hybrid_custom_term_colors = 1
colorscheme hybrid

" Airline
let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'
set laststatus=2

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"let g:syntastic_fortran_remove_include_errors = 1
"let g:syntastic_fortran_include_dirs = ["/home/edeustua/Downloads/hande/dest/ifort.impi", "headers"]"
"    \ "active_filetypes": ["ruby", "php"],
let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "passive_filetypes": ["fortran"] }


" YouCompleteMe
"let g:loaded_youcompleteme = 1
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" }

syntax on

autocmd! bufwritepost .vimrc source %	" Auto source vim when saving

" General
set backspace=indent,eol,start " Fix backspace
set history=200

set number " Turn on line numbers and highlight colors
set ruler " Always show current positions along the bottom
set showcmd " Show the command being typed
set autoindent " Autoindent spaces
set splitright " Vertical splits open to the right of the current file
set splitbelow " New split goes down
set nocursorcolumn
set nocursorline
set incsearch

set grepprg=grep\ -nH\ $*
set pastetoggle=<F2>
set clipboard=unnamed
set background=dark
set autoread 				" Set to auto read when a file is changed from the outside
set tags=tags;

"set cursorline

syntax sync minlines=256

" Mappings
map <Space> <leader>
nnoremap <leader>] <C-]>
nnoremap <F5> :GundoToggle<CR>
nnoremap <F6> :NERDTreeToggle<CR>

""" FILE TYPE SETTINGS {
"	autocmd Filetype php setlocal sts=4 sw=4 expandtab
"	autocmd Filetype javascript setlocal sts=4 sw=4 expandtab
"
" C
"autocmd Filetype c setlocal sts=4 sw=4 expandtab

" C++
au BufNewFile,BufRead *.cc
			\ setl tabstop=4 |
			\ setl softtabstop=4 |
			\ setl shiftwidth=4 |
			\ setl textwidth=70 |
			\ setl expandtab |
			\ setl autoindent |
			\ setl fileformat=unix

" PYTHON
" autocmd Filetype python setlocal sts=4 sw=4 expandtab
au BufNewFile,BufRead *.py
			\ setl tabstop=4 |
			\ setl softtabstop=4 |
			\ setl shiftwidth=4 |
			\ setl textwidth=70 |
			\ setl expandtab |
			\ setl autoindent |
			\ setl fileformat=unix

let python_highlight_all=1

" OpenSCAD
au BufNewFile,BufRead *.scad
			\ setl tabstop=4 |
			\ setl softtabstop=4 |
			\ setl shiftwidth=4 |
			\ setl textwidth=70 |
			\ setl expandtab |
			\ setl autoindent |
			\ setl fileformat=unix

" HTML
"autocmd Filetype html setlocal sts=2 sw=2 expandtab
au BufNewFile,BufRead *.js
			\ setl tabstop=2 |
			\ setl softtabstop=2 |
			\ setl shiftwidth=2 |

au BufNewFile,BufRead *.html
			\ setl tabstop=2 |
			\ setl softtabstop=2 |
			\ setl shiftwidth=2 |

au BufNewFile,BufRead *.css
			\ setl tabstop=2 |
			\ setl softtabstop=2 |
			\ setl shiftwidth=2 |


" RUST
"	autocmd Filetype rust setlocal sts=4 sw=4 expandtab

" OCaml
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
au BufNewFile,BufRead *.ml
			\ setl tabstop=2 |
			\ setl softtabstop=2 |
			\ setl shiftwidth=2 |
			\ setl textwidth=80 |
			\ setl expandtab |
			\ setl autoindent |
			\ setl fileformat=unix


" LaTeX
autocmd Filetype tex setlocal tw=80 sts=4 sw=4 expandtab

" LaTeX
autocmd Filetype rst setlocal tw=80 sts=3 sw=3 expandtab

" FORTRAN
au BufNewFile,BufRead *.f90
			\ setl tabstop=4 |
			\ setl softtabstop=4 |
			\ setl shiftwidth=4 |
			\ setl textwidth=80 |
			\ setl expandtab |
			\ setl autoindent |
			\ setl fileformat=unix |
			\ let b:fortran_fixed_source=0 |
			\ setl filetype=fortran

" FORTRAN 77
au BufNewFile,BufRead *.f
			\ setl tabstop=2 |
			\ setl softtabstop=2 |
			\ setl shiftwidth=2 |
			\ setl textwidth=80 |
			\ setl expandtab |
			\ setl autoindent |
			\ setl fileformat=unix |
			\ let b:fortran_fixed_source=1 |
			\ setl filetype=fortran

" Fortran for gamess
au BufRead,BufNewFile *.src setlocal filetype=fortran

let fortran_do_enddo=1


" Bash
autocmd Filetype sh setlocal sts=4 sw=4 expandtab

"	autocmd Filetype c setlocal sts=4 sw=4 expandtab
"	autocmd Filetype ruby setlocal sts=2 sw=2 expandtab
"	autocmd Filetype vcl setlocal sts=4 sw=4 expandtab
"	autocmd Filetype json setlocal sts=4 sw=4 expandtab
"	autocmd Filetype erb setlocal sts=4 sw=4 expandtab
"	autocmd BufNewFile,BufReadPost *.md set filetype=markdown
au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown

" Match trailing whitespaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
" }


""" COLORS {
" syntax highlighting groups
"hi Comment      ctermfg=7
"hi Constant     ctermfg=13
"hi String	ctermfg=1
"hi Identifier   ctermfg=10
"hi Statement    ctermfg=14
"hi PreProc      ctermfg=14
"hi Type         ctermfg=10
"hi Special      ctermfg=3
"hi Underlined   ctermfg=7
"hi Ignore       ctermfg=9
"hi Error        ctermfg=11
"hi Todo         ctermfg=1
"hi Normal ctermfg=none ctermbg=none
"hi NonText ctermfg=0 ctermbg=none
"hi Directory	ctermfg=12

"hi VertSplit	ctermfg=0 ctermbg=none
"hi StatusLine	ctermfg=0 ctermbg=none
"hi StatusLineNC	ctermfg=0 ctermbg=none

"hi Folded ctermbg=0 ctermfg=8

"hi Pmenu ctermfg=7 ctermbg=0
"hi PmenuSel ctermfg=0 ctermbg=15
"hi LineNr ctermfg=8 ctermbg=none
"hi CursorLine ctermfg=none ctermbg=0 cterm=none
"hi CursorLineNr ctermfg=none ctermbg=0
"hi CursorColumn ctermfg=none ctermbg=0

"" Syntax checker colors
"highlight SignColumn ctermbg=none
"hi SyntasticErrorSign ctermfg=1 ctermbg=none
"hi SyntasticWarningSign ctermfg=3 ctermbg=none
"hi SyntasticStyleErrorSign ctermfg=1 ctermbg=none
"hi SyntasticStyleWarningSign ctermfg=3 ctermbg=none
"hi SyntasticErrorLine ctermfg=none ctermbg=none
"hi SyntasticWarningLine ctermfg=none ctermbg=none
"hi SyntasticStyleErrorLine ctermfg=none ctermbg=none
"hi SyntasticStyleWarningLine ctermfg=none ctermbg=none
"hi SpellBad ctermfg=0 ctermbg=3
"hi SpellCap ctermfg=0 ctermbg=1
" }
