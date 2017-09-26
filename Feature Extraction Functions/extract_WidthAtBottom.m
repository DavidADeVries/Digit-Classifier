function ratio = extract_WidthAtBottom(glyph)
%ratio = extractWidthAtTop(glyph)

cutoff = 1/10;
map = glyph.binaryPixelMap;

dims = size(map);

numRows = ceil(cutoff*dims(1));

sums = sum(map(end-numRows+1:end,:),2);
%sums = sum(map(end,:),2);

ratio = max(sums)/dims(2);



end

