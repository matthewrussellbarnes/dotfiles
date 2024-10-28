" let $VIMRUNTIME = "/usr/local/Cellar/vim/8.0.1800/share/vim/vim80/"
" set runtimepath=~/.vim/,~/.vim,/etc/vim,/usr/share/vim/vimfiles,/usr/share/vim/addons,/usr/share/vim/vim80,/usr/share/vim/vimfiles,/usr/share/vim/addons/after,~/.vim/after
"
" NOTE: to run nvim-specific commands:
"  if has('nvim')
"      " Neovim specific commands
"  else
"      " Standard vim specific commands
"  endif
"
" Section: Vundle

  set mouse=a
  set nocompatible              " be iMproved, required
  filetype off                  " required

  " VUNDLE
  " set the runtime path to include Vundle and initialize
  set rtp+=~/.vim/bundle/Vundle.vim
  scriptencoding utf-8
  call vundle#begin('~/.vim/bundle')

  " Color Themes
  Plugin 'reedes/vim-colors-pencil'
  Plugin 'NLKNguyen/papercolor-theme'
  Plugin 'haishanh/night-owl.vim'
  Plugin 'macguirerintoul/night_owl_light.vim'
  Plugin 'tyrannicaltoucan/vim-quantum'
  " JS and React Stuff
  Plugin 'pangloss/vim-javascript'
  Plugin 'mxw/vim-jsx'
  Plugin 'peitalin/vim-jsx-typescript'
  Plugin 'nathangrigg/vim-beancount'
  Plugin 'gmarik/Vundle.vim'
  Plugin 'rking/ag.vim'
  " General purpose code complete, similar to VSCode
  Plugin 'neoclide/coc.nvim', {'branch': 'release'}
  Plugin 'ctrlpvim/ctrlp.vim'
  Plugin 'dart-lang/dart-vim-plugin'
  Plugin 'rizzatti/dash.vim'
  Plugin 'editorconfig/editorconfig-vim'
  Plugin 'scrooloose/nerdtree'
  Plugin 'scrooloose/nerdcommenter'
  Plugin 'tpope/vim-projectionist' " switch between file and :A alternate
  Plugin 'numirias/semshi' " better python syntax
  Plugin 'bling/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
  Plugin 'kchmck/vim-coffee-script'
  Plugin 'Lokaltog/vim-easymotion'
  Plugin 'elixir-editors/vim-elixir'
  Plugin 'tpope/vim-endwise'
  Plugin 'tpope/vim-fugitive'
  Plugin 'mustache/vim-mustache-handlebars'
  Plugin 'pantharshit00/vim-prisma'
  Plugin 'tpope/vim-rhubarb' " enable :Gbrowse in vim-fugitive to open Github
  Plugin 'jason0x43/vim-js-indent' " vim indenter for js and typescript
  Plugin 'Quramy/vim-js-pretty-template' " syntax high for js templates
  Plugin 'tpope/vim-rails'
  Plugin 'vim-ruby/vim-ruby'
  Plugin 'rlue/vim-fold-rspec'
  Plugin 'slim-template/vim-slim'
  Plugin 'scrooloose/syntastic'
  Plugin 'tpope/vim-surround'
  Plugin 'vim-test/vim-test' " TDD - run tests
  Plugin 'hashivim/vim-terraform' " Terraform
  Plugin 'roxma/vim-tmux-clipboard'
  Plugin 'tmux-plugins/vim-tmux-focus-events' " support for vim-tmux-clipboard
  Plugin 'christoomey/vim-tmux-navigator' "Easy Pane Switching
  Plugin 'leafgarland/typescript-vim' " syntax highlighting typescript
  Plugin 'Quramy/tsuquyomi' " access to TSserver for typscript
  Plugin 'jgdavey/tslime.vim' " send commands to tmux (for tests)
  Plugin 'benmills/vimux'
  Plugin 'sbdchd/neoformat'

  call vundle#end()            " required
  filetype plugin indent on    " required

