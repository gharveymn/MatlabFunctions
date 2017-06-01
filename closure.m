function [clomeshfull,gridsnew,filteringnew] = closure(xmeshfull,ymeshfull,onfull,valind,nx,ny,h,side,gp)
	%CLOSURE surrounds the input grid with a closure
	% expects vector containing x coordinates and vector containing y coordinates of form
	% 11,21,31,41,12,22,32,42,etc.
	% ie. x is the primary iterator
	%
	% note: expects both x and y to iterate increasing
	%
	% args:
	%	xmeshfull		the x coordinates of the grid to be operated upon
	%	ymeshfull		the y coordinates of the grid to be operated upon
	%	onfull		logical indices of grid points which are on the polygon boundary
	%	valind		logical indices of valid grid points, ie. those inside or on the boundary of the polygon
	%	nx			the number of indices in the x direction
	%	h			the grid differencing
	%	side			specified 'inner' or 'outer' (optional, default 'outer')
	%
	%return:
	%	clomeshfull	the closure (note that this is not added to the grid)
	%	gridsnew		{xinitnew,yinitnew,xmeshnew,ymeshnew,Xmeshnew,Ymeshnew,xmeshfullnew,ymeshfullnew}
	%	filteringnew	filtering matrices
	
	if(~exist('side','var'))
		side = 'outer';
	end
	
	[bc,bcfull] = boundarysides(xmeshfull,ymeshfull,onfull,valind,nx);
	bcw = bcfull{1};
	bce = bcfull{2};
	bcs = bcfull{3};
	bcn = bcfull{4};
	bcc = bcfull{5};
	
	
	xmax = max(xmeshfull);
	xmin = min(xmeshfull);
	ymax = max(ymeshfull);
	ymin = min(ymeshfull);
	
	if(strcmp(side,'outer'))
		
		% how much to increase the grid size in NSEW directions
		incw = ~isempty(xmeshfull(xmeshfull==xmin & valind));
		ince = ~isempty(xmeshfull(xmeshfull==xmax & valind));
		incs = ~isempty(ymeshfull(ymeshfull==ymin & valind));
		incn = ~isempty(ymeshfull(ymeshfull==ymax & valind));
		
		newmat = zeros(ny+incs+incn,nx+incw+ince);
		newmatl = logical(newmat);
		
		%Xmeshnew = reshape(xmeshfull,[nx,ny])';
		%Ymeshnew = reshape(ymeshfull,[nx,ny])';
		%Onfull = reshape(onfull,[nx,ny])';
		Valind = reshape(valind,[nx,ny])';
		
		%NOTE: "SOUTH" INDICES ARE ACTUALLY AT THE TOP OF THE MATRIX
		
		xminnew = xmin;
		xmaxnew = xmax;
		yminnew = ymin;
		ymaxnew = ymax;
		
		if(incw)
			xminnew = xmin - h;
			%Xmeshnew = horzcat(xminnew*ones(ny,1),Xmeshnew);
			%Ymeshnew = horzcat(Ymeshnew(:,1),Ymeshnew);
		end
		
		if(incn)
			xmaxnew = xmax + h;
			%Xmeshnew = horzcat(Xmeshnew,xmaxnew*ones(ny,1));
			%Ymeshnew = horzcat(Ymeshnew,Ymeshnew(:,end));
		end
		
		if(incs)
			yminnew = ymin - h;
			%Xmeshnew = vertcat(Xmeshnew(1,:),Xmeshnew);
			%Ymeshnew = vertcat(yminnew*ones(1,nx),Ymeshnew);
		end
		
		if(incn)
			ymaxnew = ymax + h;
			%Xmeshnew = vertcat(Xmeshnew,Xmeshnew(end,:));
			%Ymeshnew = vertcat(Ymeshnew,ymaxnew*ones(1,nx));
		end
		
		i1 = 1+incs;
		i2 = i1+ny-1;
		j1 = 1+incw;
		j2 = j1+nx-1;
		
		Xmeshnew = newmat;
		Ymeshnew = newmat;
		Clomeshfull = newmatl;
		Onfullnew = newmatl;
		Valindnew = newmatl;
		Bcw = newmatl;
		Bce = newmatl;
		Bcs = newmatl;
		Bcn = newmatl;
		Bcc = newmatl;
		
		Xmeshnew(i1:i2,j1:j2) = reshape(xmeshfull,[nx,ny])';
		Ymeshnew(i1:i2,j1:j2) = reshape(ymeshfull,[nx,ny])';
		Valindnew(i1:i2,j1:j2) = Valind;
		Onfullnew(i1:i2,j1:j2) = reshape(onfull,[nx,ny])';
		Bcw(i1:i2,j1:j2) = reshape(bcw,[nx,ny])';
		Bce(i1:i2,j1:j2) = reshape(bce,[nx,ny])';
		Bcs(i1:i2,j1:j2) = reshape(bcs,[nx,ny])';
		Bcn(i1:i2,j1:j2) = reshape(bcn,[nx,ny])';
		Bcc(i1:i2,j1:j2) = reshape(bcc,[nx,ny])';
		
		Clomeshfull = Clomeshfull | circshift(Bcw,-1,2) | circshift(Bce,1,2) | circshift(Bcs,-1) | circshift(Bcn,1);
		
		Clomeshfull = Clomeshfull | circshift(circshift(Bcc,1),1,2)...
			| circshift(circshift(Bcc,1),-1,2)...
			| circshift(circshift(Bcc,-1),1,2)...
			| circshift(circshift(Bcc,-1),-1,2);
		
		%& ~Valindnew wipes out shifted indices which are inside the polgon
		Clomeshfull = Clomeshfull & ~Valindnew;
		
		Xmeshnew = Xmeshnew./Valindnew;
		Ymeshnew = Ymeshnew./Valindnew;
		
		xinitnew = (xminnew:h:xmaxnew)';
		yinitnew = (yminnew:h:ymaxnew)';
		
		nxnew = numel(xinitnew);
		nynew = numel(yinitnew);
		
		xmeshfullnew = kron(ones(nynew,1),xinitnew);
		ymeshfullnew = kron(yinitnew,ones(nxnew,1));
		
		clomeshfull = reshape(Clomeshfull',[nxnew*nynew,1]);
		onfullnew = reshape(Onfullnew',[nxnew*nynew,1]);
		
		Valindnew = Valindnew | Clomeshfull;
		valindnew = reshape(Valindnew',[nxnew*nynew,1]);
		
		filterMatnew = spdiag(valindnew);
		filterMatnew = filterMatnew(valindnew,:);
		
		xmeshnew = filterMatnew*xmeshfullnew;
		ymeshnew = filterMatnew*ymeshfullnew;
		
		onnew = onfullnew(valindnew);
		
		gridsnew = {xinitnew,yinitnew,xmeshnew,ymeshnew,Xmeshnew,Ymeshnew,xmeshfullnew,ymeshfullnew};
		
		if(exist('gp','var'))
			Gp = newmatl;
			Gp(i1:i2,j1:j2) = reshape(gp,[nx,ny])';
			filteringnew = {filterMatnew,valindnew,onnew,onfullnew,reshape(Gp',[nxnew*nynew,1])};
		else
			filteringnew = {filterMatnew,valindnew,onnew,onfullnew};
		end
		
	elseif(strcmp(side,'inner'))
		%returns smaller size
		
		%clomeshfull should be wrt the original mesh
		%everything else should be converted to the smaller size
		
		% how much to increase the grid size in NSEW directions
		incw = ~isempty(xmeshfull(xmeshfull==xmin & valind));
		ince = ~isempty(xmeshfull(xmeshfull==xmax & valind));
		incs = ~isempty(ymeshfull(ymeshfull==ymin & valind));
		incn = ~isempty(ymeshfull(ymeshfull==ymax & valind));
		
		newmat = zeros(ny+incs+incn,nx+incw+ince);
		newmatl = logical(newmat);
		
		%Xmeshnew = reshape(xmeshfull,[nx,ny])';
		%Ymeshnew = reshape(ymeshfull,[nx,ny])';
		%Onfull = reshape(onfull,[nx,ny])';
		Valind = reshape(valind,[nx,ny])';
		
		%NOTE: "SOUTH" INDICES ARE ACTUALLY AT THE TOP OF THE MATRIX
		
		xminnew = xmin;
		xmaxnew = xmax;
		yminnew = ymin;
		ymaxnew = ymax;
		
		if(incw)
			xminnew = xmin + h;
			%Xmeshnew = horzcat(xminnew*ones(ny,1),Xmeshnew);
			%Ymeshnew = horzcat(Ymeshnew(:,1),Ymeshnew);
		end
		
		if(incn)
			xmaxnew = xmax - h;
			%Xmeshnew = horzcat(Xmeshnew,xmaxnew*ones(ny,1));
			%Ymeshnew = horzcat(Ymeshnew,Ymeshnew(:,end));
		end
		
		if(incs)
			yminnew = ymin + h;
			%Xmeshnew = vertcat(Xmeshnew(1,:),Xmeshnew);
			%Ymeshnew = vertcat(yminnew*ones(1,nx),Ymeshnew);
		end
		
		if(incn)
			ymaxnew = ymax - h;
			%Xmeshnew = vertcat(Xmeshnew,Xmeshnew(end,:));
			%Ymeshnew = vertcat(Ymeshnew,ymaxnew*ones(1,nx));
		end
		
		i1 = 1+incs;
		i2 = i1+ny-1;
		j1 = 1+incw;
		j2 = j1+nx-1;
		
		Xmeshnew = newmat;
		Ymeshnew = newmat;
		Clomeshfull = newmatl;
		Valindnew = newmatl;
		Onfullnew = newmatl;
		Bcw = newmatl;
		Bce = newmatl;
		Bcs = newmatl;
		Bcn = newmatl;
		Bcc = newmatl;
		Smallmatinds = newmatl;
		Innermatinds = newmatl;
		
		Xmeshnew(i1:i2,j1:j2) = reshape(xmeshfull,[nx,ny])';
		Ymeshnew(i1:i2,j1:j2) = reshape(ymeshfull,[nx,ny])';
		Valindnew(i1:i2,j1:j2) = Valind;
		Onfullnew(i1:i2,j1:j2) = reshape(onfull,[nx,ny])';
		Bcw(i1:i2,j1:j2) = reshape(bcw,[nx,ny])';
		Bce(i1:i2,j1:j2) = reshape(bce,[nx,ny])';
		Bcs(i1:i2,j1:j2) = reshape(bcs,[nx,ny])';
		Bcn(i1:i2,j1:j2) = reshape(bcn,[nx,ny])';
		Bcc(i1:i2,j1:j2) = reshape(bcc,[nx,ny])';
		Smallmatinds(i1:i2,j1:j2) = ones(ny,nx);
		
		nxnew = nx - incw - ince;
		nynew = ny - incn - incs;
		
		i1 = i1+incs;
		i2 = i1+nynew;
		j1 = j1+incw;
		j2 = j1+nxnew;
		
		Innermatinds(i1:i2,j1:j2) = ones(nynew,nxnew);
		
		Clomeshfull = Clomeshfull | circshift(Bcw,1,2) | circshift(Bce,-1,2) | circshift(Bcs,1) | circshift(Bcn,-1);
		
		Clomeshfull = Clomeshfull | circshift(circshift(Bcc,1),1,2)...
			| circshift(circshift(Bcc,1),-1,2)...
			| circshift(circshift(Bcc,-1),1,2)...
			| circshift(circshift(Bcc,-1),-1,2);
		
		%& Valindnew wipes out shifted indices which are outside the polgon
		Clomeshfull = Clomeshfull & Valindnew & ~Onfullnew;
		Onmeshfull = Clomeshfull;
		
		Xmeshnew = Xmeshnew./Valindnew;
		Ymeshnew = Ymeshnew./Valindnew;
		
		Clomeshfull = reshape(Clomeshfull(Smallmatinds),[ny,nx]);
		Valindnew = reshape(Valindnew(Innermatinds),[ny,nx]);
		Xmeshnew = reshape(Xmeshnew(Innermatinds),[ny,nx]);
		Ymeshnew = reshape(Ymeshnew(Innermatinds),[ny,nx]);
		
		clomeshfull = reshape(Clomeshfull',[nx*ny,1]);
		
		xinitnew = (xminnew:h:xmaxnew)';
		yinitnew = (yminnew:h:ymaxnew)';
		
		nxnew = numel(xinitnew);
		nynew = numel(yinitnew);
		
		xmeshfullnew = kron(ones(nynew,1),xinitnew);
		ymeshfullnew = kron(yinitnew,ones(nxnew,1));
		
		onfullnew = reshape(Onmeshfull',[nxnew*nynew,1]);
		
		Valindnew = Valindnew | Onmeshfull;
		valindnew = reshape(Valindnew',[nxnew*nynew,1]);
		
		filterMatnew = spdiag(valindnew);
		filterMatnew = filterMatnew(valindnew,:);
		
		xmeshnew = filterMatnew*xmeshfullnew;
		ymeshnew = filterMatnew*ymeshfullnew;
		
		onnew = onfullnew(valindnew);
		
		gridsnew = {xinitnew,yinitnew,xmeshnew,ymeshnew,Xmeshnew,Ymeshnew,xmeshfullnew,ymeshfullnew};
		filteringnew = {filterMatnew,valindnew,onnew,onfullnew};
		
	else
		ME = MException('closure:invalidParameterException','Invalid value for side');
		throw(ME)
	end
	
	
	
	
	
	
end

