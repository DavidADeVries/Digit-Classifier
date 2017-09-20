function blacknessRatio = extract_BlacknessRatio(glyph)
%blacknessRatio = extract_BlacknessRatio(glyph)

totalNumPx = numel(glyph.binaryPixelMap);

numInkedPx = sum(sum(glyph.binaryPixelMap));

blacknessRatio = numInkedPx ./ totalNumPx;

end

