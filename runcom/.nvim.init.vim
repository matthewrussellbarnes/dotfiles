set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
" disable cursor shaping (make it square)
set guicursor=a:blinkon100
