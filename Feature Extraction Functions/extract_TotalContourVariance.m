function ratio = extract_TotalContourVariance(glyph)
%ratio = extract_RightSideContourVariance(glyph)



map = glyph.binaryPixelMap;

dims = size(map);
numRows = dims(1);

rowDepths = zeros(2*numRows,1);

for r=1:numRows
    cols = 1:dims(2);
    
    cols = cols(map(r,:));
    
    rowDepths(r) = cols(1);
end

map = fliplr(map);

for r=1:numRows
    cols = 1:dims(2);
    
    cols = cols(map(r,:));
    
    rowDepths(numRows+r) = cols(1);
end

ratio = std(rowDepths) ./ dims(2);

end

