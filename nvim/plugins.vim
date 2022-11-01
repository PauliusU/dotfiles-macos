" Neovim and Vim plug-in configuration used in both

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

" Themes and colors
colorscheme onedark

""" Nerd tree
" Open with Ctrl-E
nnoremap <C-e> :NERDTreeToggle<CR>

""" Telescope - fuzzy finder
" Find files using Telescope command-line sugar
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>ft <cmd>Telescope find_files hidden=true<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fd <cmd>Telescope git_files<cr>
nnoremap <leader>fr <cmd>Telescope grep_string<cr>
nnoremap <leader>ps <cmd>Telescope grep_string<cr>

""" fzf
" Git files
nnoremap <C-p> :GFiles<cr>
" Project files
nnoremap <leader>pf :Files<cr>

""" ALE (ESlint)
"  Set ESLint as plugging manager
let g:ale_fixers = {
 \ 'javascript': ['eslint']
 \ }
" Pimp linter symbols
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
" Fix the file your are working on on save
let g:ale_fix_on_save = 1

""" vim-gitgutter
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

nnoremap <silent><C-f> :silent !tmux neww $HOME/Dropbox/code/dotfiles/terminal/tmux-sessionizer.sh<CR>

command Health :checkhealth
