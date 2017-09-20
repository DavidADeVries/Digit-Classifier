function [] = plotFeatures3D(glyphs, figNum, feature1, feature2, feature3)
%[] = plotFeatures3D(glyphList, figNum, feature1, feature2, feature3)

numGlyphs = length(glyphs);

classes = enumeration('Classes');
numClasses = length(classes);
% x = zeros(numGlyphs,1);
% y = zeros(numGlyphs,1);
% z = zeros(numGlyphs,1);
% 
% colours = zeros(numGlyphs,3);
% sizes = 10*ones(numGlyphs,1);
% 
% displayNames = cell(numGlyphs,1);

size = 20;
markerType = '*';

f = figure(figNum);
cla(f);
figure(figNum);
hold('on');

for c=1:numClasses
    class = classes(c);
    
    x = [];
    y = [];
    z = [];
    
    for i=1:numGlyphs
        glyph = glyphs{i};
        
        if glyph.trueClass == class
            x = [x, glyph.(feature1)];
            y = [y, glyph.(feature2)];
            z = [z, glyph.(feature3)];
        end
    end
           
    if ~isempty(x)
        colour = class.displayColour;
        displayName = class.displayString;
        
        scatter3(x,y,z,size,colour,markerType,'displayname',displayName);
    end
end

xlabel(feature1);
ylabel(feature2);
zlabel(feature3);
legend('show');

end

