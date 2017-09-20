function numberOfHoles = extract_NumberOfHoles(glyph)
%numberOfHoles = extract_NumberOfHoles(glyph)

dims = size(glyph.binaryPixelMap);

% pad with false so any "holes" touching edge will become one single region
paddedMap = false & zeros(dims+2);

paddedMap(2:end-1,2:end-1) = glyph.binaryPixelMap;

[glyphs, ~] = extractGlyphsWithAreaFilling_4con(~paddedMap); % invert padded map to get non-inked holes

numberOfHoles = length(glyphs) - 1; % minus 1 to remove outer border.

end

