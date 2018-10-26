% Displays 2D data stored in X.
% Each raw of X is one squared image reshaped into vector.
function [h, display_array] = display_data(X)
	% Since every row in X is a squared image reshaped into vector we may calculate its width.
	example_width = round(sqrt(size(X, 2)));

	% Gray Image
	colormap(gray);

	% Compute rows, cols
	[m n] = size(X);
	example_height = (n / example_width);

	% Compute number of items to display
	display_rows = floor(sqrt(m));
	display_cols = ceil(m / display_rows);

	% Between images padding
	pad = 1;

	% Setup blank display
	display_array = -ones(pad + display_rows * (example_height + pad), pad + display_cols * (example_width + pad));

	% Copy each example into a patch on the display array
	curr_ex = 1;
	for j = 1:display_rows
		for i = 1:display_cols
			if curr_ex > m, 
				break; 
			end
			% Copy the patch
			
			% Get the max value of the patch
			max_val = max(abs(X(curr_ex, :)));

			row_shift = pad + (j - 1) * (example_height + pad) + (1:example_height);
			column_shift = pad + (i - 1) * (example_width + pad) + (1:example_width);

			display_array(row_shift, column_shift) = reshape(X(curr_ex, :), example_height, example_width) / max_val;
			curr_ex = curr_ex + 1;
		end
		if curr_ex > m, 
			break; 
		end
	end

	% Display Image
	h = imagesc(display_array, [-1 1]);

	% Do not show axis
	axis image off;

	drawnow;
end
