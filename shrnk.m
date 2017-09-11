function A = shrnk(M,order)
	%SHRNK take off the sides
	if(nargin == 2)
		A = M(1+order:end-order,1+order:end-order);
	else
		A = M(2:end-1,2:end-1);
	end
end

