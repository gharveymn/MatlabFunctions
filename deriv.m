function dx = deriv(n,order,difforder)
	%DERIV Summary of this function goes here
	%   Detailed explanation goes here
	
	if(~exist('order','var'))
		order = 1;
	end
	
	switch order
		case 1
			if(~exist('difforder','var'))
				difforder = 2;
			end
			
			switch difforder
				case 1
					dx = n*sptoeplitz([-1 0],[-1 1],n-1);
				case 2
					dx = n/2*sptoeplitz([0 -1],[0 1],n-1);
				case 4
					dx = n/12*sptoeplitz([0 -8 1],[0 8 -1],n-1);
				otherwise
					ME = MException('deriv:invalidParameterException','invalid value for difforder');
					throw(ME)
			end
	
		case 2
			if(~exist('difforder','var'))
				difforder = 1;
			end
			
			switch difforder
				case 1
					dx = n*sptoeplitz([-2 1],n);
				otherwise
					ME = MException('deriv:invalidParameterException','invalid value for difforder');
					throw(ME)
			end
		otherwise
			ME = MException('deriv:invalidParameterException','invalid value for order');
			throw(ME)
			
	end
		
	
	
end

