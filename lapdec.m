function [P,D] = lapdec(n,h)
	%LAPDEC creates a decomposition for an (n-1)x(n-1) laplacian
	
	Fn = dftmtx(2*n);
	P = sqrt(2/h)*imag(Fn(2:n,2:n));
	D = -diag(4*n^2*sin((1:n-1)*pi/(2*n)).^2);
	
end

