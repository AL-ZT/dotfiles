syntax on
set cursorline
set incsearch
set ignorecase
set showcmd
set showmode
set wildmenu
  
  
"Theme
set background=dark
if (empty($TMUX))
  if(has("termguicolors"))
    set termguicolors
  endif
endif
 
function! IsHexColorLight(color) abort
  let l:raw_color = trim(a:color, '#')
 
  let l:red = str2nr(substitute(l:raw_color, '(.{2}).{4}', '1', 'g'), 16)
  let l:green = str2nr(substitute(l:raw_color, '.{2}(.{2}).{2}', '1', 'g'), 16)
  let l:blue = str2nr(substitute(l:raw_color, '.{4}(.{2})', '1', 'g'), 16)
 
  let l:brightness = ((l:red * 299) + (l:green * 587) + (l:blue * 114)) / 1000
 
  return l:brightness > 155
endfunction
 
"NERDTree
nmap <C-f> :NERDTreeToggle<CR>
 
colorscheme onedark
 
"Status Line
set statusline=
set statusline+=\ %F\ %M\ %Y\ %R
set statusline+=%=
set statusline+=\ row:\ %l\ col:\ %c\ percent:\ %p%%
set laststatus=2

set tabstop=2
set shiftwidth=2 
set autoindent
set smartindent
set expandtab

set number relativenumber
set splitbelow splitright

" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

noremap <silent> <C-1> 1gt<CR>

"Newtab
nnoremap <silent> <C-t> :tabnew<CR>
