syms sx sy
f(sx,sy) = exp(-(sx^2+sy^2));


h = 0.01;
xinit = (-1:h:1)';
yinit = (-1:h:1)';
np1 = numel(xinit);
[X,Y] = meshgrid(xinit,yinit);
xmesh = kron(ones(np1,1),xinit);
ymesh = kron(yinit,ones(np1,1));
Xmesh = reshape(xmesh,[np1,np1])';
Ymesh = reshape(ymesh,[np1,np1])';

zmesh = exp(-(xmesh.^2+ymesh.^2));
Zmesh = exp(-(Xmesh.^2+Ymesh.^2));