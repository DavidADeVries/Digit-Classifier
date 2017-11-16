function tableOut = getTableForGlyphs(glyphs)
%table = getTableForGlyphs(allGlyphs)

numGlyphs = length(glyphs);

className = cell(numGlyphs,1);

blacknessRatio = zeros(numGlyphs,1);
aspectRatio = zeros(numGlyphs,1);

numberOfHoles = zeros(numGlyphs,1);
holesAreaRatio = zeros(numGlyphs,1);
holesVerticalSymmetry = zeros(numGlyphs,1);

holesAreaTop = zeros(numGlyphs,1);
holesAreaBottom = zeros(numGlyphs,1);

verticalSymmetry = zeros(numGlyphs,1); 
horizontalSymmetry = zeros(numGlyphs,1); 
topRightBottomLeftSymmetry = zeros(numGlyphs,1); 
topLeftBottomRightSymmetry = zeros(numGlyphs,1);


verticalSymmetry2 = zeros(numGlyphs,1);

maximumWidthLocation = zeros(numGlyphs,1);
maximumWidthLocation2 = zeros(numGlyphs,1);

maximumHeightLocation = zeros(numGlyphs,1);
maximumHeightLocation2 = zeros(numGlyphs,1);

maximumWidthSymmetry = zeros(numGlyphs,1);
maximumHeightSymmetry = zeros(numGlyphs,1);

widthAtTop = zeros(numGlyphs,1);
widthAtMiddle = zeros(numGlyphs,1);
widthAtBottom = zeros(numGlyphs,1);

leftSideContourSwitches = zeros(numGlyphs,1);
rightSideContourSwitches = zeros(numGlyphs,1);

leftSideContourMagnitude = zeros(numGlyphs,1);
rightSideContourMagnitude = zeros(numGlyphs,1);

leftSideMaxDepthLocation = zeros(numGlyphs,1);
rightSideMaxDepthLocation = zeros(numGlyphs,1);

% 
% quad_1v2 = zeros(numGlyphs,1);
% quad_1v3 = zeros(numGlyphs,1);
% quad_1v4 = zeros(numGlyphs,1);
% quad_2v3 = zeros(numGlyphs,1);
% quad_2v4 = zeros(numGlyphs,1);
% quad_3v4 = zeros(numGlyphs,1);
% quad_12v34 = zeros(numGlyphs,1);
% quad_13v24 = zeros(numGlyphs,1);
% quad_14v23 = zeros(numGlyphs,1);
% quad_1v234 = zeros(numGlyphs,1);
% quad_2v134 = zeros(numGlyphs,1);
% quad_3v124 = zeros(numGlyphs,1);
% quad_4v123 = zeros(numGlyphs,1);

for i=1:numGlyphs
    glyph = glyphs{i};
    
%     className{i} = glyph.trueClass.displayString;
    
    blacknessRatio(i) = glyph.blacknessRatio;
    aspectRatio(i) = glyph.aspectRatio;
    numberOfHoles(i) = glyph.numberOfHoles;
%     holesAreaRatio(i) = glyph.holesAreaRatio;
%     holesVerticalSymmetry(i) = glyph.holesVerticalSymmetry;
%     
%     holesAreaTop(i) = glyph.holesAreaTop;
%     holesAreaBottom(i) = glyph.holesAreaBottom;  
    
    verticalSymmetry(i) = glyph.verticalSymmetry;
%     horizontalSymmetry(i) = glyph.horizontalSymmetry;
%     topRightBottomLeftSymmetry(i) = glyph.topRightBottomLeftSymmetry;
%     topLeftBottomRightSymmetry(i) = glyph.topLeftBottomRightSymmetry;
%     
%     verticalSymmetry2(i) = glyph.verticalSymmetry2;
    
%     maximumWidthLocation(i) = glyph.maximumWidthLocation;
%     maximumWidthLocation2(i) = glyph.maximumWidthLocation2;
%     
%     maximumHeightLocation(i) = glyph.maximumHeightLocation;
%     maximumHeightLocation2(i) = glyph.maximumHeightLocation2;
%     
%     maximumWidthSymmetry(i) = glyph.maximumWidthSymmetry;
%     maximumHeightSymmetry(i) = glyph.maximumHeightSymmetry;
%     
%     widthAtTop(i) = glyph.widthAtTop;
    widthAtMiddle(i) = glyph.widthAtMiddle;
%     widthAtBottom(i) = glyph.widthAtBottom;
%     
%     leftSideContourSwitches(i) = glyph.leftSideContourSwitches;
%     rightSideContourSwitches(i) = glyph.rightSideContourSwitches;
% 
%     leftSideContourMagnitude(i) = glyph.leftSideContourMagnitude;
%     rightSideContourMagnitude(i) = glyph.rightSideContourMagnitude;
%     
%     leftSideMaxDepthLocation(i) = glyph.leftSideMaxDepthLocation;
%     rightSideMaxDepthLocation(i) = glyph.rightSideMaxDepthLocation;
    
%     quad_1v2(i) = glyph.quad_1v2;
%     quad_1v3(i) = glyph.quad_1v3;
%     quad_1v4(i) = glyph.quad_1v4;
%     quad_2v3(i) = glyph.quad_2v3;
%     quad_2v4(i) = glyph.quad_2v4;
%     quad_3v4(i) = glyph.quad_3v4;
%     quad_12v34(i) = glyph.quad_12v34;
%     quad_13v24(i) = glyph.quad_13v24;
%     quad_14v23(i) = glyph.quad_14v23;
%     quad_1v234(i) = glyph.quad_1v234;
%     quad_2v134(i) = glyph.quad_2v134;
%     quad_3v124(i) = glyph.quad_3v124;
%     quad_4v123(i) = glyph.quad_4v123;
    
end

% tableOut = table(className,...
%     blacknessRatio, aspectRatio, numberOfHoles, holesAreaRatio, holesVerticalSymmetry, holesAreaTop, holesAreaBottom,...
%     verticalSymmetry, horizontalSymmetry, topRightBottomLeftSymmetry, topLeftBottomRightSymmetry,...
%     verticalSymmetry2, maximumWidthLocation, maximumWidthLocation2, maximumHeightLocation, maximumHeightLocation2, maximumWidthSymmetry, maximumHeightSymmetry,...
%     widthAtTop, widthAtMiddle, widthAtBottom,...
%     leftSideContourSwitches, rightSideContourSwitches, leftSideContourMagnitude, rightSideContourMagnitude, leftSideMaxDepthLocation, rightSideMaxDepthLocation);

tableOut = table(blacknessRatio, aspectRatio, numberOfHoles, verticalSymmetry, widthAtMiddle);
    
%     quad_1v2, quad_1v3, quad_1v4, quad_2v3, quad_2v4, quad_3v4, quad_12v34, quad_13v24, quad_14v23, quad_1v234, quad_2v134, quad_3v124, quad_4v123);

end

