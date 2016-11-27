" NeoBundle Scripts-----------------------------
if has('vim_starting')
  set runtimepath+=~/.config/nvim/bundle/neobundle.vim/
  set runtimepath+=~/.config/nvim/
endif

let neobundle_readme=expand('~/.config/nvim/bundle/neobundle.vim/README.md')

if !filereadable(neobundle_readme)
  echo "Installing NeoBundle..."
  echo ""
  silent !mkdir -p ~/.config/nvim/bundle
  silent !git clone https://github.com/Shougo/neobundle.vim ~/.config/nvim/bundle/neobundle.vim/
  let g:not_finsh_neobundle = "yes"
endif

call neobundle#begin(expand('$HOME/.config/nvim/bundle'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'justinmk/vim-sneak'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-surround'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'matze/vim-move'
NeoBundle 'terryma/vim-smooth-scroll'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'rstacruz/vim-closer'

call neobundle#end()
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------<Paste>

" General configs Klock
let mapleader=","
set encoding=utf-8
set tabstop=2 shiftwidth=2
" Show trailing spaces
highlight Trail ctermbg=red guibg=red
call matchadd('Trail', '\s\+$', 100)

" NERDTREE
let NERDTreeShowHidden=1
map <silent> <C-n> :NERDTreeToggle<CR>

" AIRLINE
let g:airline#extensions#tabline#enabled = 1
" Airline tabs navigations
nnoremap <S-tab> :bp<CR>
nnoremap <tab>   :bn<CR>

" CTRLP
set wildignore+=*/tmp/*,*/bin/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn)$',
      \ 'file': '\v\.(exe|so|dll)$',
      \ 'link': 'some_bad_symbolic_links',
      \ }
let g:ctrlp_show_hidden = 1

" Dont lock tab with buffer
set hidden

" SNEAK
let g:sneak#streak = 1

" VIM MOVE
let g:move_key_modifier = 'C'

" VIM SCROLL SMOOTH
noremap <silent> <c-e> :call smooth_scroll#up(&scroll, 30, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 30, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 30, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 30, 4)<CR>

" Save temporary/backup files not in the local directory, but in your ~/.vim
" directory, to keep them out of git repos.
" But first mkdir backup, swap, and undo first to make this work
call system('mkdir ~/.vim')
call system('mkdir ~/.vim/backup')
call system('mkdir ~/.vim/swap')
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//

" set search case to a good configuration http://vim.wikia.com/wiki/Searching
set ignorecase
set smartcase

" search characters as they're entered
set incsearch

" use leader to interact with the system clipboard
nnoremap <Leader>p "*]p
nnoremap <Leader>P "*]P

nnoremap <Leader>y :y*<cr>
nnoremap <Leader>c ^"*c$
nnoremap <Leader>d ^"*d$

vnoremap <Leader>y "*y
vnoremap <Leader>c "*c
vnoremap <Leader>d "*d

" Make X an operator that removes text without placing text in the default registry
nmap X "_d
nmap XX "_dd
vmap X "_d
vmap x "_d

" have x (removes single character) not go into the default registry
nnoremap x "_x

" Have the indent commands re-highlight the last visual selection to make
" multiple indentations easier
vnoremap > >gv
vnoremap < <gv

" Display relative line numbers
set relativenumber
" display the absolute line number at the line you're on
set number

" Keep the line number gutter narrow so three digits is cozy.
set numberwidth=2
