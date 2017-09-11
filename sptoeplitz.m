function out = sptoeplitz(a,b,m,n)
	%sptoeplitz
	%	Creates a sparse toeplitz matrix
	%
	%	Input options:
	%		sptoeplitz(b)
	%		sptoeplitz(a,b)
	%		sptoeplitz(b,n)
	%		sptoeplitz(b,m,n)
	%		sptoeplitz(a,b,n)
	%		sptoeplitz(a,b,m,n)
	%
	
	switch nargin
		case 1
			b = a;
			m = numel(a);
			n = m;
		case 2
			if(numel(b)==1)
				n = b;
				m = n;
				b = a;
			else
				b = a;
				m = numel(a);
				n = numel(b);				
			end
		case 3
			if(numel(b)==1)
				n = m;
				m = b;
				b = a;
			else
				n = m;
			end
	end
	
	if(a(1)~=b(1))
		warning(['First element of input column does not match first element of input row. '...,
				'Column wins diagonal conflict.']);
	end
	
	if(numel(a) > m)
		error('Your vector "a" is too long')
	elseif(numel(b) > n)
		error('Your vector "b" is too long')
	end
	
	dia = a(1);
	belowDia = a(2:end)';
	aboveDia = b(2:end)';
	
	szI = numel(belowDia);
	szJ = numel(aboveDia);
	
	upto = min(m,n);
	
	%inner block
	irJ = upto*min(szJ,max(n-m,0));
	irI = upto*min(szI,max(m-n,0));
	
	%outer block
	itJ = max(szJ-irJ,0);
	itI = max(szI-irI,0);
	reJ = upto*itJ - sum(0:itJ);
	reI = upto*itI - sum(0:itI);
	num = irJ+irI+reJ+reI+upto;
	
	i = zeros(num,1);
	j = zeros(num,1);
	v = zeros(num,1);
	
	idx = 1;
	
	if(m < n)
		for k=1:szI
			i(idx:idx+m-k-1) = (k+1:m)';
			j(idx:idx+m-k-1) = (1:m-k)';
			v(idx:idx+m-k-1) = belowDia(k);
			idx = idx+m-k;
		end
		
		for k=1:min(n-m,szJ)
			i(idx:idx+m-1) = (1:m)';
			j(idx:idx+m-1) = (k+1:m+k)';
			v(idx:idx+m-1) = aboveDia(k);
			idx = idx+m;
		end

		for k=n-m+1:szJ
			i(idx:idx+n-k-1) = (1:n-k)';
			j(idx:idx+n-k-1) = (k+1:n)';
			v(idx:idx+n-k-1) = aboveDia(k);
			idx=idx+n-k;
		end
	else
		
		for k=1:min(m-n,szI)
			i(idx:idx+n-1) = (k+1:n+k)';
			j(idx:idx+n-1) = (1:n)';
			v(idx:idx+n-1) = belowDia(k);
			idx = idx+n;
		end
		
		for k=m-n+1:szI
			i(idx:idx+m-k-1) = (k+1:m)';
			j(idx:idx+m-k-1) = (1:m-k)';
			v(idx:idx+m-k-1) = belowDia(k);
			idx = idx+m-k;
		end

		for k=1:szJ
			i(idx:idx+n-k-1) = (1:n-k)';
			j(idx:idx+n-k-1) = (k+1:n)';
			v(idx:idx+n-k-1) = aboveDia(k);
			idx = idx+n-k;
		end
	end
	
	i(idx:end) = (1:upto)';
	j(idx:end) = (1:upto)';
	v(idx:end) = dia;
	
	out = sparse(i,j,v,m,n);
	
end

