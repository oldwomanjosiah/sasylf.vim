setlocal indentexpr=SlfIndent()

function! SlfIndent()
	let line = getline(v:lnum)
	let previousNum = prevnonblank(v:lnum - 1)
	let previous = getline(previousNum)
	let tabstop = &tabstop

	if previous ~= "::=" && line ~= "|"
		return indent(previous) + tabstop + tabstop

	endif

	if previous =~ "theorem" || previous =~ "lemma" || previous =~ "case" || previous =~ "by induction" || previous =~ "is"
		if line !~ "end"
			return indent(previous) + tabstop
		endif
	endif

	if previous ~= "end"
		return indent(previous) - tabstop
	endif

	return indent(previous)

endfunction
