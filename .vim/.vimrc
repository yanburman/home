" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Folding
set foldenable " Turn on folding
"set foldmethod=indent " Make folding indent sensitive
set foldmethod=syntax " Make folding syntax aware
set foldlevel=100 " Don't autofold anything (but I can still fold manually)
set foldopen-=search " don't open folds when you search into them
set foldopen-=undo " don't open folds when you undo stuff

" set ffs=dos,unix,mac

" Spelling
set dictionary=/usr/share/dict/words,'~/.ispell_en'
set complete=.,w,k
set keywordprg=dict
" set spell

" needed for omnicpp
set nocp
filetype plugin on
map <C-F12> :!ctags -R --c++-kinds=+mp --fields=+iaS --extra=+q --c-kinds=+mp .<CR>
set tags+=~/gen_tags/tags
set tags+=./tags,./../tags,./../../tags
set tags+=/home/yanb/gen_tags/tags-qt-2.3.10

" UI
set wildmenu " turn on wild menu
set ruler " Always show current positions along the bottom
set lz " do not redraw while running macros (much faster) (LazyRedraw)
map <C-n> :tabnew<CR>

" ^W stands for CTRL-w, so ^Wc is CTRL-w-c

" cvim stuff
let g:C_AuthorName      = 'Yan Burman'
let g:C_Email           = 'yanb@iguaz.io'
let g:C_Company         = 'iguaz.io'

" taglist toggle
 noremap <silent> <F11>  <Esc><Esc>:Tlist<CR>
inoremap <silent> <F11>  <Esc><Esc>:Tlist<CR>

function! InitDevFunc ()
	" Color tabs that are not at the beginning of the line
	match errorMsg /[^\t]\zs\t\+/

"	call MapCKeys()
endfunction

function! CleanDevFunc ()
"	call UnmapCKeys()
endfunction

"function! MapCKeys ()
"	inoremap { {<CR>}<Esc>O
"	inoremap ( ()<LEFT>
"	inoremap [ []<LEFT>
"	inoremap " ""<LEFT>
"endfunction

"function! UnmapCKeys ()
"	iunmap {
"	iunmap (
"	iunmap [
"	iunmap "
"endfunction

" autoplace brackets/quotes
au BufEnter *.c,*.java,*.cpp,*.h,*.cc,*.hpp,*.xml,*.html,*.htm,*.cs,*.py call InitDevFunc()
au BufLeave *.c,*.java,*.cpp,*.h,*.cc,*.hpp,*.xml,*.html,*.htm,*.cs,*.py call CleanDevFunc()

" automatically give executable permissions if filename is *.sh
au BufWritePost *.sh :!chmod a+x <afile>
" automatically insert "#!/bin/sh" line for *.sh files
au BufEnter *.sh if getline(1) == "" | :call setline(1, "#!/bin/sh") | endif
" automatically give executable permissions if file begins with #!/bin/sh
"au BufWritePost * if getline(1) =~ "^#!/bin/[a-z]*sh" | silent !chmod a+x <afile> | endif

" Quick jumping between splits
" map <C-J> <C-W>j<C-W>_ "also maximize the window
" map <C-K> <C-W>k<C-W>_ "also maximize the window

map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

" cscope related mappings
if has("cscope")
	""set csprg=/usr/local/bin/cscope
	set csto=0
	set cst
	set nocsverb
	" add any database in current directory
	if filereadable("cscope.out")
	    cs add cscope.out
	"else " "add database pointed to by environment
	"elseif $CSCOPE_DB != ""
	"    cs add $CSCOPE_DB
	endif
	cs add /home/yanb/gen_tags/cscope.out
	set csverb
endif

"   's'   symbol: find all references to the token under cursor
"   'g'   global: find global definition(s) of the token under cursor
"   'c'   calls:  find all calls to the function name under cursor
"   't'   text:   find all instances of the text under cursor
"   'e'   egrep:  egrep search for the word under cursor
"   'f'   file:   open the filename under cursor
"   'i'   includes: find files that include the filename under cursor
"   'd'   called: find functions that function under cursor calls

nmap <C-Space>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-Space>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-Space>d :cs find d <C-R>=expand("<cword>")<CR><CR>

" enable menu in text mode
"source $VIMRUNTIME/menu.vim
"set wildmenu
"set cpo-=<
"set wcm=<C-Z>
"map <F4> :emenu <C-Z>


" set balooneval
" set baloondelay=400

"set bg=dark
set bg=light

set modeline

