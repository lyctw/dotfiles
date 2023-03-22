" ============ "
" ===Basics=== "
" ============ "
syntax on
set relativenumber
set noerrorbells 
set belloff=all
" set expandtab
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set incsearch
set autoindent
set laststatus=2
set tags=./tags,./TAGS,tags;~,TAGS;~ " for ctags [Note] run `ctags -R .` to generate tags file
set cursorline
set formatoptions-=cro " disable auto comment [BUG] this line doesn't work
set encoding=utf-8
set splitright
set listchars=tab:\|\
set list
set hlsearch

" File-types
autocmd BufNewFile,BufRead *.go set filetype=go
autocmd BufNewFile,BufRead *.s,*.S set filetype=asm
autocmd BufNewFile,BufRead *.ldS set syntax=ld

" Tabs
set sw=2 ts=2 sts=2 " Default
autocmd FileType html :setlocal sw=2 ts=2 sts=2
autocmd FileType ruby :setlocal sw=2 ts=2 sts=2
autocmd FileType javascript :setlocal sw=2 ts=2 sts=2
autocmd FileType xml :setlocal sw=2 ts=2 sts=2
autocmd FileType python :setlocal sw=4 ts=4 sts=4
autocmd FileType go :setlocal sw=4 ts=4 sts=4
autocmd FileType c :setlocal sw=4 ts=4 sts=4
autocmd FileType cpp :setlocal sw=4 ts=4 sts=4

" Make vertical separator pretty
highlight VertSplit cterm=NONE
set fillchars+=vert:\|

" Get rid of unnecessary highlight for spelling
highlight clear SpellBad

" ============== "
" ===Mappings=== "
" ============== "
let mapleader = " "

" Window navigation
nnoremap <leader>h :wincmd h<CR>                                                                                                            
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" Copy to system clipboard
noremap <leader>c "*yy<cr>

" Paste without indent
noremap<leader>v "+p<cr>

" fzf.vim
noremap <leader>p :Files<cr>
noremap <leader>g :GFiles<cr>
noremap <leader>gs :GFiles?<cr>
noremap <leader>b :Buffers<cr>
noremap <leader>f :Rg<cr>
noremap <leader>c :Commits<cr>
noremap <leader>bc :BCommits<cr>
noremap <leader>t :Tags<cr>
noremap <leader>bt :BTags<cr>

" nerdtree
noremap <leader>e :NERDTreeToggle<cr>

" NERDCommenter mappping
let NERDSpaceDelims = 1
" nmap <C-_>   <Plug>NERDCommenterToggle
" vmap <C-_>   <Plug>NERDCommenterToggle<CR>gv

" ============="
" ===Plugins==="
" ============="
" `curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`
call plug#begin('~/.vim/plugged')
    " Color schema
    Plug 'ayu-theme/ayu-vim'

    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'ggreer/the_silver_searcher'
    Plug 'preservim/nerdtree'
    Plug 'tpope/vim-fugitive'
    Plug 'preservim/nerdcommenter'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ryanoasis/vim-devicons'
    Plug 'wakatime/vim-wakatime'
    " Plug 'jiangmiao/auto-pairs'
    " Plug 'w0rp/ale' " Syntex checker

    " BitBake
    Plug 'kergoth/vim-bitbake'

    " C/C++
    Plug 'octol/vim-cpp-enhanced-highlight'
    Plug 'justinmk/vim-syntax-extra' 
    Plug 'vivien/vim-linux-coding-style'

    " TypeScript
    Plug 'leafgarland/typescript-vim'

    " CoffeeScript
    Plug 'kchmck/vim-coffee-script'
    
    " JavaScript
    Plug 'pangloss/vim-javascript'
    Plug 'maxmellon/vim-jsx-pretty'
    Plug 'styled-components/vim-styled-components' 

    " Go
    Plug 'fatih/vim-go'

    " Rust
    Plug 'rust-lang/rust.vim'

    " Prettifier
    Plug 'prettier/vim-prettier', {
      \ 'do': 'yarn install',
      \ 'for': ['javascript', 'typescript'] }

    " tabnine
    Plug 'jayli/vim-easycomplete'
    Plug 'SirVer/ultisnips'

    " Leetcode
    Plug 'mbledkowski/neuleetcode.vim'

call plug#end()

" ============="
" PluginConfigs"
" ============="

