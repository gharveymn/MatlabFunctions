function laplacian = laplacian2(nx,ny,h,a11x,a11y,a11io,order,bcwe,bcsn,bcio,posneg)
	% LAPLACIAN2
	%	Produces a sparse nmxnm Laplacian operating on a discrete distribution with spacing h.
	%	This is for form v = [... v_{i,j} v_{i+1,j} v_{i+2,j} ...].
	%	a11=1,2,3
	%	1 == neumann
	%	2 == dirichlet
	%	3 == dirichlet middle
	
	if(~exist('order','var') || isempty(order))
		order = 1;
	end
	
	if(a11x > 3 || a11x < 1)
		ME = MException('laplacian2:invalidParameterException','Invalid value for a11');
		throw(ME)
	end
	
	if(a11y > 3 || a11y < 1)
		ME = MException('laplacian2:invalidParameterException','Invalid value for a11');
		throw(ME)
	end
	
	
	
	switch order
		case 1
			dx2 = sptoeplitz([-2 1],nx);
			dy2 = sptoeplitz([-2 1],ny);
		case 4
			dx2 = sptoeplitz([-30 16 -1],nx)./12;
			dy2 = sptoeplitz([-30 16 -1],ny)./12;
		otherwise
			ME = MException('laplacian2:invalidParameterException','invalid value for case');
			throw(ME)
	end
	
	if(exist('posneg','var') && posneg == -1)
		Dxx = -kron(speye(ny),dx2);
		Dyy = -kron(dy2,speye(nx));
		Dxx(spdiag(bcwe)) = a11x;
		Dyy(spdiag(bcsn)) = a11y;
		Dxx(spdiag(bcio)) = a11io;
	else
		Dxx = kron(speye(ny),dx2);
		Dyy = kron(dy2,speye(nx));
		Dxx(spdiag(bcwe)) = -a11x;
		Dyy(spdiag(bcsn)) = -a11y;
		Dxx(spdiag(bcio)) = -a11io;
	end
	
	laplacian = (Dxx+Dyy)./h.^2;
	
end
	
