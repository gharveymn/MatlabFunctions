function xout=bijectivelogit(xin,c_3)
	%DEPRECATED (use bilogit). The inverse of the function found in bijectiveLogis.
	
	c_1 = (exp(c_3/2) + 1)/(exp(c_3/2) - 1);
	c_4 = -1/(exp(c_3/2) - 1);
	
	xout = 1/2 - log(-c_1./(c_4-xin)-1)./c_3;
	
end

