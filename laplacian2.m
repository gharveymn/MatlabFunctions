function laplacian = laplacian2(xsz,ysz,h,order,neumann)
	% LAPLACIAN2
	%	Produces a sparse nmxnm Laplacian operating on a discrete distribution with spacing h.
	%	This is for form v = [... v_{i,j} v_{i+1,j} v_{i+2,j} ...].
	
	if(~exist('order','var'))
		order = 1;
	end
	
	if(~exist('neumann','var'))
		neumann = false;
	end
	
	%TODO CHECK H SIZE WRT (n-1)x(n-1) GRID
	
	if(neumann)
		switch order
			case 1
				Dxx = sptoeplitz([-2 1],xsz)./h.^2 + sparse([1,xsz],[1,xsz],[(1/h^2),(1/h^2)],xsz,xsz);
				Dyy = sptoeplitz([-2 1],ysz)./h.^2 + sparse([1,ysz],[1,ysz],[(1/h^2),(1/h^2)],ysz,ysz);
				laplacian = kron(speye(ysz),Dxx)+kron(Dyy,speye(xsz));
			case 2
				Dxx = sptoeplitz([-2 1],xsz)./h.^2 + sparse([1,xsz],[2,xsz-1],[(1/h^2),(1/h^2)],xsz,xsz);
				Dyy = sptoeplitz([-2 1],ysz)./h.^2 + sparse([1,ysz],[2,ysz-1],[(1/h^2),(1/h^2)],ysz,ysz);
				laplacian = kron(speye(ysz),Dxx)+kron(Dyy,speye(xsz));
			otherwise
				ME = MException('laplacian2:invalidParameterException','invalid value for case');
				throw(ME)
		end
					
	else
		
		switch order
			case 1
				Dxx = sptoeplitz([-2 1],xsz)./h.^2;
				Dyy = sptoeplitz([-2 1],ysz)./h.^2;
				laplacian = kron(speye(ysz),Dxx)+kron(Dyy,speye(xsz));
			case 4
				Dxx = sptoeplitz([-30 16 -1],xsz)./(12*h.^2);
				Dyy = sptoeplitz([-30 16 -1],ysz)./(12*h.^2);
				laplacian = kron(speye(ysz),Dxx)+kron(Dyy,speye(xsz));
			otherwise
				ME = MException('laplacian2:invalidParameterException','invalid value for case');
				throw(ME)
			end
				
	end
end
	
