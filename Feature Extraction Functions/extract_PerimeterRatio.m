function ratio = extract_PerimeterRatio(glyph)
%ratio = extractWidthAtTop(glyph)

map = glyph.binaryPixelMap;

dims = size(map);

padMap = zeros(dims+2);

padMap(2:end-1,2:end-1) = map;

numExternalPixels = 0;

for r=2:dims(1)-1
    for c=2:dims(2)-1
        if padMap(r,c)
            s = sum(sum(padMap(r-1:r+1,c-1:c+1)));
            
            if s <= 5
                numExternalPixels = numExternalPixels + 1;
            end
        end
    end
end

ratio = numExternalPixels/sum(sum(map));



end

