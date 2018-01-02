function verticalSymmetry = extract_SubtractedVerticalSymmetry(glyph)
% verticalSymmetry = extract_VerticalSymmetry(glyph)

map = glyph.binaryPixelMap;

dims = size(map);

h = dims(1);

topHalf_TopY = 1;
topHalf_BotY = ceil(h/2);

botHalf_TopY = floor(h/2) + 1;
botHalf_BotY = h;

topHalf = map(topHalf_TopY:topHalf_BotY,:);
botHalf = map(botHalf_TopY:botHalf_BotY,:);

botHalf = imrotate(botHalf,180);

equalMap = botHalf == topHalf;


verticalSymmetry = sum(sum(equalMap)) / prod(size(topHalf));


end

