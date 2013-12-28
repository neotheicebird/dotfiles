" .vimrc file by neotheicebird

set encoding=utf-8
autocmd! bufwritepost .vimrc source % " mbrochh says No need to go to terminal for the changes to take effect in the save file
syntax on
call pathogen#infect() 

" General option
" ===============
let mapleader = "," " rebind <Leader> key
nnoremap . <NOP>
set wildmode=list:longest " make TAB behave like in a shell
set autoread " reload file when changes happen in other editors
set tags=./tags

" Mouse and backspace
set mouse=a "Use mouse pointer to move cursor to any part of the text
set bs=2 " make backspace behave normal! even b4 this line it was normal I guess

" Indentation
set tabstop=4 " tab = 4 spaces
set shiftwidth=4 " autointend takes as much spaces as tabstop
set expandtab " all tabs are converted to spaces

" Improving code completion
set completeopt=longest,menuone

" Quicksave command
noremap <Leader>w :update<CR>
vnoremap <Leader>w <C-C>:update<CR>
inoremap <Leader>w <C-O>:update<CR>

" Quick quit command
noremap <Leader>e :quit<CR>

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

set history=700
set undolevels=700

"
" Movement
" =========
" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

map <Leader>, <esc>:tabprevious<CR>
map <Leader>. <esc>:tabnext<CR>

" sort text (like imports) alphabetically
vnoremap <Leader>s :sort<CR> 

" Custom mappings
" ================
vnoremap < <gv " better indentation
vnoremap > >gv " better indentation
map <Leader>a ggVG " select all

function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction

inoremap <silent>j <C-R>=OmniPopup('j')<CR>
inoremap <silent>k <C-R>=OmniPopup('k')<CR>

" Show trailing whitespace
" =========================
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/
map <Leader>x :%s/\s\+$//    

    " Color scheme
" =============
set t_Co=256
color wombat256mod

set colorcolumn=80
highlight ColorColumn ctermbg=233
map <Leader>v :source ~/.vimrc