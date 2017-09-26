function maxWidthLocation = extract_MaximumWidthLocation2(glyph)
%maxWidth = extract_MaximumWidthLocation(glyph)

map = glyph.binaryPixelMap;

dims = size(map);

numRows = dims(1);
numCols = dims(2);

widths = zeros(numRows,1);

for r=1:numRows
    colNums = 1:numCols;
    colNums = colNums(map(r,:));
    
    widths(r) = colNums(end)-colNums(1);
end

maxWidth = max(widths);

rows = 1:numRows;

rows = rows(widths == maxWidth);

maxWidthRow = mean(rows);

maxWidthLocation = maxWidthRow ./ numRows;


end

