function bih = biharmonic2(nx,ny,hx,hy,bcxd,bcyd,bcxn,bcyn,posneg)
	%BIHARMONIC makes a sparse discrete biharmonic operator in 2 dimensions
	%nx		number of x values in the grid
	%ny		number of y values in the grid
	%h		the consistence difference between grids
	Dxx = sptoeplitz([-2 1],nx)./hx.^2;
	Dyy = sptoeplitz([-2 1],ny)./hy.^2;
	Cx = 2*spdiag(bcxn)/hx^4;
	Cy = 2*spdiag(bcyn)/hy^4;
	
	if(exist('posneg','var') && posneg == -1)
		Dx4 = -kron(speye(ny),Dxx^2) - Cx;
		Dy4 = -kron(Dyy^2,speye(nx)) - Cy;
		Dx2y2 = -kron(Dyy,Dxx);
	else
		Dx4 = kron(speye(ny),Dxx^2) + Cx;
		Dy4 = kron(Dyy^2,speye(nx)) + Cy;
		Dx2y2 = kron(Dyy,Dxx);
	end
	
% 	boolbcxd = exist('bcxd','var') && ~isempty(bcxd);
% 	boolbcyd = exist('bcyd','var') && ~isempty(bcyd);
% 	boolbcxn = exist('bcxn','var') && ~isempty(bcxn);
% 	boolbcyn = exist('bcyn','var') && ~isempty(bcyn);
	
% 	if(boolbcxd)
% 		Dx4 = spdiag(~bcxd)*Dx4 + spdiag(bcxd);
% 		Dx2y2 = spdiag(~bcxd)*Dx2y2;
% 		Dy4 = spdiag(~bcxd)*Dy4;
% 	end
% 	
% 	if(boolbcyd)
% 		Dy4 = spdiag(~bcyd)*Dy4 + spdiag(bcyd);
% 		Dx2y2 = spdiag(~bcyd)*Dx2y2;
% 		Dx4 = spdiag(~bcyd)*Dx4;
% 	end
% 	
% 	if(boolbcxd && boolbcyd)
% 		Dx4 = spdiag(~(bcxd&bcyd))*Dx4 + 0.5*spdiag(bcxd&bcyd);
% 		Dy4 = spdiag(~(bcxd&bcyd))*Dy4 + 0.5*spdiag(bcxd&bcyd);
% 	end
% 	
% 	if(boolbcxn)
% 		Dx = sptoeplitz([0 -1],[0 1],nx)./(2*hx);
% 		dx = kron(speye(ny),Dx);
% 		dx = spdiag(bcxn)*dx;
% 		
% 		Dx4 = spdiag(~bcxn)*Dx4 + dx;
% 		Dx2y2 = spdiag(~bcxn)*Dx2y2;
% 		Dy4 = spdiag(~bcxn)*Dy4;
% 	end
% 	
% 	if(boolbcyn)
% 		Dy = sptoeplitz([0 -1],[0 1],ny)./(2*hy);
% 		dy = kron(Dy,speye(nx));
% 		dy = spdiag(bcyn)*dy;
% 		
% 		Dy4 = spdiag(~bcyn)*Dy4 + dy;
% 		Dx2y2 = spdiag(~bcyn)*Dx2y2;
% 		Dx4 = spdiag(~bcyn)*Dx4;
% 	end
% 	
% 	if(boolbcxn && boolbcyn)
% 		Dx4 = spdiag(~(bcxn&bcyn))*Dx4 + dx;
% 		Dy4 = spdiag(~(bcxn&bcyn))*Dy4 + dy;
% 	end
	
	
	bih = Dx4 + 2*Dx2y2 + Dy4 + Cx + Cy;
	
	
end

