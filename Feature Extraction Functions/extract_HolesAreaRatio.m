function holesAreaRatio = extract_HolesAreaRatio(glyph)
%numberOfHoles = extract_NumberOfHoles(glyph)

dims = size(glyph.binaryPixelMap);

% pad with false so any "holes" touching edge will become one single region
paddedMap = false & zeros(dims+2);

paddedMap(2:end-1,2:end-1) = glyph.binaryPixelMap;

[glyphs, ~] = extractGlyphsWithAreaFilling_4con(~paddedMap); % invert padded map to get non-inked holes

glyphs(1) = []; % this is always the boundary "hole"

holesArea = 0;

for i=1:length(glyphs)
    holesArea = holesArea + glyph.getInkedArea();
end

holesAreaRatio = holesArea ./ prod(dims);

end

