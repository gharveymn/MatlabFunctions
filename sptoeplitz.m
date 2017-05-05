function out = sptoeplitz(a,b,m,n)
	%sptoeplitz
	%	Creates a sparse toeplitz matrix
	%
	%	Input options:
	%		sptoep(b)
	%		sptoep(a,b)
	%		sptoep(b,n)
	%		sptoep(b,m,n)
	%		sptoep(a,b,n)
	%		sptoep(a,b,m,n)
	
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
		warning(['First element of input column does not match first element of input row.\n'...,
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
			
	ii = cell(1,szI);
	ij = cell(1,szI);
	iv = cell(1,szI);
	
	ji = cell(1,szJ);
	jj = cell(1,szJ);
	jv = cell(1,szI);
	
	upto = min(n,m);
	
	if(m < n)
		for k=1:szI
			ii{k} = (k+1:m)';
			ij{k} = (1:m-k)';
			iv{k} = belowDia(k).*ones(m-k,1);
		end
		
		for k=1:min(n-m,szJ)
			ji{k} = (1:m)';
			jj{k} = (k+1:m+k)';
			jv{k} = aboveDia(k).*ones(m,1);
		end

		for k=n-m+1:szJ
			ji{k} = (1:n-k)';
			jj{k} = (k+1:n)';
			jv{k} = aboveDia(k).*ones(n-k,1);
		end
	else
		
		for k=1:min(m-n,szI)
			ii{k} = (k+1:n+k)';
			ij{k} = (1:n)';
			iv{k} = belowDia(k).*ones(n,1);
		end
		
		for k=m-n+1:szI
			ii{k} = (k+1:m)';
			ij{k} = (1:m-k)';
			iv{k} = belowDia(k).*ones(m-k,1);
		end

		for k=1:szJ
			ji{k} = (1:n-k)';
			jj{k} = (k+1:n)';
			jv{k} = aboveDia(k).*ones(n-k,1);
		end
	end
		
	i = vertcat(ii{:},ji{:},(1:upto)');
	j = vertcat(ij{:},jj{:},(1:upto)');
	v = vertcat(iv{:},jv{:},dia.*ones(upto,1));
	
	out = sparse(i,j,v,m,n);
	
end

