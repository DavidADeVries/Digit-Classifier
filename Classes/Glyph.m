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
        
        subtractedVerticalSymmetry
        subtractedHorizontalSymmetry
        
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
        
        topBottomWidthRatio
        
        leftSideContourVariance
        rightSideContourVariance
        totalContourVariance
        contourVarianceSymmetry
        
        perimeterRatio

        
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
        
        function vector = getFeatureVector(glyph, featureList)
            numFeatures = length(featureList);
            
            vector = zeros(1,numFeatures);
            
            for i=1:numFeatures
                vector(i) = glyph.(char(featureList(i)));
            end
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
            
            glyph.subtractedVerticalSymmetry = extract_SubtractedVerticalSymmetry(glyph);
            glyph.subtractedHorizontalSymmetry = extract_SubtractedHorizontalSymmetry(glyph);
            
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
            
            glyph.topBottomWidthRatio = extract_TopBottomWidthRatio(glyph);
            
            glyph.leftSideContourVariance = extract_LeftSideContourVariance(glyph);
        	glyph.rightSideContourVariance = extract_RightSideContourVariance(glyph);
            glyph.totalContourVariance = extract_TotalContourVariance(glyph); 
            glyph.contourVarianceSymmetry = extract_ContourVarianceSymmetry(glyph);

            glyph.perimeterRatio = extract_PerimeterRatio(glyph);
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

