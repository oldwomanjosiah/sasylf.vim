" Vim Syntax File
if version < 600
    syntax clear
elseif exists("b:current_syntax")
    finish
endif


syn match slfPuncuation "\\(|\\)|::=|:=|\|"

syn keyword slfSection terminals syntax judgment
syn keyword slfProofUnfinished unproved
syn keyword slfProofHeader forall exists
syn keyword slfProofKeyword proof rule

syn match slfBindingName "\a\+\d*'*"
syn region slfShortComment start=/\/\// end=/$/ oneline contains=slfTodo
syn region slfLongComment start=/\/\*/ end=/\*\// contains=slfTodo

syn match slfLongName "\a\+\(-\(\a\)\+\)\+" contained

syn region slfTheorem start=/theorem/ end=/:/me=s-1 contains=@slfComments,slfLongName oneline
syn region slfLemma start=/lemma/ end=/:/me=s-1 contains=@slfComments,slfLongName oneline
syn region slfEnd start=/end/ end=/$/ contains=@slfComments oneline
syn region slfByLine start=/by/ end=/\(on\|$\)/ contains=@slfComments,slfLongName oneline

syn keyword slfCaseIsInner case is contained
syn region slfCaseIs start=/case/ end=/is/ contains=@slfComments,slfCaseIsInner

syn cluster slfComments contains=slfShortComment,slfLongComment
syn keyword slfTodo contained TODO FIXME NOTE

syn region slfRule start=/---/ end=/$/ oneline contains=@slfComments,slfLongName

hi def link slfTodo Todo
hi def link slfProofUnfinished Todo
hi def link slfShortComment Comment
hi def link slfLongComment Comment
hi def link slfSection Keyword
hi def link slfProofHeader Type
hi def link slfRule Keyword
hi def link slfLongName Function
hi def link slfTheorem Keyword
hi def link slfLemma Keyword
hi def link slfPuncuation Comment
hi def link slfEnd Keyword
hi def link slfByLine Keyword
hi def link slfProofKeyword Keyword
hi def link slfCaseIsInner Keyword

let b:current_syntax = "slf"
