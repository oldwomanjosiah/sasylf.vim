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


syn match slfLongName "\w+(-(\w)+)*"
syn region slfShortComment start=/\/\// oneline contains=slfTodo
syn region slfLongComment start=/\/\*/ end=/\*\// contains=slfTodo
syn match slfBindingName "\w+\d*'*"

syn match slfRuleName "---+\s+\w+(-(\w)+)*" contains=slfLongName

hi def link slfTodo Todo
hi def link slfProofUnfinished Todo
hi def link slfLongName Normal
hi def link slfShortComment Comment
hi def link slfLongComment Comment
hi def link slfSection Keyword
hi def link slfProof Keyword
hi def link slfConnecting Comment


let b:current_syntax = "slf"
