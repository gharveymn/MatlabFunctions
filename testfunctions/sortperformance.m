
tic
for i = 1:1000
	a = randi(10000,[10000,1]);
	b = sort(a);
end
e = toc;

fprintf('Sort: %fs\n',e);

tic
for i = 1:1000
	a = randi(10000,[10000,1]);
	b = dpqs_mex(a);
end
e = toc;

fprintf('dpqs: %fs\n',e);
