function xout=dhalfbilogit(xin,order,c_3,newlo,newhi,lo,hi)
	%Derivative of logit, uc_1 to order 2
	%
	%Author: Gene Harvey
	
		switch nargin
			case 3
				newlo = min(xin);
				newhi = max(xin);
				lo = newlo;
				hi = newhi;
			case 5
				lo = newlo;
				hi = newhi;
			case 6
				error('Too many or too few arguments. Need either 5 or 7, you entered 6.')
		end
	
	c_1 = (exp(c_3/2) + 1)/(exp(c_3/2) - 1);
	c_4 = -1/(exp(c_3/2) - 1);
	
	switch order
		case 1
			xout = ((2.*hi.*c_1 - 2.*lo.*c_1).*(2.*newhi - 2.*newlo))./(c_3.*((2.*hi.*c_1 - 2.*lo.*c_1)...
					./(hi - 2.*lo + xin - 2.*hi.*c_4 + 2.*lo.*c_4) - 1)...
					.*(hi - 2.*lo + xin - 2.*hi.*c_4 + 2.*lo.*c_4).^2);
		case 2
			xout = ((2.*hi.*c_1 - 2.*lo.*c_1).^2.*(2.*newhi - 2.*newlo))./(c_3.*((2.*hi.*c_1 - 2.*lo.*c_1)...
					./(hi - 2.*lo + xin - 2.*hi.*c_4 + 2.*lo.*c_4) - 1).^2.*(hi - 2.*lo ...
					+ xin - 2.*hi.*c_4 + 2.*lo.*c_4).^4) - (2.*(2.*hi.*c_1 - 2.*lo.*c_1)*(2.*newhi - 2.*newlo))...
					./(c_3.*((2.*hi.*c_1 - 2.*lo.*c_1)./(hi - 2.*lo + xin - 2.*hi.*c_4 + 2.*lo.*c_4) ...
					- 1).*(hi - 2.*lo + xin - 2.*hi.*c_4 + 2.*lo.*c_4).^3);
			
			%xout = -(((2.*c_1.*hi - 2.*c_1.*lo)./2.*(2.*newhi - 2.*newlo))./(c_3.*((2.*c_1.*hi - 2.*c_1.*lo)...
			%	./(hi - 2.*lo + xin - 2.*c_4.*hi + 2.*c_4.*lo) - 1)./2.*(hi - 2.*lo + xin - 2 ...
			%	.*c_4.*hi + 2.*c_4.*lo)./4) - (2.*(2.*c_1.*hi - 2.*c_1.*lo).*(2.*newhi - 2.*newlo))...
			%	./(c_3.*((2.*c_1.*hi - 2.*c_1.*lo)./(hi - 2.*lo + xin - 2.*c_4.*hi + 2.*c_4.*lo) - 1)...
			%	.*(hi - 2.*lo + xin - 2.*c_4.*hi + 2.*c_4.*lo)./3));

	end