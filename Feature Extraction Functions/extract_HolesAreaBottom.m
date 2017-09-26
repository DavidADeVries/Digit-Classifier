function holesAreaRatio = extract_HolesAreaBottom(glyph)
%numberOfHoles = extract_NumberOfHoles(glyph)

boundary = 3/5;

dims = size(glyph.binaryPixelMap);

numRows = ceil(boundary*dims(1));

binaryMap = glyph.binaryPixelMap(end-numRows+1:end, :);

dims = size(binaryMap);

% pad with false so any "holes" touching edge will become one single region
paddedMap = false & zeros(dims+2);

paddedMap(2:end-1,2:end-1) = binaryMap;

[glyphs, ~] = extractGlyphsWithAreaFilling_4con(~paddedMap); % invert padded map to get non-inked holes

glyphs(1) = []; % this is always the boundary "hole"

holesArea = 0;

for i=1:length(glyphs)
    holesArea = holesArea + glyph.getInkedArea();
end

holesAreaRatio = holesArea ./ prod(dims);

end

