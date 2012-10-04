" ###############
" Global settings
" ###############

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch	" Show matching brackets.
set nocompatible " Make VIM act like VIM!
set nomodeline   " Turn off modelines
let mapleader = "," " Set leader to something different
set ignorecase	" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set hlsearch    " Highlight matching search text
set autowrite		" Automatically save before commands like :next and :make
"set hidden     " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes) in terminals

set wildmenu    " Cool way to display files when using :e
set wildignore+=*.pyc,*.zip,*.gz,*.bz,*.tar,*.jpg,*.png,*.gif,*.avi,*.wmv,*.ogg,*.mp3,*.mov

" Disable arrow keys to better traing myself!
"nnoremap <up> <nop>
"nnoremap <down> <nop>
"nnoremap <left> <nop>
"nnoremap <right> <nop>
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>
" Use screen lines, not file lines to navigate!
nnoremap j gj
nnoremap k gk

" Make ; work same as : to save some keystrokes
nnoremap ; :

" How many lines should always appear when scrolling
set scrolloff=3
" Show line where cursor is located
"set cursorline

" Use a dark color theme
" color evening

" turn on syntax highlighting
syntax on
set backspace=indent,eol,start  " more powerful backspacing
"hi MatchParen ctermbg=lightyellow guibg=lightyellow

if has("autocmd")
 " Enabled file type detection
 " Use the default filetype settings. If you also want to load indent files
 " to automatically do language-dependent indenting add 'indent' as well.
 filetype plugin on

endif " has ("autocmd")

" Allows one to use the tab key, but it is translated as two spaces.
set ts=2
set expandtab

" Sets how many spaces an "shift-indent" command should indent.
set sw=2

" Setup programming indentation by default.
set cindent
set cino=
set pt=<F9>
nmap <leader>v :setlocal paste! paste?<cr>

" Show matching parens
set showmatch

" Removes trailing spaces from lines!
map <silent> <F3> ma:let @1=@/<CR>:%s/\s*$//<CR>:let @/=@1<CR>'a:echo "Removed trailing spaces!"<CR>

" Insert an HTML nbsp!
imap <S-Tab> &nbsp;

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
\ if line("'\"") > 0 && line ("'\"") <= line("$") |
\   exe "normal g'\"" |
\ endif

" Turn off all autocommenting features
set formatoptions=

" #################
" Specific Settings
" #################

" MOAB-STYLE C-CODE
" Setup indentation for Moab style formatting.
" Also enables a cool feature that tells you what function you are in if you hit F2!!!
autocmd BufNew,BufRead *.c set cindent |
                         \ set cino=f1s{1s |
                         \ map <silent> <F2> ma:let @1=@/<CR>:?^[a-z]<CR>"xy$:let @/=@1<CR>'a:echo "In Function:" @x<CR> |
                         \ set showmatch

" PYTHON FILES
"au FileType python source /home/josh/files/scripts/python.vim 

" SLURM C++ FILES
autocmd BufNew,BufRead *.cpp set noexpandtab | set ts=4

" PHP FILES
autocmd BufNew,BufRead *.php set noexpandtab | set ts=2 | set sw=2 | set showmatch | setlocal formatoptions+=c formatoptions+=r formatoptions+=o

" HTML FILES
" Turn off C-style indentation and enable word wrapping.
" autocmd BufNew,BufRead *.html set nocindent | set tw=90 | set wrapmargin=4

" TXT FILES
autocmd BufRead *.txt set tw=78 | set nocindent | set wrapmargin=4

" MAKEFILES
" Re-enable hard tabs and make tabs appear 5 spaces in size.
autocmd BufNew,BufRead [mM]akefile set noexpandtab | set ts=5

" Allow one to 'fold' methods into small packages. Use the TAB key to open/collapse them.
func! ToggleFold()
   if (&foldmethod == "manual")
     syn region myFold start="{" end="}" transparent fold
     syn sync fromstart
     set foldnestmax=1
     set foldmethod=syntax
     return
   endif

   if (&foldenable == "1")
     set nofen
   else
     set fen
   endif
endfunc
map <silent> <F5> :call ToggleFold()<CR>
map <TAB> za


" Easy-toggle between buffers
map <silent> <C-j> :bp<CR>
map <silent> <C-h> :bp<CR>
map <silent> <C-k> :bn<CR>
map <silent> <C-l> :bn<CR>

" Enable tab-completion
function! InsertTabWrapper(direction)
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    elseif "backward" == a:direction
        return "\<c-p>"
    else
        return "\<c-n>"
    endif
endfunction

inoremap jj <ESC>

inoremap <silent> <TAB>   <c-r>=InsertTabWrapper ("backward")<cr>
inoremap <silent> <s-tab> <c-r>=InsertTabWrapper ("forward")<cr>

abbrev cmmt /**<CR><CR>/<CR><UP><UP><ESC>A
abbrev yahoo #ifdef MYAHOO<CR>#endif /* MYAHOO */<UP><CR>

" Keeps cursor on one line
map <Leader>zz :let &scrolloff=999-&scrolloff<CR>

" Special macro that lets me know what function I'm in (for large Moab C
" files)
map <silent> ,f ma:let @1=@/<CR>:?^[a-z]<CR>"xy$:let @/=@1<CR>'a:echo "In Function:" @x<CR> |

set laststatus=2
