syms sx sy
f(sx,sy) = exp(-(sx^2+sy^2));


h = 0.01;
xinit = (-1:h:1)';
yinit = (-1:h:1)';
nx1 = numel(xinit);
ny1 = numel(yinit);
[X,Y] = meshgrid(xinit,yinit);
xmesh = kron(ones(nx1,1),xinit);
ymesh = kron(yinit,ones(nx1,1));
Xmesh = reshape(xmesh,[nx1,nx1])';
Ymesh = reshape(ymesh,[nx1,nx1])';

zmesh = exp(-(xmesh.^2+ymesh.^2));
Zmesh = exp(-(Xmesh.^2+Ymesh.^2));