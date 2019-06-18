function newNeighborhood = evolveNeighborhood(neighborhood)
% evolve a neighborhood by one day from our social simulation
% 
% INPUTS: 
%   neighborhood - a MxN array of 1's (hostile) and 0's (peaceful) 
%
% OUTPUTS:
%   newNeighborhood - updated array following one step of "evolution"

% check inputs
if nargin==0
    error('Must provide a neighborhood to evolve');
end


nRows = size(neighborhood,1);
nCols = size(neighborhood,2);

% create a new (tomorrow's) neighborhood
newNeighborhood = zeros(nRows,nCols,2);

% step through all of the positions in the current neighborhood
for row = 1:(nRows)
    for col = 1:(nCols)
        % Selecting a subset of people in the neighborhood
        
        % first check the corners
        if (row==1 && col==1) % top left
            localHood = neighborhood(row:row+1 , col:col+1);
        elseif (row==nRows && col==nCols) % bottom right
            localHood = neighborhood(row-1:row , col-1:col);
        elseif (row==nRows && col==1) % bottom left
            localHood = neighborhood(row-1:row , col:col+1);
        elseif (row==1 && col==nCols) % top right
            localHood = neighborhood(row:row+1 , col-1:col);
        
        % next check the edges that are not corners
        elseif ((row==1) && (col~=1 || col~=nCols)) % top, horizontal edge
            localHood = neighborhood(row:row+1 , col-1:col+1);
        elseif ((row == nRows) && (col~=1 || col~=nCols)) % bottom, horizontal edge
            localHood = neighborhood(row-1:row , col-1:col+1); 
        elseif ((col==1) && (row~=1 || row~=nRows)) % left, vertical edge
            localHood = neighborhood(row-1:row+1 , col:col+1);
        elseif ((col==nCols) && (row~=1 || row~=nRows)) % right, vertical edge
            localHood = neighborhood(row-1:row+1 , col-1:col);
        else 
            localHood = neighborhood(row-1:row+1 , col-1:col+1); % people in the middle (not edges or corners)
        end
        
        % find the person in the center
        personInMiddle = neighborhood(row,col,1);
        
        % compute the number of hostile neighbors
        nHostile = sum(sum(localHood)) - personInMiddle;
        
        % update the new neighborhood
        nNeighbors = numel(localHood) - 1;
        if neighborhood(row,col,2)==1 && nHostile >= 1 % if person is short-fused
            newNeighborhood(row,col,1) = 1;
        elseif neighborhood(row,col,2)==0 && nHostile > nNeighbors/2
            newNeighborhood(row,col,1) = 1;
        elseif neighborhood(row,col,2)==0 && nHostile < nNeighbors/2
            newNeighborhood(row,col,1) = 0;
        elseif neighborhood(row,col,2)==0 && nHostile == nNeighbors/2
            newNeighborhood(row,col,1) = neighborhood(row,col);
        end
        
        % update the short-fusedness
        newNeighborhood(row,col,2) = neighborhood(row,col,2);
    end % col
end % row