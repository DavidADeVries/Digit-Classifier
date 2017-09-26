function ratio = extract_WidthAtTop(glyph)
%ratio = extractWidthAtTop(glyph)

cutoff = 1/10;
map = glyph.binaryPixelMap;

dims = size(map);

numRows = ceil(cutoff*dims(1));

sums = sum(map(1:numRows,:),2);
%sums = sum(map(1,:),2);

ratio = max(sums)/dims(2);



end

