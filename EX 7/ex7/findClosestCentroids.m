function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);
m = size(X, 1),
% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);


% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%

# Distance array
distances = zeros(m, K);

# For each sample
for i=1:m

	# For each cluster centroid
	for j=1:K
	
		# Save distance
		distances(i,j) = sum((X(i, :)-centroids(j, :)).^2);
	end
	
#	# ~~~ Get minimum index during loop ~~~
#	
#	# Get index of minimum distance
#	[~, min_idx] = min(distances(i,:));
#	
#	# Save cluster index for each sample
#	idx(i) = min_idx;
#	
#	# ~~~

end

# Get indices of minimum distance all at once
[~, idx] = min(distances, [], 2);

% =============================================================

end

