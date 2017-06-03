gmesh = lap*zmesh;
Gmesh = shrink(reshape(gmesh,[n,n])',order);
gmax = max(max(Gmesh));
gmin = min(min(Gmesh));

xyax = [-1+order*h 1-order*h -1+order*h 1-order*h];
ax = horzcat(xyax,[gmin gmax]);

figure(1)
surf(shrink(Xmesh,order),shrink(Ymesh,order),shrink(reshape(lap*zmesh,[n,n])',order))
axis(ax)
title('matrix')

figure(2)
fsurf(g,xyax)
axis(ax)
title('function')