function symmetry = extract_TopLeftBottomRightSymmetry(glyph)
% symmetry = extract_HorizontalSymmetry(glyph)

glyph.binaryPixelMap = fliplr(glyph.binaryPixelMap);

symmetry = extract_TopRightBottomLeftSymmetry(glyph);

end