" Airline
  set laststatus=2

  let g:airline_theme='papercolor'
  " let g:airline_theme='solarized'
  " let g:airline_theme='night-owl'
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
    \ 'dir':  '\v[\/](\.bundle|\.sass-cache|\.git$|\.hg|\.svn|tmp|_build|deps|node_modules|.venv|public\/assets\/js|public\/assets\/css|spec/fixtures)$',
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
  autocmd BufNewFile,BufRead *.html.erb.deface set filetype=mason

  " Solarized
  " set background=light
  " colorscheme solarized
  " PaperColor
  "   -> https://github.com/NLKNguyen/papercolor-theme
  "   -> to (manually) install for iTerm, go to:
  "      https://github.com/stoeffel/material-iterm
  " colorscheme papercolor
  " Pencil - set here and airline
  " colorscheme pencil
  " let g:pencil_higher_contrast_ui = 1
  " let g:pencil_neutral_code_bg = 1
  " Night Owl
  "   if (has("termguicolors"))
  "    set termguicolors
  "   endif

  "   " For Neovim 0.1.3 and 0.1.4
  "   let $NVIM_TUI_ENABLE_TRUE_COLOR=1

  "   """"" enable the theme

  "   syntax enable
  "   colorscheme night-owl
  "   set background=dark
  " Night Owl Light
   if (has("termguicolors"))
     set termguicolors
    endif
    syntax enable
    colorscheme night_owl_light


  " Easymotion targets are bright yellow in papercolor, which isn't readable
  "   in light mode
  hi link EasyMotionTarget Operator
  hi link EasyMotionTarget2First String
  hi link EasyMotionTarget2Second Operator
  " SECTION: Semshi changes some things to highlight text (yellow) which is hard to
  "   read
    function MyCustomHighlights()
      hi semshiLocal           ctermfg=209 guifg=#ff875f
      hi semshiGlobal          ctermfg=209 guifg=#ff9900
      hi semshiImported        ctermfg=208 guifg=#ff9900 cterm=bold gui=bold
      hi semshiParameter       ctermfg=68  guifg=#5f87d7
      hi semshiParameterUnused ctermfg=117 guifg=#87d7ff cterm=underline gui=underline
      hi semshiFree            ctermfg=218 guifg=#ffafd7
      hi semshiBuiltin         ctermfg=204 guifg=#ff5f87
      hi semshiAttribute       ctermfg=36  guifg=#00af87
      hi semshiSelf            ctermfg=245 guifg=#8a8a8a
      hi semshiUnresolved      ctermfg=208 guifg=#ff9900 cterm=underline gui=underline
      hi semshiSelected        ctermfg=231 guifg=#ffffff ctermbg=161 guibg=#d7005f

      hi semshiErrorSign       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
      hi semshiErrorChar       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
      sign define semshiError text=E> texthl=semshiErrorSign
    endfunction
    autocmd FileType python call MyCustomHighlights()
    autocmd ColorScheme * call MyCustomHighlights()
  " Solarized - set here and airline
  " colorscheme solarized
  " let g:rainbow_active = 1
  " let g:rainbow_conf = {
  " \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
  " \   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
  " \   'operators': '_,_',
  " \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
  " \   'separately': {
  " \       '*': {},
  " \       'tex': {
  " \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
  " \       },
  " \       'lisp': {
  " \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
  " \       },
  " \       'vim': {
  " \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
  " \       },
  " \       'html': 0,
  " \       'css': 0,
  " \   }
  " \}

"" Enable folding based on syntax rules
" set foldmethod=syntax

"" Adjust the highlighting
" highlight Folded guibg=grey guifg=blue

"" Map folding to Spacebar
" nmap <S-Space> za
  nmap <S-L> za

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

" Section: Vim projectionist (vim-test uses this for cases where it doesn't
"   know how to figure out the alternate file
  let g:projectionist_heuristics = {
    \   "etc/rbenv.d/|bin/rbenv-*": {
    \     "bin/rbenv-*": {
    \        "type": "command",
    \        "template": ["#!/usr/bin/env bash"],
    \     },
    \     "etc/rbenv.d/*.bash": {"type": "hook"}
    \   }
    \ }
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
  " There are many python test runners, and vim-test doesn't automatically
  " know which one to use
  let test#python#runner = 'pytest'


" Section: NerdTree - Project Sidebar
  " quit NERDTree after openning a file
  let NERDTreeQuitOnOpen=1
  let NERDTreeShowHidden=1
  let g:NERDTreeIgnore=['.bundle','.git$','node_modules']
  " Toggle NERDTree with <leader>,
  map <silent> <leader>. :execute 'NERDTreeToggle ' . getcwd()<CR>
  " Open current file in nerdtree
  nmap \| :execute 'NERDTreeFind'<CR>

" Section: Python
  filetype plugin on
  autocmd FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4 textwidth=80 smarttab expandtab


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

" Section: Code Formatting

" Section: Syntastic!
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*

  let g:syntastic_always_populate_loc_list = 0
  let g:syntastic_auto_loc_list = 0
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0
  let g:syntastic_javascript_checkers = ['eslint']
  let g:syntastic_typescript_checkers = ['tsuquyomi']
  let g:syntastic_python_checkers=['semshi']

" Section: Neoformat / Prettier (js)
"   source: https://prettier.io/docs/en/vim.html
  let g:neoformat_try_node_exe = 1
  autocmd BufWritePre *.js Neoformat

" Section: TMUX & System Clipboard
  set clipboard=unnamed

" Section: Elixir
  au BufRead,BufNewFile *.ex,*.exs set filetype=elixir
  au BufRead,BufNewFile *.eex,*.heex,*.leex,*.sface,*.lexs set filetype=eelixir
  au BufRead,BufNewFile mix.lock set filetype=elixir

" CoC extensions (language completion for Typescript etc)
"   NOTE: after install, coc must be built manually
"   cd ~/.vim/bundle/coc.nvim
"   yarn install
"   yarn build
  let g:coc_global_extensions = ['coc-solargraph', 'coc-tsserver']
  " Don't show analysis while easymotion is happening
  autocmd User EasyMotionPromptBegin :let b:coc_diagnostic_disable = 1
  autocmd User EasyMotionPromptEnd :let b:coc_diagnostic_disable = 0
  " use <tab> to trigger completion and navigate to the next complete item
  inoremap <expr> <Right> coc#pum#visible() ? coc#pum#confirm() : "\<Right>"
  inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
  inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

" Section: Typescript
  map <C-\> :TsuDefinition<CR>
  " tooltip? https://vimawesome.com/plugin/tsuquyomi
  " autocmd FileType typescript nmap <Leader>T : <C-u>echo tsuquyomi#hint()<CR>
