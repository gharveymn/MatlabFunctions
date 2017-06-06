function laplacian = laplacian2(xsz,ysz,h,order,neumann,bcx,bcy)
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
	
	Dxx = kron(speye(ysz),dx2);
	Dyy = kron(dy2,speye(xsz));
	
	if(exist('bcx','var'))
		Dxx = ~bcx.*Dxx + diag(bcx);
	end
	
	if(exist('bcy','var'))
		Dyy = ~bcy.*Dyy + diag(bcy);
	end
	
	laplacian = Dxx+Dyy;
	
end
	
