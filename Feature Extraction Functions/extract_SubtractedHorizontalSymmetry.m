function verticalSymmetry = extract_SubtractedHorizontalSymmetry(glyph)
% verticalSymmetry = extract_VerticalSymmetry(glyph)

map = glyph.binaryPixelMap;

dims = size(map);

w = dims(2);

leftHalf_LeftX = 1;
leftHalf_RightX = ceil(w/2);

rightHalf_LeftX = floor(w/2) + 1;
rightHalf_RightX = w;

leftHalf = map(:,leftHalf_LeftX:leftHalf_RightX);
rightHalf = map(:,rightHalf_LeftX:rightHalf_RightX);

rightHalf = imrotate(rightHalf,180);

equalMap = rightHalf == leftHalf;


verticalSymmetry = sum(sum(equalMap)) / prod(size(leftHalf));


end

