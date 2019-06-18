function neighborhood = makeNeighborhood(nhdHeight,nhdWidth,nShortFuse,propHostile)
% make a nhdHeight x nhdWidth neighborhood for social simulation
%
% INPUTS: 
%   nhdHeight - neighborhood height (integer >= 1)
%   nhdWidth  - neighborhood width (integer >= 1)
%   nShortFuse - number of short-fused individuals
%   propHostile - proportion of hostile individuals
%
% OUTPUTS:
%   neighborhood - a 3d matrix of 1's and 0's: the first layer of the 3rd
%   dimension is hostility; the second layer is short-fusedness

% check inputs
if nargin==0 % use default values if no input (6x6)
    nhdHeight = 6;
    nhdWidth = 6; 
    nShortFuse = 0;
    warning('No neighborhood size specified. Using default (6x6)');
end
if nargin==1
    nhdWidth = nhdHeight;
    nShortFuse = 0;
    warning('No width specified, using height (neighborhood is square)');
end
if nargin==2
    nShortFuse = 0;
end
if ~isnumeric(nhdHeight) || ~isnumeric(nhdWidth)
    error('Neighborhood dimensions must be positive integers');
end
if nhdHeight<1 || nhdWidth<1
    error('Neighborhood dimensions must be positive integers');
end
if floor(nhdHeight)~=nhdHeight || floor(nhdWidth)~=nhdWidth
    error('Neighborhood dimensions/ number of Short Fuse individuals must be whole numbers');
end

neighborhood = zeros(nhdHeight,nhdWidth,2); 
nPeople = nhdHeight*nhdWidth; % numel(neighborhood)

if nargin==4 % if a proportion of hostile is defined
    nHostile = floor(nPeople*propHostile);
else
    nHostile = floor(nPeople*0.5); % if no proportion of hostile defined, make it 50/50
end

% pick the indices / which people are hostile and store in the first layer
hostileIdx = randperm(nPeople,nHostile);
for ii = 1:nHostile
    [hostileRow,hostileCol] = ind2sub([nhdHeight,nhdWidth],hostileIdx(ii));
    neighborhood(hostileRow,hostileCol,1) = 1; % assign those positions to be 1's
end

if (nShortFuse == 0) 
    neighborhood(:,:,2) = 0;
else 
    % pick the indices / which people are short-fuse and store them in the
    % second layer 
    sfIndex = randperm(nPeople,nShortFuse);
    for ii = 1:nShortFuse
        [sfRow,sfCol] = ind2sub([nhdHeight,nhdWidth],sfIndex(ii));
        neighborhood(sfRow,sfCol,2) = 1; % assign those positions to be 1's
    end
end