function xout=bijectivelogis(xin,c_3)
	%DEPRECATED (use bilogis). Makes a bijective logistic transform from 0 to 1. That is, f:[0,1]->[0,1] invertible s.t.
	%	        e^(c_3/2)-e^(-c_3*(x-1/2))
	% f(x) =  ----------------------------------.
	%     	(e^(c_3/2)-1)*(1+e^(-c_3*(x-1/2)))
	
	c_1 = (exp(c_3/2) + 1)/(exp(c_3/2) - 1);
	c_4 = -1/(exp(c_3/2) - 1);
	%c_4 = 1/2 - c_1;
	
	xout = c_1./(1+exp(-c_3*(xin-1/2))) + c_4;
	
end

