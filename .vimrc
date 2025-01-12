set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'vim-scripts/FuzzyFinder'
Plugin 'davidhalter/jedi-vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'preservim/nerdtree'
Plugin 'ervandew/supertab'
Plugin 'vim-syntastic/syntastic'
Plugin 'preservim/tagbar'
Plugin 'SirVer/ultisnips'
Plugin 'vim-airline/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'honza/vim-snippets'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'pignacio/vim-yapf-format'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line



" Pathogen
" execute pathogen#infect()

" tabnine
set rtp+=$HOME/.vim/bundle/tabnine-vim

" Bind F8 to run python and F9 to run ipython
nnoremap <buffer> <F8> :exec '!python' shellescape(@%, 1)<cr>
nnoremap <buffer> <F9> :exec '!ipython -i' shellescape(@%, 1)<cr>

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>

" grep from vim for the word that the cursor is currently on using control+A
:nmap <C-A> :vimgrep /<C-R><C-W>/ **/*.py\|copen 10<CR>

" ycm - instead, using vim-jedi and neocomplete (faster for python)
"
" Disabling the apearence of function documentation (Since it could be laggy)
"function CompDocOff()
"    :let g:pymode_rope_lookup_project=0
"    :let g:pymode_rope_complete_on_dot=0
"    :let g:pymode_rope=0
"endfunction
"
"exec CompDocOff()

" jedi (python addons) ----

" Disable dot suggestions (very slow)
let g:jedi#popup_on_dot = 0

" Go to definition
let g:jedi#goto_command = ',d'
" Go to definition in new tab
nmap ,D :split<CR>:call jedi#goto()<CR>
" Find ocurrences
let g:jedi#usages_command = ',o'
" Find assignments
let g:jedi#goto_assignments_command = ',a'
" Rename variable
let g:jedi#rename_command = ',r'
" Auto Complete
let g:jedi#completions_command = "<C-Space>"
" Documentation
let g:jedi#documentation_command = "K"

" yapf-format (auto formatting) ----
map <c-f> :'<,'>YAPF<CR>
map <c-f><c-f> :YAPF<CR>

" py-flake8 (syntax and error checker ----
autocmd FileType python map <buffer> <F3> :call Flake8()<CR>

" syntastic (check errors and conventions) ----
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" Nerd Tree ----
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeIgnore = ['\.pyc$']

" Nerd commenter ----
" Comment lines by selecting and 'leader + c + space'

" Color Molokai ----
let g:molokai_original=0
colorscheme molokai
set t_Co=256

" fuzzy ----
" **/ enables search over all subdirs
map <C-\> :FufFile **/<CR>

" tagbar ----
nmap , :TagbarToggle<CR>
nmap <F12> <C-]>
set tags=./tags;/
let g:tagbar_ctags_bin='$HOME/.vim/bin/ctags'

" python-mode ---- (using jedi instead)
"set nofoldenable " disable folding

" airline ----
set laststatus=2 
set statusline+=%{fugitive#statusline()}

" fugitive (git commands integration) ---

" gitgutter (shows modifications from last commit)

" snipets ----

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
 
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-j>"

" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"

" more python helpers ----
"set iskeyword-=_

" ----

" save as sudo
ca w!! w !sudo tee "%"

" enable syntax highlighting
syntax enable

" highlight search
set hlsearch

" set undo file
set undofile
set undodir=$HOME/.vimundo/

" show line numbers
set number

" ignore case-sensitive on search
:set ignorecase

" set tabs to have 4 spaces
set ts=4

" indent when moving to the next line while writing code
set autoindent

" expand tabs into spaces
set expandtab

" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4

" show a visual line under the cursor's current line
"set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

" enable all Python syntax highlighting features
let python_highlight_all = 1

" vim w python 2:

"python << EOF
"import vim
"import re
"
"
"ipdb_breakpoint = 'import ipdb; ipdb.set_trace()'
"
"def set_breakpoint():
"    breakpoint_line = int(vim.eval('line(".")')) - 1
"
"    current_line = vim.current.line
"    white_spaces = re.search('^(\s*)', current_line).group(1)
"
"    vim.current.buffer.append(white_spaces + ipdb_breakpoint, breakpoint_line)
"
"vim.command('map <f6> :py set_breakpoint()<cr>')
"
"def remove_breakpoints():
"    op = 'g/^.*%s.*/d' % ipdb_breakpoint
"    vim.command(op)
"
"vim.command('map <f7> :py remove_breakpoints()<cr>')
"EOF

" vim w python 3:

func! s:SetBreakpoint()
    cal append('.', repeat(' ', strlen(matchstr(getline('.'), '^\s*'))) . 'import ipdb; ipdb.set_trace()')
endf

func! s:RemoveBreakpoint()
    exe 'silent! g/^\s*import\sipdb\;\?\n*\s*ipdb.set_trace()/d'
endf

func! s:ToggleBreakpoint()
    if getline('.')=~#'^\s*import\sipdb' | cal s:RemoveBreakpoint() | el | cal s:SetBreakpoint() | en
endf
nnoremap <F6> :call <SID>ToggleBreakpoint()<CR>
