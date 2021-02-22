call plug#begin('~/.vim/plugged')
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jparise/vim-graphql'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'alvan/vim-closetag'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'jiangmiao/auto-pairs'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'preservim/nerdcommenter'
call plug#end()
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-css',
  \ 'coc-json',
  \ 'coc-html',
  \ 'coc-markdownlint',
  \ 'coc-sql',
  \ 'coc-marketplace',
  \ ]
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

function! ShowDocIfNoDiagnostic(timer_id)
  if (coc#float#has_float() == 0)
    silent call CocActionAsync('doHover')
  endif
endfunction

function! s:show_hover_doc()
  call timer_start(500, 'ShowDocIfNoDiagnostic')
endfunction

autocmd CursorHoldI * :call <SID>show_hover_doc()
autocmd CursorHold * :call <SID>show_hover_doc()

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <leader> do <Plug>(coc-codeaction)

nnoremap <silent> K :call CocAction('doHover')<CR>

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()

inoremap <silent><expr> <c-space> coc#refresh()

" Reemplazamos el comportamiento original de P para que no pise el registro
xnoremap p pgvy
" Configuracion de NerdTree
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Activar con CTRL+B
nnoremap <silent> <C-b> :NERDTreeToggle<CR>
" Abrir el archivo actual en NERDTREE
nmap ,n :NERDTreeFind<CR>

" open new split panes to right and below
set splitright
set splitbelow

" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Remap tab navigation
nnoremap <S-Left>  gT
nnoremap <S-Right> gt

let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.php,*.jsx,*.js,*.ts,*.tsx"
let g:closetag_xhtml_filetypes = 'xhtml,javascript.jsx,jsx,typescript.tsx,tsx'

autocmd BufNewFile,BufRead *.js set filetype=javascript.jsx
autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx

nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -f -g ""'

set number
set tabstop=2 shiftwidth=2 expandtab
set colorcolumn=80
set clipboard+=unnamedplus
autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert
