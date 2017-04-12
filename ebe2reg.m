function ebe2reg
	%EBE2REG 
	%Does the opposite of reg2ebe
	
	replaceInSelection('.*','*')
	replaceInSelection('./','/')
	replaceInSelection('.\','\')
	replaceInSelection('.^','^')
	
end

