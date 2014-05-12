let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
argglobal
let s:cpo_save=&cpo
set cpo&vim
inoremap <buffer> <silent> <F5> 
nnoremap <buffer> <silent> K :call objc#man#ShowDoc()
nnoremap <buffer> <D-]> >>
nnoremap <buffer> <D-[> <<
nnoremap <buffer> <D-/> I// 
nmap <buffer> <silent> <D-CR> <D-r>
nnoremap <buffer> <silent> <D-2> :ListMethods
nnoremap <buffer> <silent> <D-0> :call system('open -a Xcode '.b:cocoa_proj)
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal cindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=neocomplcache#auto_complete
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'objc'
setlocal filetype=objc
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=100
setlocal foldmarker={{{,}}}
setlocal foldmethod=indent
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=SimpleFoldText()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\(\\d\\|[-*]\\)\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=^s*#s*import
setlocal includeexpr=
setlocal indentexpr=GetObjCIndent()
setlocal indentkeys=0{,0},0#,!^F,o,O,e,<:>
setlocal infercase
setlocal iskeyword=@,48-57,_,192-255,_,$,@,%,#
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal list
setlocal nomacmeta
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
setlocal number
setlocal numberwidth=5
setlocal omnifunc=objc#cocoacomplete#Complete
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=4
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'objc'
setlocal syntax=objc
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
199
normal! zo
203
normal! zo
227
normal! zo
254
normal! zo
304
normal! zo
315
normal! zo
315
normal! zo
324
normal! zo
504
normal! zo
505
normal! zo
626
normal! zo
676
normal! zo
778
normal! zo
779
normal! zo
865
normal! zo
868
normal! zo
let s:l = 324 - ((31 * winheight(0) + 32) / 65)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
324
normal! 08|
lcd ~/netted/iOS/autotraffic_app/old/AutoTraffic_dg/AutoTraffic_dg/Services/BusBell/BusComingBell/UI
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
" vim: set ft=vim :
