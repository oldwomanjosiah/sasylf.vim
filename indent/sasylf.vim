setlocal indentexpr=SlfIndent()

function! SlfIndent()
	let line = getline(v:lnum)
	let previousNum = prevnonblank(v:lnum - 1)
	let previous = getline(previousNum)

	if previous ~= "theorem"
				\ || previous ~= "lemma"
				\ || previous ~= "case" 
				\ || previous ~= "by induction"
				\ || previous ~= "is"
		if line !~ "end"
			return indent(previous) + &tabstop
		endif
	endif

	return indent(previous)

endfunction
