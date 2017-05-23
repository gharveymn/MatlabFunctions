function [L,D,U] = ldu(A)
	%LDU makes an additive A=L+D+U decomposition for use in Jacobi Iteration
	
	L = tril(A,-1);
	D = diag(diag(A));
	U = triu(A,1);
	
end

