" Use powerline patched fonts in airline.
let g:airline_powerline_fonts=1

" Tell detectindet to use one tab, if it is confused.
let g:detectindent_preferred_expandtab=1

" Ignore tilda editor leftovers and python junk in the NERDTree. Keep those as
" NERDTree seem not to respect wildignore
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '^.sass-cache$']

" Use a minimal UI for the NERDTree. No wasted space on 'Press ? for help'
" headers.
let NERDTreeMinimalUI=1

" Just use one NERDTree on all tabs and don't show it on startup.
let g:nerdtree_tabs_open_on_gui_startup=0
let g:nerdtree_tabs_open_on_new_tab=1
" Try to focus on actual file content when jumping to it.
let g:nerdtree_tabs_focus_on_files=1

" Tell syntastic not to jump to errors and skip /c(++)?/ files.
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=0

" Try to optimize syntastic in terminal Vim as its already 0 on MacVim.
let syntastic_full_redraws=0

" Speed up syntastic a bit.
let g:syntastic_enable_highlighting=0

" Add some fancy symbols for the error and warning messages.
let g:syntastic_error_symbol='✗'
let g:syntastic_style_error_symbol='✠'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_warning_symbol='≈'

" Skip schema.rb, it can destroy the terminal Vim.
let g:syntastic_ignore_files=['\mschema\.rb$']

" Use rubocop as the default ruby linter, but first run it through MRI.
let g:syntastic_ruby_checkers=['mri', 'rubocop']

" Show gundo on the right side of the screen.
let g:gundo_right=1

" Clear the default splitjoin mappings.
let g:splitjoin_split_mapping=''
let g:splitjoin_join_mapping=''

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher for
" grep and Ack.
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor\ --ignore=vendor\ --ignore=node_modules\ --ignore=.bundle
endif

" Use speedier git-list-files and mercurial alternatives to listing files in a
" folder when possible and fall back to ag otherwise.
let g:ctrlp_user_command={
    \ 'types': {
    \   1: ['.git', 'cd %s && git ls-files . -co --exclude-standard'],
    \   2: ['.hg', 'hg --cwd %s locate -I .'],
    \ },
    \ 'fallback': 'ag %s -l --nocolor -g --ignore=vendor --ignore=node_modules --ignore=.bundle""'
    \ }

" Use the C matcher function provided by ctrlp-cmatcher.
let g:ctrlp_match_func={'match': 'matcher#cmatch'}

" Use the funky extension to navigate more easily inside bigger files.
let g:ctrlp_extensions = ['funky']

" Use caching to speed CtrlP up.
let g:ctrlp_use_caching=1
let g:ctrlp_max_files=10000

" Don't use typographic quotes. Dunno how to type them :D
let g:litecorrect#typographic=1

" Configure wildfire to accept caret fences and be more effective in HTML.
let g:wildfire_objects={
    \ "*" : ["i'", 'i"', "i`", "i)", "i]", "i}", "ip"],
    \ "ruby" : ["i'", 'i"', "i`", "i)", "i]", "i}", "ir", "ar"],
    \ "html,xml" : ["it", "at"],
    \ "eruby" : ["it", "at"],
    \ }

" Don't do the default plugin mapping.
let g:EasyMotion_do_mapping=0

" Let YouCompleteMe load candidates from the tags file.
let g:ycm_collect_identifiers_from_tags_files=1
