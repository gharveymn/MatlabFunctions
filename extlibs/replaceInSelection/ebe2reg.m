function ebe2reg
	%EBE2REG 
	%Does the opposite of reg2ebe
	%
	%Credit to Sam Johnson, creator of replaceInSelection
	
	replaceInSelection('.*','*')
	replaceInSelection('./','/')
	replaceInSelection('.\','\')
	replaceInSelection('.^','^')
	
end

