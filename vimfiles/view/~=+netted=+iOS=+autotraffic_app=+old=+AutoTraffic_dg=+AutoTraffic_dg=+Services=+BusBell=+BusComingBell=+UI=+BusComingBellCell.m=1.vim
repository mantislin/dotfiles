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
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
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
if &filetype != 'objcpp'
setlocal filetype=objcpp
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
setlocal formatoptions=rq
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
setlocal omnifunc=
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
if &syntax != 'objcpp'
setlocal syntax=objcpp
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal nowrap
setlocal wrapmargin=0
let s:l = 9 - ((8 * winheight(0) + 31) / 62)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
9
normal! 0
lcd ~/netted/iOS/autotraffic_app/old/AutoTraffic_dg/AutoTraffic_dg/Services/BusBell/BusComingBell/UI
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
" vim: set ft=vim :
