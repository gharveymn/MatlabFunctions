function mat = testmat(i,j)
	%TESTMAT returns an iterating matrix
	
	if(nargin == 0)
		mat = [1,2,3;4,5,6;7,8,9];
	elseif(nargin == 1)
		mat = reshape(1:i^2,[i,i])';
	else
		mat = reshape(1:i*j,[j,i])';
	end
	
end

