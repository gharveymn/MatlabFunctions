function out = byte2hex(varargin)
	%BYTE2HEX Converts byte-hex to hex (rearranges the digits)
	% that is, hex in the form of 
	% 13 7F 9A 21 = (219A7F13)_16
	
	in = horzcat(varargin{:});
	in = replace(in," ","");
	deci = arrayfun(@(c) sscanf(c, '%x'),in');
	n = numel(deci);
	if(mod(n,2) ~= 0)
		ME = MException('bytehex2dec:invalidParameterException','the length of the input string must be even');
		throw(ME)
	end
	blks = repmat({sparse([1;2],[2;1],[1;1])},1,n/2);
	P = fliplr(blkdiag(blks{:}));
	pdeci = P*deci;
	out = dec2hex(pdeci)';
	
end

