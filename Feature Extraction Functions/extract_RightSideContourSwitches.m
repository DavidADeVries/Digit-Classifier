function numSwitches = extract_RightSideContourSwitches(glyph)
%numSwitches = extract_LeftSideContourSwitches(glyph)

map = glyph.binaryPixelMap;

dims = size(map);

numSwitches = 0;
currentDirection = +1;
lastDepth = 0;

for r=1:dims(1)
    cols = 1:dims(2);
    
    cols = cols(map(r,:));
    
    depth = cols(end);
    
    direction = depth - lastDepth;
    
    if currentDirection * direction < 0
        currentDirection = direction / abs(direction);
        numSwitches = numSwitches + 1;
    end
    
    lastDepth = depth;
end


end

