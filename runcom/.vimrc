" let $VIMRUNTIME = "/usr/local/Cellar/vim/8.0.1800/share/vim/vim80/"
" set runtimepath=~/.vim/,~/.vim,/etc/vim,/usr/share/vim/vimfiles,/usr/share/vim/addons,/usr/share/vim/vim80,/usr/share/vim/vimfiles,/usr/share/vim/addons/after,~/.vim/after
" Section: Vundle

  set mouse=a
  set nocompatible              " be iMproved, required
  filetype off                  " required

  " VUNDLE
  " set the runtime path to include Vundle and initialize
  set rtp+=~/.vim/bundle/Vundle.vim
  scriptencoding utf-8
  call vundle#begin('~/.vim/bundle')

  " JS and React Stuff
  Plugin 'pangloss/vim-javascript'
  Plugin 'mxw/vim-jsx'
  Plugin 'gmarik/Vundle.vim'
  Plugin 'rking/ag.vim'
  Plugin 'kien/ctrlp.vim'
  Plugin 'rizzatti/dash.vim'
  Plugin 'editorconfig/editorconfig-vim'
  " Plugin 'ervandew/supertab'
  Plugin 'scrooloose/nerdtree'
  Plugin 'scrooloose/nerdcommenter'
  Plugin 'zxqfl/tabnine-vim'
  " Plugin 'luochen1990/rainbow'
  Plugin 'bling/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
  Plugin 'tpope/vim-endwise'
  Plugin 'elixir-editors/vim-elixir'
  Plugin 'tpope/vim-rails'
  Plugin 'kchmck/vim-coffee-script'
  Plugin 'Lokaltog/vim-easymotion'
  Plugin 'vim-ruby/vim-ruby'
  Plugin 'slim-template/vim-slim'
  Plugin 'tpope/vim-fugitive'
  Plugin 'tpope/vim-surround'
  Plugin 'scrooloose/syntastic'
  Plugin 'tmux-plugins/vim-tmux-focus-events' " support for vim-tmux-clipboard
  Plugin 'roxma/vim-tmux-clipboard'
  Plugin 'christoomey/vim-tmux-navigator' "Easy Pane Switching
  Plugin 'janko-m/vim-test' " TDD - run tests
  Plugin 'jgdavey/tslime.vim' " send commands to tmux (for tests)
  Plugin 'benmills/vimux'
  " Plugin 'junegunn/fzf'
  " Plugin 'junegunn/fzf.vim'

  " Plugin 'Valloric/YouCompleteMe'

  call vundle#end()            " required
  filetype plugin indent on    " required

" Airline
  set laststatus=2
  let g:airline_theme='solarized'
  let g:airline_section_a = airline#section#create(['mode'])
  let g:airline_section_b = airline#section#create([])
  let g:airline_section_c = airline#section#create(['%f'])
  let g:airline_section_x = airline#section#create_right([])
  let g:airline_section_y = airline#section#create_right([])
  let g:airline_section_z = airline#section#create_right(['%l/%L : %c'])
" Section: Basic VIM Setup
  " Remap leader key
  let mapleader=","

  ",v brings up my .vimrc
  map <leader>v :sp ~/.vimrc<CR><C-W>_
  ",V reloads it -- making all changes active (have to save first)
  map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

    " the finder window
  nmap <Leader>f :CtrlP<CR>
  nmap <Leader>F :CtrlP<CR><F5>
  " let ctrlp see hidden files by default
  let g:ctrlp_show_hidden = 1
  " let g:ctrlp_custom_ignore = {
  "   \ 'dir':  '\v[\/]\.(bundle)$',
  "   \ }
  " \ 'file': '\v\.(exe|so|dll)$',
  " \ 'link': 'some_bad_symbolic_links',
  let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/](\.bundle|\.sass-cache|\.git|\.hg|\.svn|tmp|_build|deps|node_modules|public\/assets\/js|public\/assets\/css|spec/fixtures)$',
    \ }

  " Make backspace work in insert mode
  set backspace=indent,eol,start

  " Display line numbers on the left
  set number
  " Put temp / swp files in specific place to keep local dir clean
  set directory=/tmp/

  " paste toggle
  nnoremap <leader>p :set invpaste paste?<CR>
  set pastetoggle=<leader>p
  set showmode

  " Enable per-directory .vimrc files
  " This lets you customize some things per the project you're in
  set exrc
  set secure  " disable unsafe commands in local .vimrc files

