function mat = testmat(sz)
	%TESTMAT returns a square matrix of form [1,2,3;4,5,6;7,8,9]
	
	if(nargin == 0)
		mat = [1,2,3;4,5,6;7,8,9];
	else
		mat = reshape(1:sz^2,[sz,sz])';
	end
	
end

