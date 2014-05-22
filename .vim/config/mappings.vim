" Map the <Leader> to the comma.
let mapleader=","

" I have to force myself not to use those anymore.
nnoremap <Up> <NOP>
inoremap <Up> <NOP>
vnoremap <Up> <NOP>

nnoremap <Down> <NOP>
inoremap <Down> <NOP>
vnoremap <Down> <NOP>

nnoremap <Left> <NOP>
inoremap <Left> <NOP>
vnoremap <Left> <NOP>

nnoremap <Right> <NOP>
inoremap <Right> <NOP>
vnoremap <Right> <NOP>

" Filter Ex commands with <C-{P,N}>.
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" When text is wrapped, move up and down by visual lines.
nnoremap j gj
vnoremap j gj
nnoremap k gk
vnoremap k gk

nnoremap <Up>   N
nnoremap <Left> N

nnoremap <Down>  n
nnoremap <Right> n

nnoremap <F5> :NERDTreeTabsToggle<CR>
inoremap <F5> <ESC>:NERDTreeTabsToggle<CR>
nnoremap <Leader>5 :NERDTreeTabsToggle<CR>

nnoremap <F6> :GundoToggle<CR>
inoremap <F6> <ESC>:GundoToggle<CR>
nnoremap <Leader>6 :GundoToggle<CR>

nnoremap <F7> :call ToggleMouse()<CR>
inoremap <F7> <ESC>:call ToggleMouse()<CR>
nnoremap <Leader>7 :call ToggleMouse()<CR>

nnoremap <F8> :call ToggleRelativeNumbers()<CR>
inoremap <F8> <ESC>:call ToggleRelativeNumbers()<CR>
nnoremap <Leader>8 :call ToggleRelativeNumbers()<CR>

" Navigate through windows with Tab and Shift-Tab.
nnoremap <Tab> <C-w><C-w>
nnoremap <S-Tab> <C-w><C-W>

" I'm used to the fish shell and auto-completing suggestions with Ctrl-e.
" Remapping it to Tab does the job for YouCompleteMe.
imap <C-e> <Tab>

" Choose '^' or '0' depending on the cursor position.
nnoremap <expr> 0 CleverJumpFirst()
vnoremap <expr> 0 CleverJumpFirst()

" Easier to type than :. I don't really use the default ; behavior, but I'm
" keeping it just in case in the :. Plus, swapping those two will teach me not
" to press the damn Shift anymore.
nnoremap ; :
nnoremap : ;

vnoremap ; :
vnoremap : ;

" Get back the "Undo motion".
nnoremap <Leader><Leader> ,
vnoremap <Leader><Leader> ,

" I mistype that a lot. 
nmap <C-m> <C-n>

" Get funky with Ctrl-Space.
nnoremap <C-@> :CtrlPFunky<Cr>

" I'm thinking of a decent usage for the Q key, so I'm starting with the rage
" quit.
nnoremap <silent> Q :call WriteAndOrQuit()<CR>

" Cycle through bad words.
nnoremap <silent> K :NextWordy<CR>

" Cycle through thematic themes.
nnoremap <Leader>t :ThematicNext<CR>

" Format a paragraph to fit in `textwidth`.
nnoremap <Leader>f gqap
vnoremap <Leader>f gq

" Restore the last selection in VISUAL mode.
nnoremap <Leader>v gv

" Edit an inlined chunked of code in it's own buffer.
nnoremap <Leader>e :InlineEdit<CR>
vnoremap <Leader>e :InlineEdit<CR>

" Align commands. Ripped off @StanAngeloff.
nnoremap <Leader>a= :Tabularize /=<CR>
vnoremap <Leader>a= m[om]:Tabularize /=<CR>`]V`[

nnoremap <Leader>a> :Tabularize /=><CR>
vnoremap <Leader>a> m[om]:Tabularize /=><CR>`]V`[

nnoremap <Leader>a: :Tabularize /:\zs/l0l1<CR>
vnoremap <Leader>a: m[om]:Tabularize /:\zs/l0l1<CR>`]V`[

" I always mess these up on my Das Keyboard. Trying to work around them at
" least in VISUAL mode.
vnoremap u y
vnoremap U Y

" Have a saner ESCAPE in INSERT mode. Don't try to map those in VISUAL mode or
" you'll get a nasty delay if you type {j,k}.
inoremap jk <ESC>
inoremap kj <ESC>

" If you're writing in Bulgarian, don't switch to English only to ESCAPE.
inoremap йк <ESC>
inoremap кй <ESC>

" If you double tap {j,k} in INSERT mode it will go into NORMAL and scroll one
" line up or down. The l is there to make up for cursor being displayed one
" character before the point you hit {jj,kk}.
inoremap jj <ESC>lj
inoremap kk <ESC>lk

inoremap йй <ESC>lj
inoremap кк <ESC>lk

" Those seems friendlier to type than g{t,T}.
nnoremap <C-K> gt
nnoremap <C-J> gT

" Move function arguments left and right.
nnoremap <C-H> :SidewaysLeft<CR>
nnoremap <C-L> :SidewaysRight<CR>

" Toggle the current fold.
nnoremap <silent> <Space> @=(foldlevel('.') ? 'za' : "\<Space>")<CR>
vnoremap <Space> zf

" Use <Leader>{j,s} for the split joins. I refuse to remember the gJ and gS.
nnoremap <Leader>j :SplitjoinJoin<CR>
nnoremap <Leader>s :SplitjoinSplit<CR>

" Use - to switch stuff around, like old-style to new-style Ruby hashes.
nnoremap - :Switch<cr>

" Custom commands
" ---------------

" Write using `sudo` in COMMAND mode if the file is read-only.
" Ripped off @StanAngeloff.
cnoremap w!! w !sudo tee % >/dev/null

" When I'm in Bulgarian layout, I don't want to switch it, just to save or
" quit.
cnoreabbrev в w
cnoreabbrev В w
cnoreabbrev я q
cnoreabbrev яа qа
cnoreabbrev яал qаl
cnoreabbrev яалл qаll

" Some other times I just write with the Shift key down. Take care of that
" too.
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Wq wq

" Tabe is typed quite often around here.
cnoreabbrev Tabe tabe
