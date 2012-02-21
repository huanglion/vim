set nospell
" Basics {
	"set nocompatible
	set syntax=on
	set noeb
	set autoindent
	set cindent
	set tabstop=4
	set softtabstop=4
	set shiftwidth=4
	set noexpandtab
	set number
	set nofoldenable
	filetype on
	filetype plugin on
	filetype indent on
	set nobackup
	set noswapfile
	set ignorecase
	set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
	set encoding=utf-8
	
" }

" Vim UI {
	" syntax enable
	set background=dark
	colors solarized
	set guifont=Ubuntu\ Mono\ 12
	set showmode   " display the current mode
	set cursorline " highlight current line
	set laststatus=2
	if has("statusline")
 		set statusline=%<%f\ %h%m%r%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-14.(%l,%c%V%)\ %P
	endif

	"设tab page上显示简短文件名 -------
	function ShortTabLabel ()
		let bufnrlist = tabpagebuflist (v:lnum)
		let label = bufname (bufnrlist[tabpagewinnr (v:lnum) -1])
		let filename = fnamemodify (label, ':t')
		return filename
	endfunction
	set guitablabel=%{ShortTabLabel()}

" }

"Key map {
	" NERDTreeToggle
	map <F10> :NERDTreeToggle<CR>

	"为zencoding.vim设置的快捷键-------------
	let g:user_zen_settings = {
	\  'indentation' : '  ',
	\  'perl' : {
	\    'aliases' : {
	\      'req' : 'require '
	\    },
	\    'snippets' : {
	\      'use' : "use strict\nuse warnings\n\n",
	\      'warn' : "warn \"|\";",
	\    }
	\  }
	\}
	let g:user_zen_expandabbr_key = '<F4>'
	let g:use_zen_complete_tag = 1
" }
autocmd! BufNewFile * silent! 0r ~/.vim/myTemplate/%:e.tpl
