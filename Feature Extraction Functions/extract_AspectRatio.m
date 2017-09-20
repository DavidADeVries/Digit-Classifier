function aspectRatio = extract_AspectRatio(glyph)
%aspectRatio = extract_AspectRatio(glyph)

dims = size(glyph.binaryPixelMap);

aspectRatio = dims(2) / dims(1);


end

