set nocompatible
set encoding=utf-8
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'encody/nvim', {'rtp': 'colors/'}

Plugin 'ervandew/eclim'

Plugin 'smancill/darkglass', {'rtp': 'colors/'}

Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'scrooloose/nerdtree'

Plugin 'jeetsukumaran/vim-buffergator'

Plugin 'terryma/vim-multiple-cursors'

Plugin 'vim-syntastic/syntastic'

Plugin 'vim-airline/vim-airline'

Plugin 'vim-airline/vim-airline-themes'

"Golang-Specific
Plugin 'fatih/vim-go'

"Javascript-Specific
Plugin 'digitaltoad/vim-pug.git'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'larsbs/vimterial_dark'

Plugin 'neoclide/vim-jsx-improve'

Plugin 'posva/vim-vue'

"Templating
Plugin 'noahfrederick/vim-skeleton'


call vundle#end()
filetype plugin indent on

colorscheme potato
syntax on
set term=screen-256color
set nocompatible
set nobackup
set lazyredraw
set novisualbell
set showmatch
set number
set expandtab
set shiftwidth=2
set softtabstop=2
set mouse=a
set noeb visualbell t_vb=
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

autocmd Filetype go setlocal ts=4 sw=4 sts=0 noexpandtab

if has("mouse_sgr")
  set ttymouse=sgr
else
  set ttymouse=xterm2
end

set clipboard=unnamed

nmap ; :
nnoremap ,cd :lcd %:p:h<CR>:pwd<CR>
nnoremap ,b :BuffergatorToggle<CR>
nnoremap ,l :NERDTree<CR>
nnoremap ,s :vs<CR>
nnoremap ,q :q<CR>
nnoremap ,e :e .<CR>
nnoremap ,0 :SyntasticToggleMode<CR>
nnoremap ,J :JavaDocComment<CR>

vnoremap <C-k> :m '<-2<CR>gv=gv
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap ,y "+y
nnoremap <C-k> :m .-2<CR>==
nnoremap <C-j> :m .+1<CR>==

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%F

highlight QuickFixLine guibg=None ctermbg=None 
au BufNewFile,BufRead *.ejs set filetype=html
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_files = 500
let g:ctrlp_max_depth = 10
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.yardoc\|public\/images\|public\/system\|data\|log\|tmp$',
  \ 'file': '\.exe$\|\.so$\|\.dat$'
  \ }

let g:go_highlight_structs = 1 
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1 

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:airline_theme = 'light'
let g:jsx_ext_required = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_aggregate_errors = 1

let g:syntastic_javascript_checkers = ['jshint', 'eslint']
let g:syntastic_ruby_checkers = ['rubocop', 'flog', 'reek']
let g:syntastic_go_checkers = ['go', 'golint', 'errcheck', 'govet']
let g:syntastic_java_checkers = ['checkstyle']
let g:syntastic_java_checkstyle_classpath = './.vim/checkstyle-8.16-all.jar'
let g:syntastic_java_checkstyle_conf_file = '/Users/buzzbumble/eclipse_workspace/check.xml'

let g:syntastic_html_checkers=['']

let g:javascript_plugin_flow = 1

autocmd FileType vue syntax sync fromstart
" CtrlP auto cache clearing.
" ----------------------------------------------------------------------------
function! SetupCtrlP()
  if exists("g:loaded_ctrlp") && g:loaded_ctrlp
    augroup CtrlPExtension
      autocmd!
      autocmd FocusGained  * CtrlPClearCache
      autocmd BufWritePost * CtrlPClearCache
    augroup END
  endif
endfunction
if has("autocmd")
  autocmd VimEnter * :call SetupCtrlP()
endif
