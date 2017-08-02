function array = dpqs(array)
	%DPQS Implements a dual pivot quick sort
	
	array = dpqs_mex(array);
	%array = DPQSWorker(array,1,numel(array));
	
end

function array = DPQSWorker(array, lowerBound, upperBound)
	
	if(upperBound <= lowerBound)
		return;
	end
	
	pivot1Index = lowerBound;
	pivot2Index = upperBound;

	prevIndex1 = pivot2Index;
	prevIndex2 = pivot1Index;
	
	run = true;
	
	while(run)
		
		run = false;
		
		for i = prevIndex1:-1:pivot1Index+1
			
			if(array(i) < array(pivot1Index))
				if(i ~= pivot2Index)
					while(array(pivot1Index+1) < array(pivot1Index))
						tmp = array(pivot1Index);
						array(pivot1Index) = array(pivot1Index+1);
						array(pivot1Index+1) = tmp;
						pivot1Index = pivot1Index+1;
						if(pivot1Index > prevIndex2)
							prevIndex2 = pivot1Index;
						end
					end
					
					if(i <= pivot1Index)
						break;
					end
					
					tmp = array(pivot1Index);
					array(pivot1Index) = array(i);
					array(i) = array(pivot1Index+1);
					array(pivot1Index+1) = tmp;
					pivot1Index = pivot1Index + 1;
					prevIndex1 = i;
				else
					tmp = array(pivot1Index);
					array(pivot1Index) = array(pivot2Index);
					array(pivot2Index) = tmp;
				end
				
				run = true;
				
				break;
				
			end
			
		end
			
			for i = prevIndex2:pivot2Index-1
				
				if(array(i) > array(pivot2Index))
					
					if(i ~= pivot1Index)
						
						while(array(pivot2Index-1) > array(pivot2Index))
							
							tmp = array(pivot2Index);
							array(pivot2Index) = array(pivot2Index-1);
							array(pivot2Index-1) = tmp;
							pivot2Index = pivot2Index - 1;
							if(pivot2Index < prevIndex1)
								prevIndex1 = pivot2Index;
							end
						end
						
						if(i >= pivot2Index)
							break;
						end
						
						tmp = array(pivot2Index);
						array(pivot2Index) = array(i);
						array(i) = array(pivot2Index-1);
						array(pivot2Index-1) = tmp;
						pivot2Index = pivot2Index -1;
						prevIndex2 = i;
					else
						tmp = array(pivot2Index);
						array(pivot2Index) = array(pivot1Index);
						array(pivot1Index) = tmp;
					end
					run = true;
					
					break;
					
				end
			end
			
	end
		
		array = DPQSWorker(array, lowerBound, pivot1Index - 1);
		array = DPQSWorker(array, pivot1Index + 1, pivot2Index - 1);
		array = DPQSWorker(array, pivot2Index + 1, upperBound);
		
end

