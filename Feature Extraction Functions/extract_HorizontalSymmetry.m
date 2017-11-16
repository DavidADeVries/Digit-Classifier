function horizontalSymmetry = extract_HorizontalSymmetry(glyph)
% horizontalSymmetry = extract_HorizontalSymmetry(glyph)

map = glyph.binaryPixelMap;

dims = size(map);

w = dims(1);

leftHalf_LeftX = 1;
leftHalf_RightX = ceil(w/2);

rightHalf_LeftX = floor(w/2) + 1;
rightHalf_RightX = w;

leftHalf = map(leftHalf_LeftX:leftHalf_RightX,:);
rightHalf = map(rightHalf_LeftX:rightHalf_RightX,:);

horizontalSymmetry = sum(sum(leftHalf)) / prod(dims);


end

