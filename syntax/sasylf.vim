" Vim Syntax File
if version < 600
    syntax clear
elseif exists("b:current_syntax")
    finish
endif

syn keyword slfTodo contained TODO FIXME NOTE

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
syn match slfLongName "\w\+(-(\w)\+)*" contained
syn region slfShortComment start=/\/\// end=/$/ oneline contains=slfTodo
syn region slfLongComment start=/\/\*/ end=/\*\// contains=slfTodo

syn region slfTheorem start=/theorem/ end=/:/me-1 contains=@slfComments, slfLongName
syn region slfLemma start=/lemma/ end=/:/me-1 contains=@slfComments, slfLongName

syn cluster slfComments contains=slfShortComment,slfLongComment

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
hi def link slfLongName Identifier
hi def link slfBindingName Function
hi def link slfPuncuation Delimiter

let b:current_syntax = "slf"
