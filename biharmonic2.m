function bih = biharmonic2(xsz,ysz,h,bcx,bcy)
	%BIHARMONIC makes a sparse discrete biharmonic operator in 2 dimensions
	%xsz		number of x values in the grid
	%ysz		number of y values in the grid
	%h		the consistence difference between grids
	Dxx = sptoeplitz([-2 1],xsz)./h.^2;
	Dyy = sptoeplitz([-2 1],ysz)./h.^2;
	Cx = sparse([1,xsz],[1,xsz],[(2/h^4),(2/h^4)],xsz,xsz);
	Cy = sparse([1,ysz],[1,ysz],[(2/h^4),(2/h^4)],ysz,ysz);
	
	Dx4 = kron(speye(ysz),Dxx^2) + kron(speye(ysz),Cx);
	Dy4 = kron(Dyy^2,speye(xsz)) + kron(Cy,speye(xsz));
	Dx2y2 = kron(Dyy,Dxx);
	
	if(exist('bcx','var'))
		Dx4 = spdiag(~bcx)*Dx4 + spdiag(bcx);
		
		%why??                v
		Dx2y2 = spdiag(~bcx)*Dx2y2;
	end
	
	if(exist('bcy','var'))
		Dy4 = spdiag(~bcy)*Dy4 + spdiag(bcy);
		
		%why??                v
		Dx2y2 = spdiag(~bcy)*Dx2y2;
	end
	
	bih = Dx4 + 2*Dx2y2 + Dy4;
	%bih = Dx4 + Dy4;
	
	
end

