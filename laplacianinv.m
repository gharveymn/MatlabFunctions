function lapinv = laplacianinv(sz)
	%LAPINV Creates an inverse of the laplacian of size sz of form
	%	[	1	
	%	 1  -2  1
	%		1	]
	
	v1 = (sz:-1:1)';
	L = v1*(1./v1');
	U = (1./(v1+1))*v1';
	lapinv = -tril(L)*triu(U);
	
end

