function f = cfit2func(cf,symvar)	
	syms x
	cn = sym2cell(sym(coeffnames(cf)))';
	f = evalin(symengine,formula(cf));
	cv = num2cell(coeffvalues(cf));
	f = subs(f,cn,cv);
	
	if(exist('symvar','var'))
		f = subs(f,x,symvar);
	end
	
	%C:\Users\Gene\Google Drive\School\[2017_2_W] PHYS 2610\Labs\7
	
end

