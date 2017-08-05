function laplacian = laplacian2(nx,ny,hx,hy,order,posneg,bcpar)
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
	
	if(~exist('posneg','var'))
		posneg = 1;
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
	
	Dxx = posneg*kron(speye(ny),dx2);
	Dyy = posneg*kron(dy2,speye(nx));
	if(exist('bcpar','var') && ~isempty(a11x))
		Dxx(spdiag(bcpar.we.inds)) = -posneg*bcpar.we.a11.x;
		Dyy(spdiag(bcpar.we.inds)) = -posneg*bcpar.we.a11.y;

		Dxx(spdiag(bcpar.sn.inds)) = -posneg*bcpar.sn.a11.x;
		Dyy(spdiag(bcpar.sn.inds)) = -posneg*bcpar.sn.a11.y;

		Dxx(spdiag(bcpar.io.inds)) = -posneg*bcpar.io.a11.x;
		Dyy(spdiag(bcpar.io.inds)) = -posneg*bcpar.io.a11.y;
	end
	
	laplacian = Dxx/hx^2+Dyy/hy^2;
	
end
	
