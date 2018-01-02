function ratio = extract_WidthAtMiddle(glyph)
%ratio = extractWidthAtTop(glyph)

cutoff = 1/10;
map = glyph.binaryPixelMap;

dims = size(map);

numRows = ceil(cutoff*dims(1));

middle = floor((dims(1)-numRows)/2);

sums = sum(map(middle:middle+numRows-1,:),2);

%sums = sum(map(floor(dims(1)/2),:),2);

ratio = mean(sums)/dims(2);



end

