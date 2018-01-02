function ratio = extract_ContourVarianceSymmetry(glyph)
%ratio = extract_RightSideContourVariance(glyph)

leftVar = extract_LeftSideContourVariance(glyph);
rightVar = extract_RightSideContourVariance(glyph);

ratio = abs(leftVar-rightVar); 

end

