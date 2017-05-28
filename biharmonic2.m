function bih = biharmonic2(xsz,ysz,h)
	%BIHARMONIC makes a sparse discrete biharmonic operator in 2 dimensions
	%xsz		number of x values in the grid
	%ysz		number of y values in the grid
	
	Dxx = sptoeplitz([-2 1],xsz)./h.^2;
	Dyy = sptoeplitz([-2 1],ysz)./h.^2;
	Cx = sparse([1,xsz],[1,xsz],[(1/h^4),(1/h^4)],xsz,xsz);
	Cy = sparse([1,ysz],[1,ysz],[(1/h^4),(1/h^4)],ysz,ysz);
	
	Dx4 = kron(speye(ysz),Dxx^2);
	Dy4 = kron(Dyy^2,speye(xsz));
	Dx2y2 = kron(Dxx,Dyy);
	C = kron(speye(ysz),Cx) + kron(Cy,speye(xsz));
	
	bih = Dx4 + 2*Dx2y2 + Dy4 + C;
	
	
end

