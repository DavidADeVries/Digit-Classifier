function ratio = extract_RightSideContourMagnitude(glyph)
%numSwitches = extract_LeftSideContourSwitches(glyph)

map = glyph.binaryPixelMap;

dims = size(map);

cols = 1:dims(2);    
cols = cols(map(1,:));
    
firstDepth = cols(end);

cols = 1:dims(2);    
cols = cols(map(2,:));

secondDepth = cols(end);

startDepth = firstDepth;
lastDepth = secondDepth;

currentDirection = (secondDepth - firstDepth) / abs(secondDepth - firstDepth);

magnitude = 0;

for r=3:dims(1)
    cols = 1:dims(2);
    
    cols = cols(map(r,:));
    
    depth = cols(end);
    
    direction = depth - lastDepth;
    
    if currentDirection * direction < 0
        currentDirection = direction / abs(direction);
        
        magnitude = magnitude + abs(startDepth - depth);
        startDepth = depth;
    end
    
    lastDepth = depth;
end

ratio = magnitude / dims(2);

end

