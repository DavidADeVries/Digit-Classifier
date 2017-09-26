classdef Glyph
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        % glyph representation
        binaryPixelMap % T: inked/F: not-inked
        imageCoords % [x y w h]
        
        % glyph classification
        trueClass
        foundClass
        
        % features (calculated once and stored for efficiency)
        blacknessRatio % num inked px / num total px
        aspectRatio % width / height
        
        numberOfHoles % integer
        holesAreaRatio
        holesVerticalSymmetry
        
        holesAreaTop
        holesAreaBottom        
        
        verticalSymmetry % num inked px top half / num inked px bottom half
        horizontalSymmetry % num inked px left half / num inked right half
        topRightBottomLeftSymmetry % num inked px top right half / num inked px bottom left half
        topLeftBottomRightSymmetry % num inked px top left half / num inked px bottom right half
        
        verticalSymmetry2
        
        maximumWidthLocation
        maximumWidthLocation2
        
        maximumHeightLocation
        maximumHeightLocation2

        maximumWidthSymmetry
        maximumHeightSymmetry
        
        widthAtTop
        widthAtMiddle
        widthAtBottom
        
        leftSideContourSwitches
        rightSideContourSwitches

        leftSideContourMagnitude
        rightSideContourMagnitude
        
        leftSideMaxDepthLocation
        rightSideMaxDepthLocation

        
%         quad_1v2
%         quad_1v3
%         quad_1v4
%         quad_2v3
%         quad_2v4
%         quad_3v4
%         quad_12v34
%         quad_13v24
%         quad_14v23
%         quad_1v234
%         quad_2v134
%         quad_3v124
%         quad_4v123
    end
    
    methods
        function glyph = Glyph(binaryPixelMap, imageCoords)
            glyph.binaryPixelMap = binaryPixelMap;
            glyph.imageCoords = imageCoords;
        end
        
        function glyph = extractAndSetFeatures(glyph)
            % calculate and set features
            glyph.blacknessRatio =  extract_BlacknessRatio(glyph);
            glyph.aspectRatio =     extract_AspectRatio(glyph);
            
            glyph.numberOfHoles =   extract_NumberOfHoles(glyph);
            glyph.holesAreaRatio =  extract_HolesAreaRatio(glyph);
            glyph.holesVerticalSymmetry = extract_HolesAreaRatioVerticalSymmetry(glyph);
            
            glyph.holesAreaTop = extract_HolesAreaTop(glyph);
            glyph.holesAreaBottom = extract_HolesAreaBottom(glyph);            
            
            glyph.verticalSymmetry = extract_VerticalSymmetry(glyph);
            glyph.horizontalSymmetry = extract_HorizontalSymmetry(glyph);
            glyph.topRightBottomLeftSymmetry = extract_TopRightBottomLeftSymmetry(glyph);
            glyph.topLeftBottomRightSymmetry = extract_TopLeftBottomRightSymmetry(glyph);
            
            glyph.verticalSymmetry2 = extract_VerticalSymmetry2(glyph);
            
            glyph.maximumWidthLocation = extract_MaximumWidthLocation(glyph);
            glyph.maximumWidthLocation2 = extract_MaximumWidthLocation2(glyph);
            
            glyph.maximumHeightLocation = extract_MaximumHeightLocation(glyph);
            glyph.maximumHeightLocation2 = extract_MaximumHeightLocation2(glyph);
    
            glyph.maximumWidthSymmetry = extract_MaximumWidthSymmetry(glyph);
            glyph.maximumHeightSymmetry = extract_MaximumHeightSymmetry(glyph);
            
            glyph.widthAtTop = extract_WidthAtTop(glyph);
            glyph.widthAtMiddle = extract_WidthAtMiddle(glyph);
            glyph.widthAtBottom = extract_WidthAtBottom(glyph);
            
            glyph.leftSideContourSwitches = extract_LeftSideContourSwitches(glyph);
            glyph.rightSideContourSwitches = extract_RightSideContourSwitches(glyph);

            glyph.leftSideContourMagnitude = extract_LeftSideContourMagnitude(glyph);
            glyph.rightSideContourMagnitude = extract_RightSideContourMagnitude(glyph);
            
            glyph.leftSideMaxDepthLocation = extract_LeftSideMaxDepthLocation(glyph);
            glyph.rightSideMaxDepthLocation = extract_RightSideMaxDepthLocation(glyph);
            
%             [q1, q2, q3, q4] = extract_QuadrantSums(glyph);
%             
%             if q1 == 0
%                 q1 = 1;
%             end
%             if q2 == 0
%                 q2 = 1;
%             end
%             if q3 == 0
%                 q3 = 1;
%             end
%             if q4 == 0
%                 q4 = 1;
%             end
%             
%             glyph.quad_1v2 = q1/q2;
%             glyph.quad_1v3 = q1/q3;
%             glyph.quad_1v4 = q1/q4;
%             glyph.quad_2v3 = q2/q3;
%             glyph.quad_2v4 = q2/q4;
%             glyph.quad_3v4 = q3/q4;
%             glyph.quad_12v34 = (q1+q2)/(q3+q4);
%             glyph.quad_13v24 = (q1+q3)/(q2+q4);
%             glyph.quad_14v23 = (q1+q4)/(q2+q3);
%             glyph.quad_1v234 = q1/(q2+q3+q4);
%             glyph.quad_2v134 = q2/(q1+q3+q4);
%             glyph.quad_3v124 = q3/(q2+q1+q4);
%             glyph.quad_4v123 = q4/(q2+q3+q1);
            
        end
        
        function glyph = setTrueClass(glyph, class)
            glyph.trueClass = class;
        end
        
        function [] = displayGlyph(glyph, figNum)
            figure(figNum);
            imshow(glyph.binaryPixelMap,[],'InitialMagnification','fit');
        end
        
        function bool = isCorrectlyClassified(glyph)
            bool = (glyph.trueClass == glyph.foundClass);
        end
            
        % ** FEATURE EXTRACTION HELPERS**
        function height = getBoundingBoxHeight(glyph)
            dims = size(glyph.binaryPixelMap);
            
            height = dims(1);
        end
        
        function width = getBoundingBoxWidth(glyph)
            dims = size(glyph.binaryPixelMap);
            
            width = dims(2);
        end
        
        function area = getInkedArea(glyph)
            area = sum(sum(glyph.binaryPixelMap));
        end
    end
    
end

