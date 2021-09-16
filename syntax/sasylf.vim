" Vim Syntax File
if version < 600
    syntax clear
elseif exists("b:current_syntax")
    finish
endif


syn keyword slfPuncuation "." ":"

syn keyword slfSection terminals syntax judgment
syn keyword slfProofUnfinished unproved
syn keyword slfProofHeader forall exists
syn keyword slfProofKeyword proof rule
syn keyword slfCase case
syn keyword slfProofBody induction
syn keyword slfEnd end
syn keyword slfConnecting by on is

syn match slfBindingName "\a\+\d*'*"
syn region slfShortComment start=/\/\// end=/$/ oneline contains=slfTodo
syn region slfLongComment start=/\/\*/ end=/\*\// contains=slfTodo

syn match slfLongName "\a\+\(-\(\a\)\+\)*"

syn region slfTheorem start=/theorem/ end=/:/me=s-1 contains=@slfComments,slfLongName
syn region slfLemma start=/lemma/ end=/:/me=s-1 contains=@slfComments,slfLongName
syn region slfEnd start=/end/ end=/$/ contains=@slfComments


syn cluster slfComments contains=slfShortComment,slfLongComment
syn keyword slfTodo contained TODO FIXME NOTE

syn region slfRule start=/---/ end=/$/ oneline contains=@slfComments,slfLongName

hi def link slfTodo Todo
hi def link slfProofUnfinished Todo
hi def link slfShortComment Comment
hi def link slfLongComment Comment
hi def link slfSection Keyword
hi def link slfTheorem Keyword
hi def link slfLemma Keyword
hi def link slfProofHeader Special
hi def link slfProofBody Special
hi def link slfRule Keyword
hi def link slfLongName Function
hi def link slfPuncuation Delimiter
hi def link slfEnd Keyword

let b:current_syntax = "slf"
