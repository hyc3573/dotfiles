let mapleader = " "

set nocompatible              " be iMproved, required
filetype off                  " required
set encoding=utf-8
set autoindent
set cindent
set smartindent
set wrap
set nowrapscan
set nobackup
set noswapfile
set ruler
set shiftwidth=4
set nu
set hls
set ic
set tabstop=4
set lbr
set incsearch
set cursorline
set laststatus=2
set background=dark
set backspace=eol,start,indent
set history=1000
highlight Comment term=bold cterm=bold ctermfg=4
set mouse=a
set mousemodel=popup_setpos
set t_Co=256
set encoding=utf-8
set wildmenu
set clipboard=unnamedplus
set undodir=$HOME/.vim/undodir
set undofile

if (has("termguicolors"))
	set termguicolors
endif


let g:C_Ctrl_j = 'off'

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

tnoremap <C-h> <C-w>h
tnoremap <C-j> <C-w>j
tnoremap <C-k> <C-w>k
tnoremap <C-l> <C-w>l

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'hdima/python-syntax'
Plugin 'scrooloose/nerdtree'
Plugin 'ycm-core/YouCompleteMe'
"Plugin 'neoclide/coc.nvim'
Plugin 'raimondi/delimitmate'
"Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
"Plugin 'vim-syntastic/syntastic'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'flazz/vim-colorschemes'
Plugin 'davidhalter/jedi-vim'
Plugin 'skywind3000/asyncrun.vim'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'sjl/gundo.vim'
Plugin 'pianocomposer321/project-templates.nvim', { 'do': ':UpdateRemotePlugins'}
"Plugin 'embear/vim-localvimrc'
Plugin 'airblade/vim-rooter'
"Plugin 'vim-scripts/vim-startify'
Plugin 'skywind3000/asynctasks.vim'
Plugin 'dense-analysis/ale'
Plugin 'doums/darcula'
Plugin 'Shougo/vimproc.vim'
Plugin 'puremourning/vimspector'
"Plugin 'wfxr/minimap.vim'
Plugin 'ryanoasis/vim-devicons'
Plugin 'liuchengxu/vim-which-key'
Plugin 'ahmedkhalf/project.nvim'
Plugin 'glepnir/dashboard-nvim'
Plugin 'nvim-telescope/telescope.nvim'
Plugin 'nvim-lua/plenary.nvim'
Plugin 'arcticicestudio/nord-vim'

call vundle#end()

filetype plugin indent on

let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_global_ycm_binary_path = 'python'
"set completeopt-=preview
let delimitMate_expand_cr = 1
let g:SimpylFold_docstring_preview=1

au BufNewFile, BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
	\ set fileformat=unix
	\ set encoding=utf-8 
"python with virtualenv support
python3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

"let python_highlight_all = 1
syntax on
set clipboard=unnamed

let g:airline#extensions#tabline#enabled = 1
		
inoremap jj <ESC>
let g:jedi#completions_enabled = 0

let g:ycm_semantic_triggers = {
				\	'VimspectorPrompt,vim,zsh,erlang,perl,c,cpp,objcpp,lua,cs,javascript,d,python,perl6,scala,vb,elixir,go,php,objc,sh,ocaml,ruby,java,jsp': ['re!\w+'],
				\}

set pumheight=10
let g:asyncrun_open=10

tnoremap <Esc> <C-\><C-n>
let g:airline_powerline_fonts = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
autocmd StdinReadPre * let s:std_in=1

let g:clang_complete_macros = 1

command WQ wq
command Wq wq
command W w
command Q q

let g:ycm_clangd_args=['--header-insertion=never']
"let g:ycm_autoclose_preview_window_after_completion = 1

"set termwinsize=10x0

set splitbelow

let g:ycm_show_diagnostics_ui = 0

"autocmd filetype python nnoremap <buffer> <silent> <F5> :w<cr>:!python %<cr>
"autocmd filetype bash nnoremap <buffer> <silent> <F5> :w<cr>:!bash %<cr>
"autocmd filetype c nnoremap <buffer> <silent> <F5> :w<cr>:!gcc -g %<cr>:!./a.out<cr>
"autocmd filetype cpp nnoremap <buffer> <silent> <F5> :w<cr>:!g++ -g %<cr>:!./a.out<cr>

"autocmd filetype python nnoremap <buffer> <silent> <F9> :w<cr>:!pdb3 %<cr>
"autocmd filetype c nnoremap <buffer> <silent> <F9> :w<cr>:!gcc -g %<cr>:!gdb a.out<cr>
"autocmd filetype cpp nnoremap <buffer> <silent> <F9> :w<cr>:!g++ -g %<cr>:!gdb a.out<cr>

let g:ycm_add_preview_to_completeopt = "popup"

let g:rooter_patterns = ['.projectroot']
let g:rooter_silent_chdir = 0

