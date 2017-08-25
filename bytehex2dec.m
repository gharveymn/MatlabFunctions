function out = bytehex2dec(varargin)
	%BYTEHEXTODEC converts byte-hex to decimal
	% that is, hex in the form of 
	% 13 7F 9A 21 = (219A7F13)_16 = (563773203)_10
	
	in = horzcat(varargin{:});
	in = replace(in," ","");
	deci = arrayfun(@(c) sscanf(c, '%x'),in');
	n = numel(deci);
	if(mod(n,2) ~= 0)
		ME = MException('bytehex2dec:invalidParameterException','the length of the input string must be even');
		throw(ME)
	end
	blks = repmat({[0,1;1,0]},1,n/2);
	P = blkdiag(blks{:});
	pdeci = P*(deci);
	out = sum(pdeci.*(arrayfun(@(i) 16^i, (0:n-1)')));
	
end

