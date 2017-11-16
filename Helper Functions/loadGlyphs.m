function allGlyphs = loadGlyphs(path, type, size, italics, bold)
%trainingGlyphs = loadGlyphs(path, type, size, italics, bold)

types = {'0','1','2','3','4','5','6','7','8','9'};

allGlyphs = {};

if size
    sizeChar = 'S';
else
    sizeChar = '_';
end

if italics
    italicsChar = 'I';
else
    italicsChar = '_';
end

if bold
    boldChar = 'B';
else
    boldChar = '_';
end

loadString = [' [', sizeChar, boldChar, italicsChar, '].mat'];

for i=1:length(types)
    filename = [types{i}, ' - ', type, loadString];
    
    data = load([path, filename]);
    glyphs = data.glyphs;
    
    allGlyphs = [allGlyphs; glyphs];
end

end

