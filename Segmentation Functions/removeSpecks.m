function glyphs = removeSpecks(glyphs, averageGlyphSize)
%glyphs = removeSpecks(glyphs, averageGlyphSize)

deleteIndices = [];

cutoff = averageGlyphSize / 10;

for i=1:length(glyphs)
    if sum(sum(glyphs{i}.binaryPixelMap)) < cutoff % must be a speck!
        deleteIndices = [deleteIndices, i];
    end
end

glyphs(deleteIndices) = [];

end

