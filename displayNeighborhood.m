function displayNeighborhood(neighborhood,displayType)
% display a neighborhood from the social simulation
%
% INPUTS:
%   neighborhood - a 2-D array with 1's (hostile) and 0's (peaceful)
%   displayType  - 1 - circles, 2 - as an image (squares)
% 
% makes a graph of the neighborhood

if nargin==1 
    displayType = 1;
    warning('No display type specified, using circles as default');
end
if nargin==0
    error('Must provide a neighborhood as input');
end

% flip neighborhood upside-down to make coordinates match:
invHood = flipud(neighborhood);

% get the size of the neighborhood:
nRows = size(neighborhood,1);
nCols = size(neighborhood,2);

% step through each location in the neighborhood and plot a corresponding
% point in that person's color (1 or 0):
hold on;
for row = 1:nRows
    for col = 1:nCols
        if invHood(row,col,1) == 0 % white
            if invHood(row,col,2) == 1  % if shortFused, outline in red
                plot(col+0.5,row+0.5,'ok','MarkerSize',16,'MarkerEdgeColor','red');
            else
                plot(col+0.5,row+0.5,'ok','MarkerSize',16);
            end
        else % black
            if invHood(row,col,2) == 1 % if shortFused, outline in red
                plot(col+0.5,row+0.5,'ok','MarkerSize',16,'MarkerFaceColor','black','MarkerEdgeColor','red');
            else 
                 plot(col+0.5,row+0.5,'ok','MarkerSize',16,'MarkerFaceColor','black');
            end
        end
    end % columns
end % rows

% make a grid:
grid on;
% make grid black instead of light gray
set(gca,'GridColor','black'); 
set(gca,'GridAlpha',1);

% get rid of numbers:
set(gca,'YTickLabel',[]);
set(gca,'XTickLabel',[]);