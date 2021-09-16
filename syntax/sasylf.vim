" Vim Syntax File
if version < 600
    syntax clear
elseif exists("b:current_syntax")
    finish
endif

syn keyword slfTodo contained TODO FIXME NOTE

syn keyword slfPuncuation "." ":"

syn keyword slfSection terminals syntax judgment
syn keyword slfProof theorem lemma proof rule
syn keyword slfProofUnfinished unproved
syn keyword slfProofHeader forall exists
syn keyword slfProofBody induction case end
syn keyword slfConnecting by on is

syn match slfBindingName "\w\+\d*'*"
syn match slfLongName "\w\+(-(\w)\+)*"
syn region slfShortComment start=/\/\// end=/$/ oneline contains=slfTodo
syn region slfLongComment start=/\/\*/ end=/\*\// contains=slfTodo

syn cluster slfComments contains=slfShortComment,slfLongComment

syn region slfRule start=/---/ end=/$/ oneline contains=@slfComments,slfLongName

hi def link slfTodo Todo
hi def link slfProofUnfinished Todo
hi def link slfShortComment Comment
hi def link slfLongComment Comment
hi def link slfSection Keyword
hi def link slfProof Keyword
hi def link slfProofHeader Special
hi def link slfProofBody Special
hi def link slfRule Keyword
hi def link slfLongName Identifier
hi def link slfBindingName Function
hi def link slfPuncuation Delimiter

let b:current_syntax = "slf"