function LoadConf()
	if len(FindRootDirectory()) != 0
		let file = FindRootDirectory() . '/.Project.d/init.vim'
		if filereadable(file)
			exe 'source' file 
		endif
	endif
endfunction

autocmd VimEnter * call LoadConf()

let g:asyncrun_open = 6
let g:asyncrun_rootmarks = ['.projectroot']
let g:asynctasks_term_pos = 'bottom'
let g:asynctasks_config_name = '.Project.d/tasks.ini'

nnoremap <silent> <F7> :AsyncTask build_and_run<cr>
nnoremap <silent> <leader>r :AsyncTask build_and_run<cr>
"nnoremap <silent> <F7> :VBGtoggleBreakpointThisLine<cr>

let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1

let g:airline_theme = 'nord'
colorscheme nord

let g:ale_sign_error = ''
let g:ale_sign_warning = ''

let g:ycm_min_num_of_chars_for_completion = 99
let g:ycm_filepath_completion_use_working_dir = 1

function! s:vimscript_runner(opts)
    execute a:opts.cmd
endfunction
let g:asyncrun_runner = get(g:, 'asyncrun_runner', {})
let g:asyncrun_runner.vimscript = function('s:vimscript_runner')

let g:vimspector_enable_mappings = 'HUMAN'

function RepositionNerdTree()
	NERDTreeFocus
	execute "normal! \<C-w>H"
	vertical resize 30
endfunction
autocmd User VimspectorUICreated call RepositionNerdTree()

vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa
tmap <C-v> <C-W>"+

let g:dashboard_custom_header = [
			\'   ###    #     #                     #                            ######  ####### #     #',
			\'    #     #     #  ####  ######      # #   #####   ####  #    #    #     #    #    #  #  #',
			\'    #     #     # #      #          #   #  #    # #    # #    #    #     #    #    #  #  #',
			\'    #     #     # #      #          #   #  #    # #    # #    #    #     #    #    #  #  #',
			\'    #     #     #  ####  #####     #     # #    # #      ######    ######     #    #  #  #',
			\'    #     #     #      # #         ####### #####  #      #    #    #     #    #    #  #  #',
			\'    #     #     # #    # #         #     # #   #  #    # #    #    #     #    #    #  #  #',
			\'   ###     #####   ####  ######    #     # #    #  ####  #    #    ######     #     ## ##',
			\'',
			\'',
			\]

let g:minimap_width = 15
let g:minimap_auto_start = 1

"autocmd TabNew,VimEnter * execute "normal :NERDTreeClose\<CR>"
"autocmd TabNew,VimEnter * execute "normal :NERDTree\<CR>\<C-w>l"
"autocmd TabNew,VimEnter * execute "normal :term ++rows=10\<CR>\<C-w>k"

noremap <silent> <leader>h :noh<CR>
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
noremap <silent> <C-a> ggvGG$
nnoremap <silent> <leader>c :so ~/.vimrc<CR>
nnoremap <silent> <leader>t :term ++rows=10<CR>
nnoremap <silent> <S-h> :bp<CR>
nnoremap <silent> <S-l> :bn<CR>

set timeoutlen=0

let g:rooter_manual_only = 1
autocmd BufNew,TabNew,BufEnter,TabEnter * Rooter

lua << EOF
  require("project_nvim").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
	patterns = {".projectroot"},
	require('telescope').load_extension('projects'),
  }
EOF

let g:dashboard_custom_section = {
	\'recent_files' :{
		\ 'description': [' Recent files                        SPC f h'],
		\ 'command': 'DashboardFindHistory'},
	\'projects' :{
		\ 'description': [' Projects                              SPC p'],
		\ 'command': 'Telescope projects'},
	\'new_file' :{
		\ 'description': [' New file                            SPC c n'],
		\ 'command': 'DashboardNewFile'},
	\'vimrc'    :{
		\ 'description': [' .vimrc                              SPC e v'],
		\ 'command': 'e ~/.vimrc'},
	\'cpp'      :{
		\ 'description': [' 20.cpp                              SPC e c'],
		\ 'command': 'e ~/projects/20.cpp'}
\ }

let g:dashboard_default_executive = 'telescope'
nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>
nnoremap <silent> <Leader>fh :DashboardFindHistory<CR>
nnoremap <silent> <Leader>ff :DashboardFindFile<CR>
nnoremap <silent> <Leader>tc :DashboardChangeColorscheme<CR>
nnoremap <silent> <Leader>fa :DashboardFindWord<CR>
nnoremap <silent> <Leader>fb :DashboardJumpMark<CR>
nnoremap <silent> <Leader>cn :DashboardNewFile<CR>
nnoremap <silent> <Leader>ev :e ~/.vimrc<CR>
nnoremap <silent> <Leader>p :Telescope projects<CR>
nnoremap <silent> <Leader>ec :e ~/projects/20.cpp<CR>

nnoremap <silent> <F8> :make -f .makefile build_and_make

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_simple_template_highlight = 1
