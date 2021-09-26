" Install nodejs and npm before using this config file
" source ~/.config/nvim/init.vim - add this to your shell config file (WSL only)

" Plugins
call plug#begin('~/.vim/plugged')

" Other stuff
Plug 'jiangmiao/auto-pairs'
Plug 'zhou13/vim-easyescape'

" Reset buffer sizes on resizing window
Plug 'kwkarlwang/bufresize.nvim'

" CoC vim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" NERDTree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'

" Colorschemes
Plug 'arcticicestudio/nord-vim'

call plug#end()


" Keybinds
" NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" CoC
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Easy Escape
inoremap ii <ESC>


" Colorscheme
colorscheme nord


set number

" Start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree

" Hide brackets in git extension for NERDTree
let g:NERDTreeGitStatusConcealBrackets = 1

" CoC stuff
let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-yaml', 'coc-tsserver', 'coc-toml', 'coc-rust-analyzer', 'coc-r-lsp', 'coc-pyright', 'coc-pydocstring', 'coc-omnisharp', 'coc-markdown-preview-enhanced', 'coc-julia', 'coc-java', 'coc-html', 'coc-graphql', 'coc-go', 'coc-fsharp', 'coc-flutter', 'coc-css', 'coc-cmake', 'coc-clangd']

set updatetime=300
set shortmess+=c

if has("nvim-0.5.0") || has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

command! -nargs=0 Format :call CocAction('format')
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Easy Escape
" let g:easyescape_chars = { "j": 2 }
" let g:easyescape_timeout = 100

