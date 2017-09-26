function maxWidthLocation = extract_MaximumWidthLocation(glyph)
%maxWidth = extract_MaximumWidthLocation(glyph)

map = glyph.binaryPixelMap;

rowSums = sum(map,2);

maxRowSum = max(rowSums);

dims = size(map);

numRows = dims(1);

rows = 1:numRows;

rows = rows(rowSums == maxRowSum);

maxWidthRow = mean(rows);

maxWidthLocation = maxWidthRow ./ numRows;


end

