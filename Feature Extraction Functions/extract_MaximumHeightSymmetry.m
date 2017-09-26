function ratio = extract_MaximumHeightSymmetry(glyph)
%maxWidthLocation = extract_MaximumHeightLocation(glyph)

map = glyph.binaryPixelMap;

dims = size(map);

w = dims(2);

leftHalf_LeftX = 1;
leftHalf_RightX = ceil(w/2);

rightHalf_LeftX = floor(w/2) + 1;
rightHalf_RightX = w;

leftHalf = map(leftHalf_LeftX:leftHalf_RightX,:);
rightHalf = map(rightHalf_LeftX:rightHalf_RightX,:);

leftHalfMaxHeight = max(sum(leftHalf,1));
rightHalfMaxHeight = max(sum(rightHalf,1));

ratio = leftHalfMaxHeight / rightHalfMaxHeight;



end

