function numberOfHoles = extract_NumberOfHoles(glyph)
%numberOfHoles = extract_NumberOfHoles(glyph)

numberOfHoles = findNumberOfHoles(glyph.binaryPixelMap);

end

