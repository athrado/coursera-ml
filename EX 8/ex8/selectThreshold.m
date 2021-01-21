function [bestEpsilon bestF1] = selectThreshold(yval, pval)
%SELECTTHRESHOLD Find the best threshold (epsilon) to use for selecting
%outliers
%   [bestEpsilon bestF1] = SELECTTHRESHOLD(yval, pval) finds the best
%   threshold to use for selecting outliers based on the results from a
%   validation set (pval) and the ground truth (yval).
%

bestEpsilon = 0;
bestF1 = 0;
F1 = 0;

stepsize = (max(pval) - min(pval)) / 1000;
for epsilon = min(pval):stepsize:max(pval)

   
    % ====================== YOUR CODE HERE ======================
    % Instructions: Compute the F1 score of choosing epsilon as the
    %               threshold and place the value in F1. The code at the
    %               end of the loop will compare the F1 score for this
    %               choice of epsilon and set it to be the best epsilon if
    %               it is better than the current choice of epsilon.
    %               
    % Note: You can use predictions = (pval < epsilon) to get a binary vector
    %       of 0's and 1's of the outlier predictions


	# Get predictions
	predictions = (pval < epsilon);
	
	# --- FOR LOOP VERSION --- 
	
	# Initialize
	tp = 0;
	fp = 0;
	fn = 0;
	
	# For each sample
	for i=1:length(predictions)
		
		# Get solution and prediction
		sol = yval(i);
		pred = predictions(i);
		
		# Check if it is TP
		if (sol == 1) && (pred == 1)
			tp = tp + 1;
		end
			
		# Check if it is FP
		if (sol == 0) && (pred == 1)
			fp = fp + 1;
		end
		
		# Check if it is FN	
		if (sol == 1) && (pred == 0)
			fn = fn + 1;			
		end
			
	end
		
	# --- VECTORIZED VERSION --- 

	# Compute FP, FN, TP
    fp = sum((predictions == 1) & (yval == 0));
    fn = sum((predictions == 0) & (yval == 1));
    tp = sum((predictions == 1) & (yval == 1));
    

	# Compute precision
	precision = tp / (tp + fp);
	
	# Compute recall
	recall = tp / (tp + fn);
		
	# Compute F1 score
	F1 = (2 * precision * recall) / (precision + recall);

    % =============================================================

	# Get best epsilon by F1
    if F1 > bestF1
       bestF1 = F1;
       bestEpsilon = epsilon;
    end
end

end
