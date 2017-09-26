function ratio = extract_HolesAreaRatioVerticalSymmetry(glyph)
%ratio = extract_HolesAreaRatioVerticalSymmetry(glyph)

binaryPixelMap = glyph.binaryPixelMap;

dims = size(binaryPixelMap);

% pad with false so any "holes" touching edge will become one single region
paddedMap = false & zeros(dims+2);

paddedMap(2:end-1,2:end-1) = binaryPixelMap;

[glyphs, ~] = extractGlyphsWithAreaFilling_4con(~paddedMap); % invert padded map to get non-inked holes

borderMask = glyphs{1}.binaryPixelMap;
borderMask = borderMask(2:end-1,2:end-1);

binaryPixelMap(borderMask) = false;

h = dims(1);

topHalf_TopY = 1;
topHalf_BotY = ceil(h/2);

botHalf_TopY = floor(h/2) + 1;
botHalf_BotY = h;

topHalf = binaryPixelMap(topHalf_TopY:topHalf_BotY,:);
botHalf = binaryPixelMap(botHalf_TopY:botHalf_BotY,:);

ratio = sum(sum(topHalf)) / sum(sum(botHalf));


end

