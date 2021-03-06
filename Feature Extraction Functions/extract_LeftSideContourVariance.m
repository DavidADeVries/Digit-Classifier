function ratio = extract_LeftSideContourVariance(glyph)
%ratio = extract_LeftSideContourVariance(glyph)



map = glyph.binaryPixelMap;

dims = size(map);
numRows = dims(1);

rowDepths = zeros(numRows,1);

for r=1:numRows
    cols = 1:dims(2);
    
    cols = cols(map(r,:));
    
    rowDepths(r) = cols(1);
end

ratio = std(rowDepths) ./ dims(2);

end

