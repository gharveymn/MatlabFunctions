function plotmat(A)
	%PLOTMAT plot a matrix
	
	if(issparse(A))
		imshow(mat2gray(full(A)));
	else
		imshow(mat2gray(A));
	end
	
end

