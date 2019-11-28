" Vim bundle .vimrc
" Description: Vim (soon to be) bundle (but for now just) .vimrc
" Author: tigr aka panoplied <panoplied@yandex.ru>
" URL: https://github.com/panoplied/vim
" Thanks: miripiruni

" Required configure options for compilataion stated in parentheses as (+option)
" VIM ver >=700 is implied


" 'Make Vim more useful' aka 'enter the current millenium' aka 'forget vi'
set nocompatible

" Turn on filetypes and plugins and indents
filetype plugin indent on


" VIM PLUG

" https://github.com/junegunn/vim-plug - manual here

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" The plugins. Only single quotes allowed (!)
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}

" Initialize plugin system
call plug#end()



" INTERFACE

    " Turn on the lights
    syntax on

    " Set title of the window to filename (+title)
    set title

    " Always show tabs
    " set showtabline=2

    " Show (partial) commands history in the last line of the screen (+cmdline_info)
    set showcmd

    " Character encoding inside Vim
    set encoding=utf-8

    " Encodings considered when starting editing existing file
    set fileencodings=utf-8,cp1251

    " Add LF in the end of file
    set fileformat=unix


    " EDITOR

        " Turn on line numbers
        set number

        " Minimum number of lines to keep above and below the cursor
        set scrolloff=5

        " Number of column to be highlighted (+syntax)
        set colorcolumn=80

        " Display invisible characters
        set list
        set listchars=tab:»\ ,trail:·,extends:>,precedes:<,nbsp:_

        " Wrap long lines
        set wrap

        " Don't break words when wrapping (+linebreak)
        set linebreak

        " Show ↪ at the beginning of wrapped lines
        " if has("linebreak")
        "    let &sbr = nr2char(8618).' '
        " endif

        " Copy indent from current line when starting a new one
        set autoindent

        " Do smart indent when starting a new line (+smartindent)
        set smartindent

        " Use spaces instead of tab for indentation
        set expandtab

        " Number of spaces tab counts for
        set tabstop=4

        " Number of spaces tab counts for editing operations
        set softtabstop=4

        " Number of spaces when (auto)indenting
        set shiftwidth=4

        " Number of pixel lines inserted between characters (+GUI)
        " set linespace=1

        " Highlight the screen line with the cursor (+syntax)
        " set cursorline
        " hi CursorLine term=bold cterm=bold guibg=Grey40

        " Turn off cursor blinking in normal mode (+GUI)
        set guicursor=n:blinkon0

        " Turn off all components and options of the GUI (+GUI)
        " set guioptions=

        " Number of colors
        " set t_Co=256

        " True color support
        " set termguicolors


    " STATUS LINE

        function! FileSize()
            let bytes = getfsize(expand("%:p"))
            if bytes <= 0
                return ""
            endif
            if bytes < 1024
                return bytes . "B"
            else
                return (bytes / 1024) . "K"
            endif
        endfunction

        function! CurDir()
            return expand("%:p:~")
        endfunction

        " Last window always has a status line
        set laststatus=2

        " Content of the status line

            set statusline=

            " Buffer number
            set statusline+=[%n]

            " File name
            set statusline+=\ \ %t

            " Modified flag
            set statusline+=%m

            " Paste mode flag
            set statusline+=\ \ %{&paste?'[paste]\ ':''}

            " File encoding
            " set statusline+=%{fileencoding?&fileencoding:&encoding}

            " Type of file (+autocmd)
            set statusline+=\ \ %Y

            " Column number
            set statusline+=\ %3.3(%c%)

            " Current line / number of lines in buffer
            set statusline+=\ \ %3.9(%l/%L%)

            " Percentage trough file in lines
            set statusline+=\ \ %2.3p%%

            " File size
            set statusline+=\ \ %{FileSize()}

            " Truncate here if the line is too long
            set statusline+=%<

            " File path
            set statusline+=\ \ %{CurDir()}

        " Encodings menu
        menu Encoding.UTF-8 :e ++enc=utf8<CR>
        menu Encoding.Windows-1251 :e ++enc=cp1251<CR>
        menu Encoding.koi8-r :e ++enc=koi8-r<CR>
        menu Encoding.cp866 :e ++enc=cp866<CR>


" SEARCH

    " While typing search command, show pattern matches as it's typed (+extra_search)
    set incsearch

    " When there's a previous search pattern highlight all its matches (+extra_search)
    set hlsearch

    " Ignore case in patterns
    set ignorecase

    " Override 'ignorecase' if the pattern contains uppercase characters
    set smartcase

    " All matches in a line are substituted instead of one
    set gdefault


" FILE SEARCH AND WILDMENU

    " Search down into subfolders
    " Provide tab-completion for all file-related tasks
    set path+=**

    " Display all matching files when tab complete
    set wildmenu

    " Set completion mode
    " When more than one match, list all the matches and complete first one
    " Then complete the next full match
    set wildmode=list:longest,full

    " Ignore filetypes when completing
        " Version control
        set wildignore+=.git    " ,.hg,.svn 
        " Python bytecode
        " set wildignore+=*.pyc
        " Binary images
        " set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
        " Apple's OSX degenerate shit
        " set wildignore+=*.DS_Store


" SPELL CHECKING

    set nospell
    menu Spell.off :setlocal spell spelllang=<CR>
    menu Spell.Russian+English :setlocal spell spelllang=ru,en<CR>
    menu Spell.Russian :setlocal spell spelllang=ru<CR>
    menu Spell.English :setlocal spell spelllang=en<CR>
    menu Spell.-SpellControl- :
    menu Spell.word\ Suggest<Tab>z= z=
    menu Spell.Previous\ Wrong\ Word<Tab>[s [s
    menu Spell.Next\ Wrong\ Word<Tab>]s ]s


" REMAP RUSSIAN KEYS

    set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>


" ENVIRONMENT

    " Store lots of history entries, cmdline and search patterns
    set history=1000


" FOLDING

    " TODO


" VUNDLE BUNDLES

    " TODO
