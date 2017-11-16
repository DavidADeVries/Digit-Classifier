function symmetry = extract_TopRightBottomLeftSymmetry(glyph)
% symmetry = extract_TopRightBottomLeftSymmetry(glyph)

map = glyph.binaryPixelMap;

dims = size(map);

slope = dims(1)/dims(2);

topRightHalfCount = 1;
bottomLeftHalfCount = 1;

for r=1:dims(1) % move down rows counting it up
    lineColLeft = floor(r * slope);
    lineColRight = ceil(r*slope);
    
    if lineColLeft < 1
        lineColLeft = 1;
    end
    if lineColRight > dims(2)
        lineColRight = dims(2);
    end
    
    bottomLeftVals = map(r, 1:lineColRight);
    topRightVals = map(r, lineColLeft:end);    
    
    topRightHalfCount = topRightHalfCount + sum(topRightVals);
    bottomLeftHalfCount = bottomLeftHalfCount + sum(bottomLeftVals);
end

symmetry = topRightHalfCount / prod(dims);


end

