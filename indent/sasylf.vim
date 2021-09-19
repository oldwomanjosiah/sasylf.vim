setlocal indentexpr=SlfIndent()

function! SlfIndent()
	let line = getline(v:lnum)
	let previousNum = prevnonblank(v:lnum - 1)
	let previous = getline(previousNum)
	let tabstop = &tabstop

	if previous =~ "::="
		return indent(previousNum) + tabstop + tabstop
	endif

	if previous =~ "\<theorem\>" || previous =~ "\<lemma\>" || previous =~ "\<case\>" || previous =~ ":$" || previous =~ "\<is\>"
		if line !~ "\<end\>"
			return indent(previousNum) + tabstop
		endif
	endif

	if previous =~ "\<end\>"
		return indent(previousNum) - tabstop
	endif

	return indent(previousNum)
endfunction
