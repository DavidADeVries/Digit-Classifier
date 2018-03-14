function ratio = extract_WidthAtTopAndBottomRatio(glyph)
%ratio = extractWidthAtTop(glyph)

cutoff = 1/10;
map = glyph.binaryPixelMap;

dims = size(map);

numRows = ceil(cutoff*dims(1));

sums = sum(map(end-numRows+1:end,:),2);
%sums = sum(map(end,:),2);

botRatio = mean(sums)/dims(2);

sums = sum(map(1:numRows,:),2);
%sums = sum(map(1,:),2);

topRatio = mean(sums)/dims(2);

ratio = topRatio ./ botRatio;

end

