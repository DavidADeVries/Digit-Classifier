function ratio = extract_LeftSideMaxDepthLocation(glyph)
%numSwitches = extract_LeftSideContourSwitches(glyph)

cutoff = 1/10;

map = glyph.binaryPixelMap;

dims = size(map);
numRows = dims(1);

start = ceil(cutoff * numRows);
finish = floor((1-cutoff) * numRows);

rowDepths = zeros(numRows,1);

for r=start:finish
    cols = 1:dims(2);
    
    cols = cols(map(r,:));
    
    rowDepths(r) = cols(1);
end

maxDepth = max(rowDepths);

rows = 1:numRows;

rows = rows(rowDepths==maxDepth);

ratio = mean(rows) ./ numRows;

end

