" Description: .vimrc + vim-plug configuration
" Author: tigr aka panoplied <panoplied@yandex.ru>
" URL: https://github.com/panoplied/vim
" Thanks: miripiruni

" Vim >= 8.0 required

" Required autoconf options for manual build stated in parentheses as (+option)
" Recommended .vimrc options for plugins marked with plugins names as [plug]


" EDITING SETTINGS

" 'Make Vim more useful' aka 'enter the current millenium' aka 'forget vi'
set nocompatible

" Character encoding inside Vim
set encoding=utf-8

" Encodings considered when starting editing existing file
set fileencodings=utf-8,cp1251

" Don't forget to set nerd font for https://github.com/ryanoasis/vim-devicons/ to work
" In terminal use this must be don in terminal font settings
" set guifont=Hack

" Add LF in the end of file
set fileformat=unix

" Turn on line numbers
set number

" Turn on filetypes and plugins and indents
filetype plugin indent on

" Yank and paste with the system clipboard
" set clipboard=unnamed

" [airline] Don't display mode in command line, airline is already showing it
set noshowmode

" [airline] Fast switch to normal mode
set ttimeoutlen=10

" [coc.nvim] Hide buffers instead of closing them
set hidden

" [coc.nvim] Some coc.nvim servers have issues with backup files
set nobackup
set nowritebackup

" [coc.nvim] Better display for messages
set cmdheight=2

" [coc.nvim] Better update time for diagnostic messages (bad on default's 4000)
set updatetime=300

" [coc.nvim] Don't give |ins-completion-menu| messages
set shortmess+=c

" [coc.nvim] Always show signcolums
set signcolumn=yes

" [coc.nvim] Use tab for trigger completion with characters ahead and navigate
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin
inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" [coc.nvim] Use <c-space> to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" [coc.nvim] Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" [coc.nvim] Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" [coc.nvim] Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" [coc.nvim] Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" [coc.nvim] Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" [coc.nvim] Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" [coc.nvim] Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" [coc.nvim] Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" [coc.nvim] Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" [coc.nvim] Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" [coc.nvim] Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" [coc.nvim] Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" [coc.nvim] Use `:Fold` to fold current buffer
" command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" [coc.nvim] use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" [coc.nvim] Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" [coc.nvim] Using CocList
    " Show all diagnostics
    nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
    " Manage extensions
    nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
    " Show commands
    nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
    " Find symbol of current document
    nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
    " Search workspace symbols
    nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
    " Do default action for next item.
    nnoremap <silent> <space>j  :<C-u>CocNext<CR>
    " Do default action for previous item.
    nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
    " Resume latest coc list
    nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Set title of the window to filename (+title)
set title

" Show (partial) commands history in the last line of the screen (+cmdline_info)
set showcmd

" Store lots of history entries, cmdline and search patterns
set history=1000

" Minimum number of lines to keep above and below the cursor
set scrolloff=5

" Number of column to be highlighted (+syntax)
" set colorcolumn=80

" Display invisible characters
set list
set listchars=tab:»\ ,trail:·,extends:>,precedes:<,nbsp:_

" Don't wrap long lines by default
set nowrap

" Don't break words when wrapping (+linebreak) in case wrap is turned on
set linebreak

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

" Number of spaces when (auto)indenting with < and > commands
set shiftwidth=4

" Number of colors
" set t_Co=256

" True color support
set termguicolors

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


" VIM PLUG

" Manual: https://github.com/junegunn/vim-plug
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" The plugins. Only single quotes allowed (!)

" Coc extenstion https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'mattn/emmet-vim', {'for': ['html', 'css', 'javascript']}
Plug 'pangloss/vim-javascript', {'for': ['html', 'javascript']}

" Color scheme
Plug 'morhetz/gruvbox'

" Dev Icons (always must be loaded last)
Plug 'ryanoasis/vim-devicons'

" Initialize plugin system
call plug#end()

" FZF PLUGIN INSTALLED VIA DEBIAN'S APT (https://github.com/junegunn/fzf)
" You have to run 'sudo apt install fzf' on Debian or read the link above
source /usr/share/doc/fzf/examples/fzf.vim

" PLUGIN SETTINGS

" Airline

" Airline to use poweline fonts (to look nice)
" https://github.com/powerline/fonts
" Debian got this by the way: 'sudo apt install fonts-powerline'
let g:airline_powerline_fonts = 1
let g:webdevicons_enable_airline_tabline = 1


" Enable fugitive integration
let g:airline#extensions#branch#enabled = 1

" Gruvbox colorscheme
" https://github.com/morhetz/gruvbox
highlight Normal ctermbg=NONE
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_bold=1
let g:gruvbox_underline=1
let g:gruvbox_termcolors=1
let g:gruvbox_improved_strings=1
let g:gruvbox_improved_warnings=1
" let g:gruvbox_guisp_fallback='bg'
set background=dark
colorscheme gruvbox
