function laplacian = laplacian2(xsz,ysz,h,order,neumann,bcx,bcy,posneg)
	% LAPLACIAN2
	%	Produces a sparse nmxnm Laplacian operating on a discrete distribution with spacing h.
	%	This is for form v = [... v_{i,j} v_{i+1,j} v_{i+2,j} ...].
	
	if(~exist('order','var') || isempty(order))
		order = 1;
	end
	
	if(~exist('neumann','var') || isempty(neumann))
		neumann = false;
	end
	
	%TODO CHECK H SIZE WRT (n-1)x(n-1) GRID
	
	if(neumann)
		switch order
			case 1
				dx2 = sptoeplitz([-2 1],xsz)./h.^2 + sparse([1,xsz],[1,xsz],[(1/h^2),(1/h^2)],xsz,xsz);
				dy2 = sptoeplitz([-2 1],ysz)./h.^2 + sparse([1,ysz],[1,ysz],[(1/h^2),(1/h^2)],ysz,ysz);
			case 2
				dx2 = sptoeplitz([-2 1],xsz)./h.^2 + sparse([1,xsz],[2,xsz-1],[(1/h^2),(1/h^2)],xsz,xsz);
				dy2 = sptoeplitz([-2 1],ysz)./h.^2 + sparse([1,ysz],[2,ysz-1],[(1/h^2),(1/h^2)],ysz,ysz);
			otherwise
				ME = MException('laplacian2:invalidParameterException','invalid value for case');
				throw(ME)
		end
					
	else
		
		switch order
			case 1
				dx2 = sptoeplitz([-2 1],xsz)./h.^2;
				dy2 = sptoeplitz([-2 1],ysz)./h.^2;
			case 4
				dx2 = sptoeplitz([-30 16 -1],xsz)./(12*h.^2);
				dy2 = sptoeplitz([-30 16 -1],ysz)./(12*h.^2);
			otherwise
				ME = MException('laplacian2:invalidParameterException','invalid value for case');
				throw(ME)
		end
	end
	
	if(exist('posneg','var') && posneg == -1)
		Dxx = -kron(speye(ysz),dx2);
		Dyy = -kron(dy2,speye(xsz));
	else
		Dxx = kron(speye(ysz),dx2);
		Dyy = kron(dy2,speye(xsz));
	end
	
	if(exist('bcx','var') && ~isempty(bcx))
		Dxx = spdiag(~bcx)*Dxx + spdiag(bcx);
	end
	
	if(exist('bcy','var') && ~isempty(bcy))
		Dyy = spdiag(~bcy)*Dyy + spdiag(bcy);
	end
	
	%make sure we don't double add
	if(exist('bcx','var') && exist('bcy','var') && ~(isempty(bcx)||isempty(bcy)))
		Dxx = spdiag(~(bcx&bcy))*Dxy + 0.5*spdiag(bcx&bcy);
		Dyy = spdiag(~(bcx&bcy))*Dyy + 0.5*spdiag(bcx&bcy);
	end
	
	laplacian = Dxx+Dyy;
	
end
	
