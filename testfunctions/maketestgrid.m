syms sx sy
f(sx,sy) = exp(-(sx^2+sy^2));


h = 0.01;
xinit = (-1:h:1)';
yinit = (-1:h:1)';
n = numel(xinit);
[X,Y] = meshgrid(xinit,yinit);
xmesh = kron(ones(n,1),xinit);
ymesh = kron(yinit,ones(n,1));
Xmesh = reshape(xmesh,[n,n])';
Ymesh = reshape(ymesh,[n,n])';

zmesh = exp(-(xmesh.^2+ymesh.^2));
Zmesh = exp(-(Xmesh.^2+Ymesh.^2));