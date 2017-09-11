function B = mvgavg(A,k)
	%MVGAVG takes the first order moving average along the specified dimension
	%k defaults to 1
	
	if(nargin == 1)
		k = 1;
	end
	
	if(k == 1)
		if(size(A,1) < 2)
			ME = MException('mvgavg:invalidParameterException','A must have size of at least 2 along the specified dimension');
			throw(ME)
		end
		
		B = (A(2:end,:)+A(1:end-1,:))/2;
	elseif(k == 2)
		
		if(size(A,2) < 2)
			ME = MException('mvgavg:invalidParameterException','A must have size of at least 2 along the specified dimension');
			throw(ME)
		end
		
		B = (A(:,2:end)+A(:,1:end-1))/2;
	else
		ME = MException('mvgavg:invalidParameterException','k must be 1 or 2');
		throw(ME)
	end
	
end

