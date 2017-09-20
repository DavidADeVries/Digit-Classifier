function tableOut = getTableForGlyphs(glyphs)
%table = getTableForGlyphs(allGlyphs)

numGlyphs = length(glyphs);

className = cell(numGlyphs,1);

blacknessRatio = zeros(numGlyphs,1);
aspectRatio = zeros(numGlyphs,1);

numberOfHoles = zeros(numGlyphs,1);

verticalSymmetry = zeros(numGlyphs,1); 
horizontalSymmetry = zeros(numGlyphs,1); 
topRightBottomLeftSymmetry = zeros(numGlyphs,1); 
topLeftBottomRightSymmetry = zeros(numGlyphs,1);

quad_1v2 = zeros(numGlyphs,1);
quad_1v3 = zeros(numGlyphs,1);
quad_1v4 = zeros(numGlyphs,1);
quad_2v3 = zeros(numGlyphs,1);
quad_2v4 = zeros(numGlyphs,1);
quad_3v4 = zeros(numGlyphs,1);
quad_12v34 = zeros(numGlyphs,1);
quad_13v24 = zeros(numGlyphs,1);
quad_14v23 = zeros(numGlyphs,1);
quad_1v234 = zeros(numGlyphs,1);
quad_2v134 = zeros(numGlyphs,1);
quad_3v124 = zeros(numGlyphs,1);
quad_4v123 = zeros(numGlyphs,1);

for i=1:numGlyphs
    glyph = glyphs{i};
    
    className{i} = glyph.trueClass.displayString;
    
    blacknessRatio(i) = glyph.blacknessRatio;
    aspectRatio(i) = glyph.aspectRatio;
    numberOfHoles(i) = glyph.numberOfHoles;
    verticalSymmetry(i) = glyph.verticalSymmetry;
    horizontalSymmetry(i) = glyph.horizontalSymmetry;
    topRightBottomLeftSymmetry(i) = glyph.topRightBottomLeftSymmetry;
    topLeftBottomRightSymmetry(i) = glyph.topLeftBottomRightSymmetry;
    
    quad_1v2(i) = glyph.quad_1v2;
    quad_1v3(i) = glyph.quad_1v3;
    quad_1v4(i) = glyph.quad_1v4;
    quad_2v3(i) = glyph.quad_2v3;
    quad_2v4(i) = glyph.quad_2v4;
    quad_3v4(i) = glyph.quad_3v4;
    quad_12v34(i) = glyph.quad_12v34;
    quad_13v24(i) = glyph.quad_13v24;
    quad_14v23(i) = glyph.quad_14v23;
    quad_1v234(i) = glyph.quad_1v234;
    quad_2v134(i) = glyph.quad_2v134;
    quad_3v124(i) = glyph.quad_3v124;
    quad_4v123(i) = glyph.quad_4v123;
    
end

tableOut = table(className,...
    blacknessRatio, aspectRatio, numberOfHoles, verticalSymmetry, horizontalSymmetry, topRightBottomLeftSymmetry, topLeftBottomRightSymmetry,...
    quad_1v2, quad_1v3, quad_1v4, quad_2v3, quad_2v4, quad_3v4, quad_12v34, quad_13v24, quad_14v23, quad_1v234, quad_2v134, quad_3v124, quad_4v123);

end

