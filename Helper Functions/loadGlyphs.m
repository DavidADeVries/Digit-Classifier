function allGlyphs = loadGlyphs(path, type, size, italics, bold, multiFont)
%trainingGlyphs = loadGlyphs(path, type, size, italics, bold)

types = {'0','1','2','3','4','5','6','7','8','9'};

allGlyphs = {};

if size
    sizeTypes = [true false];
else
    sizeTypes = false;
end

if italics
    italicsTypes = [true false];
else
    italicsTypes = false;
end

if bold
    boldTypes = [true false];
else
    boldTypes = false;
end

if multiFont
    multiFontTypes = [true false];
else
    multiFontTypes = false;
end


for sizeIndex=1:length(sizeTypes)
    if sizeTypes(sizeIndex)
        sizeChar = 'S';
    else
        sizeChar = '_';
    end
    
    for italicsIndex=1:length(italicsTypes)
        if italicsTypes(italicsIndex)
            italicsChar = 'I';
        else
            italicsChar = '_';
        end
        
        for boldIndex=1:length(boldTypes)
            if boldTypes(boldIndex)
                boldChar = 'B';
            else
                boldChar = '_';
            end
            
            for multiIndex=1:length(multiFontTypes)
                if multiFontTypes(multiIndex)
                    multiFolder = '/Multiple Fonts Glyphs/';
                else
                    multiFolder = '/Single Font Glyphs/';
                end
                
                loadString = [' [', sizeChar, boldChar, italicsChar, '].mat'];
                
                for i=1:length(types)
                    filename = [types{i}, ' - ', type, loadString];
                    
                    data = load([path, multiFolder, filename]);
                    glyphs = data.glyphs;
                    
                    allGlyphs = [allGlyphs; glyphs];
                end
            end
        end
    end
end

end