" Section: Random Productivity
  nnoremap <leader>o :!echo `git url`/blob/`git rev-parse --abbrev-ref HEAD`/%\#L<C-R>=line('.')<CR> \| xargs open<CR><CR>

" Section: Indentation
  set autoindent
  set shiftwidth=2
  set softtabstop=2
  set tabstop=2
  set expandtab

" Section: Colours!
  syntax enable
  set background=light
  colorscheme solarized
  let g:rainbow_active = 1
  let g:rainbow_conf = {
  \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
  \   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
  \   'operators': '_,_',
  \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
  \   'separately': {
  \       '*': {},
  \       'tex': {
  \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
  \       },
  \       'lisp': {
  \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
  \       },
  \       'vim': {
  \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
  \       },
  \       'html': 0,
  \       'css': 0,
  \   }
  \}

" Section: Search
  " Case insensitive search
  set ignorecase
  " Space bar gets rid of search
  nmap <space> :nohlsearch<CR>
  " Highlight matches
  set hlsearch

" Section: Whitespace
  " Display extra whitespace
  set list listchars=tab:»·,trail:·
  " Delete extra whitespace on save
  autocmd BufWritePre *.py :%s/\s\+$//e
  autocmd BufWritePre .vimrc :%s/\s\+$//e
  " unwanted whitespace removal/cleaning
  autocmd BufWritePre *.rb :%s/\s\+$//e
  autocmd BufWritePre *.ex :%s/\s\+$//e
  autocmd BufWritePre *.exs :%s/\s\+$//e
  autocmd BufWritePre *.py :%s/\s\+$//e
  autocmd BufWritePre *.php :%s/\s\+$//e
  autocmd BufWritePre *.haml :%s/\s\+$//e
  autocmd BufWritePre *.slim :%s/\s\+$//e
  autocmd BufWritePre *.js :%s/\s\+$//e
  autocmd BufWritePre *.jsx :%s/\s\+$//e
  autocmd BufWritePre *.coffee :%s/\s\+$//e
  autocmd BufWritePre *.feature :%s/\s\+$//e
  autocmd BufWritePre *.slimbars :%s/\s\+$//e

" Section: Turbux TDD - Keymaps for running tests
  " Specify Commands
  let test#filename_modifier = ":p"
  let test#strategy = "tslime"
  let g:tslime_always_current_session = 1
  let g:tslime_always_current_window = 1

  " Keymaps
  map <C-T> :TestFile<CR>    " t Ctrl+n
  map <C-F> :TestNearest<CR> " t Ctrl+f
  map <C-G> :TestSuite<CR>   " t Ctrl+s


" Section: NerdTree - Project Sidebar
  " quit NERDTree after openning a file
  let NERDTreeQuitOnOpen=1
  let NERDTreeShowHidden=1
  let g:NERDTreeIgnore=['.bundle','.git','node_modules']
  " Toggle NERDTree with <leader>,
  map <silent> <leader>. :execute 'NERDTreeToggle ' . getcwd()<CR>
  " Open current file in nerdtree
  nmap \| :execute 'NERDTreeFind'<CR>

" Section: Autocompletion!
  " let g:ycm_collect_identifiers_from_tags_files = 1

  " autocmd FileType ruby set omnifunc=rubycomplete#Complete
  " autocmd FileType python set omnifunc=pythoncomplete#Complete
  " autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
  " autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
  " autocmd FileType css set omnifunc=csscomplete#CompleteCSS
  " autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
  " autocmd FileType php set omnifunc=phpcomplete#CompletePHP
  " autocmd FileType c set omnifunc=ccomplete#Complete

" Section: Syntastic!
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*

  let g:syntastic_always_populate_loc_list = 0
  let g:syntastic_auto_loc_list = 0
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0
  let g:syntastic_javascript_checkers = ['eslint']

" Section: TMUX & System Clipboard
  set clipboard=unnamed
