function numberOfHoles = findNumberOfHoles(binaryPixelMap)

dims = size(binaryPixelMap);

% pad with false so any "holes" touching edge will become one single region
paddedMap = false & zeros(dims+2);

paddedMap(2:end-1,2:end-1) = binaryPixelMap;

[glyphs, ~] = extractGlyphsWithAreaFilling_4con(~paddedMap); % invert padded map to get non-inked holes

digitGlyphArea = prod(dims);

cutoff = 0.05; % holes must be larger than 5% of the toal glyph area

% toDelete = [];
% 
% glyphs(1) = []; % get rid of outer border glyph
% 
% for i=1:length(glyphs)
%     if sum(sum(glyphs{i}.binaryPixelMap)) / digitGlyphArea < cutoff
%         toDelete = [toDelete, i];
%     end
% end
% 
% glyphs(toDelete) = [];

numberOfHoles = length(glyphs)-1;
end

