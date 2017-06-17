gmesh = lap*zmesh;
Gmesh = shrnk(reshape(gmesh,[n,n])',order);
gmax = max(max(Gmesh));
gmin = min(min(Gmesh));

xyax = [-1+order*h 1-order*h -1+order*h 1-order*h];
ax = horzcat(xyax,[gmin gmax]);

figure(1)
surf(shrnk(Xmesh,order),shrnk(Ymesh,order),Gmesh)
axis(ax)
title('matrix')

figure(2)
fsurf(g,xyax)
axis(ax)
title('function')