" ayu theme
set termguicolors     " enable true colors support
let ayucolor="dark"   " for dark version of theme
colorscheme ayu

" prettier
"let g:prettier#config#print_width = 500

" fzf.vim
let g:fzf_colors= {
      \  'border': ['fg', 'Type' ],
      \  'gutter': ['fg', 'Type' ] }

" vim-jsx-pretty
hi jsxAttrib ctermfg=3*
hi jsxComponentName ctermfg=4*
hi jsxTagName ctermfg=4*
hi jsxPunct ctermfg=3*
hi jsObjectProp ctermfg=3*
hi jsxCloseString ctermfg=3*

" typescript-vim
let g:typescript_indent_disable = 1
hi javaScriptLineComment ctermfg=4*

" vim-go
let g:go_highlight_structs = 1 
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_types = 1
let g:go_highlight_function_calls = 1

" vim-prettier
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
let g:prettier#config#print_width = '100'
" Note: Can't get autosave to work on .ts and .tsx
" files so doing a :Prettier before save hook.
"autocmd BufWritePre *.tsx,*.ts Prettier 

" C/C++ Syntax Checker
let g:ale_sign_column_always = 1
let g:ale_sign_error = 'X'
let g:ale_sign_warning = '!'
let g:ale_statusline_format = ['X %d', 'N %d', 'V OK']
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_c_gcc_options = '-Wall -O2 -std=99'
"let g:ale_cpp_gcc_options '-Wall -O2 -std=c++17'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''

" Linux Coding Style
let g:linuxsty_patterns = [ "/usr/src/", "/linux" ]

" ============="
" ==CustomCmds="
" ============="

" Absolute path of open file to clipboard
function! Cwf()
    let @+=expand('%:p')
endfunction
command! Cwf call Cwf()

" Print working file_path
function! Pfp()
    echo expand('%')
endfunction
command! Pfp call Pfp()

" Relative path of open file to clipboard
function! Cwfr()
    let @+=expand('%')
endfunction
command! Cwfr call Cwfr()

" ex) :Tag h1
function! Tag(name)
    let @"="<" . a:name . "></" . a:name . ">"
    normal! pbbl
    startinsert
endfunction
command! -nargs=1 Tag call Tag(<f-args>)

" ex) :Jtag HelloWorld
function! Jtag(name)
    let @"="<" . a:name . " />"
    normal! pb
    startinsert
endfunction
command! -nargs=1 Jtag call Jtag(<f-args>)

" CSCOPE
set cscopetag
set csto=0

if filereadable("cscope.out")
   cs add cscope.out   
elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
endif
set cscopeverbose

nmap zs :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap zg :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap zc :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap zt :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap ze :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap zf :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap zi :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap zd :cs find d <C-R>=expand("<cword>")<CR><CR>

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" Try to prevent bad habits like using the arrow keys for movement. This is
" not the only possible bad habit. For example, holding down the h/j/k/l keys
" for movement, rather than using more efficient movement commands, is also a
" bad habit. The former is enforceable through a .vimrc, while we don't know
" how to prevent the latter.
" Do this in normal mode...
" nnoremap <Left>  :echoe "Use h"<CR>
" nnoremap <Right> :echoe "Use l"<CR>
" nnoremap <Up>    :echoe "Use k"<CR>
" nnoremap <Down>  :echoe "Use j"<CR>
" " ...and in insert mode
" inoremap <Left>  <ESC>:echoe "Use h"<CR>
" inoremap <Right> <ESC>:echoe "Use l"<CR>
" inoremap <Up>    <ESC>:echoe "Use k"<CR>
" inoremap <Down>  <ESC>:echoe "Use j"<CR>

" Clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

" tabnine
nnoremap gr :EasyCompleteReference<CR>
nnoremap gd :EasyCompleteGotoDefinition<CR>
nnoremap rn :EasyCompleteRename<CR>
nnoremap gb :BackToOriginalBuffer<CR>

" Leetcode
let g:leetcode_browser = 'brave'
let g:leetcode_solution_filetype = 'c'
nnoremap <leader>ll :LeetCodeList<cr>
nnoremap <leader>lt :LeetCodeTest<cr>
nnoremap <leader>ls :LeetCodeSubmit<cr>
nnoremap <leader>li :LeetCodeSignIn<cr>
