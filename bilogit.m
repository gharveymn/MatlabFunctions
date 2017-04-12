function xout=bilogit(xin,c_3,lo,hi)
	%Inverse of bilogis
	
	c_1 = (exp(c_3/2) + 1)/(exp(c_3/2) - 1);
	c_4 = -1/(exp(c_3/2) - 1);
	
	xout = lo - (log(- c_1./(c_4 + (lo - xin)./(hi - lo)) - 1)./c_3 - 1/2).*(hi - lo);
	
end

