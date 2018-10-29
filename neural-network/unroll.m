% Unrolls cells of matrixes into one long vector.
function unrolled_cells = unroll(cells)
    % Calculate the total number of cells.
    cells_count = length(cells);
    unrolled_cells = []; % Vectorized version of cells.
    for cell_number=1:cells_count        
        % Unroll cells into vector form.
        unrolled_cells = [unrolled_cells; cells{cell_number}(:)];
    end
end
