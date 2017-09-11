function lap = laplacian(sz)
	%LAPLACIAN Creates a laplacian of size sz of form
	%	[	1	
	%	 1  -2  1
	%		1	]
	
	lap = sptoeplitz([-2,1],sz);
	
end

