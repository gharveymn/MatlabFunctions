function reg2ebe
	%REG2EBE
	%Calls replaceInSelection for *, /, \, and ^ to element-wise.
	
	replaceInSelection('*','.*')
	replaceInSelection('/','./')
	replaceInSelection('\','.\')
	replaceInSelection('^','.^')
	
end

