function [bcw,bce,bcs,bcn,bcc] = boundarysides(xmeshfull,ymeshfull,onfull,valind,nx)
	%GETWHEREBOUNDARIES I'm somewhat suprised this actually works
	
	xmin = min(xmeshfull);
	xmax = max(xmeshfull);
	ymin = min(ymeshfull);
	ymax = max(ymeshfull);
	
	bcw = onfull;
	bce = onfull;
	bcs = onfull;
	bcn = onfull;
	
	xminb = (xmeshfull==xmin);
	xmaxb = (xmeshfull==xmax);
	yminb = (ymeshfull==ymin);
	ymaxb = (ymeshfull==ymax);
	
	bcw = bcw&(xminb);
	bce = bce&(xmaxb);
	bcs = bcs&(yminb);
	bcn = bcn&(ymaxb);
	
	r = circshift(valind&~xmaxb,1);
	l = circshift(valind&~xminb,-1);
	u = circshift(valind&~ymaxb,nx);
	d = circshift(valind&~yminb,-nx);
	
	bcw = bcw|onfull&~r;
	bce = bce|onfull&~l;
	bcs = bcs|onfull&~u;
	bcn = bcn|onfull&~d;
	
	%corners--is in two of the previous or is surrounded
	bcc = (bcw&bce)|(bcw&bcs)|(bcw&bcn)|(bce&bcs)|(bce&bcn)|(bcs&bcn);
	
	%inner corner boundary condition
	bcci = onfull&(r&l&u&d);
	
	bcw = bcw|bcci;
	bce = bce|bcci;
	bcs = bcs|bcci;
	bcn = bcn|bcci;
	bcc = bcc|bcci;
	
	%wipe out invalid indices
	bcw = bcw(valind);
	bce = bce(valind);
	bcs = bcs(valind);
	bcn = bcn(valind);
	bcc = bcc(valind);
end

