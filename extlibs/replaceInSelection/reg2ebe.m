function reg2ebe
	%REG2EBE
	%Calls replaceInSelection for *, /, \, and ^ to element-wise.
	%
	%%Credit to Sam Johnson, creator of replaceInSelection
	
	replaceInSelection('*','.*')
	replaceInSelection('/','./')
	replaceInSelection('\','.\')
	replaceInSelection('^','.^')
	
end

