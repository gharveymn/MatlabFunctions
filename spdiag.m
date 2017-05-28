function mat = spdiag(M,k)
	%SPDIAG implements diag for sparse matrices
	% why spdiags is different from diag we'll never know...
	
	if(size(M,2) > 1)
		% in this case we have a matrix, so extract the diagonal
		% this is only here to reflect usage of diag
		
		if(nargin == 1 || k == 0)
			mat = diag(M);
		else
			mat = diag(M,k);
		end
		
	else
		% here we make a new matrix from the vector
		
		if(nargin == 1 || k == 0)
			vsz = numel(M);
			i = (1:vsz)';
			mat = sparse(i,i,M,vsz,vsz);
		else
			vsz = numel(M);
			absk = abs(k);

			i = (1:vsz)';
			j = (1:vsz)';

			if(k>0)
				j = j+k;
			else
				i = i+absk;
			end

			mat = sparse(i,j,M,vsz+absk,vsz+absk);
		end
	end
end
