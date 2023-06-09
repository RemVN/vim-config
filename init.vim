function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

language en_US.utf8

if exists('g:vscode')
    " vscode extension
	
else
    " normal neovim
	
	" install vim plug
	let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
	if empty(glob(data_dir . '/autoload/plug.vim'))
	  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
	endif
	
	" settings
	set number 
	set relativenumber
	set mouse=a
	set tabstop=4
	set softtabstop=4
	set shiftwidth=4
	set smarttab
	set expandtab
	set autoindent
	set list
	set encoding=UTF-8
	syntax on
	
	" enable copying from vim to clipboard 
	" if has('win32')
	"  set clipboard=unnamed  
	" else
	"  set clipboard=unnamedplus
	" endif
endif


" Plugins

call plug#begin()
	" normal vim
    Plug 'navarasu/onedark.nvim', Cond(!exists('g:vscode'))
    Plug 'vim-airline/vim-airline', Cond(!exists('g:vscode'))
    Plug 'vim-airline/vim-airline-themes', Cond(!exists('g:vscode'))
	Plug 'mattn/emmet-vim', Cond(!exists('g:vscode'))
	
	" vscode extension
	Plug 'AndrewRadev/splitjoin.vim'
	Plug 'andymass/vim-matchup'
	Plug 'tpope/vim-surround'
	Plug 'wellle/targets.vim'
call plug#end()

if exists('g:vscode')
    " vscode extension
else
    " normal neovim
	colorscheme onedark
endif

let g:matchup_surround_enabled = 1

" Extend files

runtime settings/common_keymap.vim