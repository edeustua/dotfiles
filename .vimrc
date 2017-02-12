""" MAIN CONFIGURATION {
" File detection
	filetype on
	filetype plugin indent on
	syntax on 

	autocmd! bufwritepost .vimrc source %	" Auto source vim when saving
" General
	set bs=2				" Fix backspace
	set number 				" Turn on line numbers and highlight colors
	set ruler 				" Always show current positions along the bottom
	set showcmd 				" Show the command being typed
	set autoindent 				" Autoindent spaces
	"set cursorline
	set nocursorcolumn
	set nocursorline
	set laststatus=2
	set grepprg=grep\ -nH\ $*
	set pastetoggle=<F2>
	set clipboard=unnamed
	set background=dark
	set autoread 				" Set to auto read when a file is changed from the outside
	set tags=tags;

	syntax sync minlines=256
" Colors
	set t_Co=16				" 256 colors
	let g:hybrid_custom_term_colors = 1
	colorscheme hybrid

" Mappings
	map <Space> <leader>
	nnoremap <leader>] <C-]> 
	nnoremap <F5> :GundoToggle<CR>
	nnoremap <F6> :NERDTreeToggle<CR>
" }

""" FILE TYPE SETTINGS {
"	autocmd Filetype php setlocal sts=4 sw=4 expandtab
"	autocmd Filetype javascript setlocal sts=4 sw=4 expandtab
"
" C
	autocmd Filetype c setlocal sts=4 sw=4 expandtab

" PYTHON
	autocmd Filetype python setlocal sts=4 sw=4 expandtab

" RUST 
"	autocmd Filetype rust setlocal sts=4 sw=4 expandtab

" HTML 
	autocmd Filetype html setlocal sts=2 sw=2 expandtab

" LaTeX
	autocmd Filetype tex setlocal tw=80 sts=4 sw=4 expandtab

" FORTRAN
	autocmd Filetype fortran setlocal sts=4 sw=4 expandtab

" Bash
	autocmd Filetype sh setlocal sts=4 sw=4 expandtab

" Fortran for gamess
	au BufRead,BufNewFile *.src setlocal filetype=fortran
"	let fortran_free_source=1
	let fortran_do_enddo=1

"	autocmd Filetype c setlocal sts=4 sw=4 expandtab
"	autocmd Filetype ruby setlocal sts=2 sw=2 expandtab
"	autocmd Filetype vcl setlocal sts=4 sw=4 expandtab
"	autocmd Filetype json setlocal sts=4 sw=4 expandtab
"	autocmd Filetype erb setlocal sts=4 sw=4 expandtab
"	autocmd BufNewFile,BufReadPost *.md set filetype=markdown
	au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
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

""" PLUGINS {
" PATHOGEN INIT
	call pathogen#infect()
	call pathogen#helptags()

"RUST
	let g:rustfmt_autosave = 1

" VIM-LATEX 
	let g:tex_flavor='latex'
	let g:Tex_CompileRule_pdf = 'pdflatex -synctex=1 -interaction=nonstopmode $*'
	let g:Tex_DefaultTargetFormat = 'pdf'
	let g:Text_MultipleCompileFormats = 'pdf, aux'
	let g:Tex_ViewRule_pdf = 'zathura'
"	let g:Tex_FormatDependency_pdf = 'dvi,pdf'

" PYTHON-MODE
"	let ropevim_enable_shortcuts = 1
	let g:pymode_folding = 0
	"let g:pymode_rope_goto_def_newwin = "vnew"
	"let g:pymode_rope_extended_complete = 1
	let g:pymode_rope = 0
	let g:pymode_rope_lookup_project = 0
"	let g:pymode_breakpoint = 0
"	let g:pymode_syntax = 1
"	let g:pymode_syntax_builtin_objs = 0
"	let g:pymode_syntax_builtin_funcs = 0

"	set completeopt=longest,menuone		" Better navigatinf through omnicomplete
"	function! OmniPopup(action)
"		if pumvisible()
"			if a:action == 'j'
"				return "\<C-N>"
"			elseif a:action == 'k'
"				return "\<C-P>"
"			endif
"		endif
"		return a:action
"	endfunction
"
" LIGHT-LINE
	let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive',
      \   'readonly': 'LightLineReadonly',
      \   'modified': 'LightLineModified',
      \   'filename': 'LightLineFilename'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

function! LightLineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '' : ''
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() : 
        \  &ft == 'unite' ? unite#get_status_string() : 
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? ' '._ : ''
  endif
  return ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

" SYNTASTIC
"	set statusline+=%#warningmsg#
"	set statusline+=%{SyntasticStatuslineFlag()}
"	set statusline+=%*
"	
"	let g:syntastic_always_populate_loc_list = 1
"	let g:syntastic_auto_loc_list = 1
"	let g:syntastic_check_on_open = 1
"	let g:syntastic_check_on_wq = 0

" NERDTREE
"	let NERDChristmasTree = 1
"	let NERDTreeHighlightCursorline = 1
" }
