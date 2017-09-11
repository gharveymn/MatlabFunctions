function dx = deriv(n,h,order,difforder)
	%DERIV makes an nxn derivative matrix wrt a difference scheme for h
	
	%TODO check matrix size
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
					dx = sptoeplitz([-1 0],[-1 1],n)./h;
				case 2
					dx = sptoeplitz([0 -1],[0 1],n)./(2*h);
				case 4
					dx = sptoeplitz([0 -8 1],[0 8 -1],n)./(12*h);
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
					dx = sptoeplitz([-2 1],n)./(h^2);
				otherwise
					ME = MException('deriv:invalidParameterException','invalid value for difforder');
					throw(ME)
			end
		otherwise
			ME = MException('deriv:invalidParameterException','invalid value for order');
			throw(ME)
			
	end
		
	
	
end

