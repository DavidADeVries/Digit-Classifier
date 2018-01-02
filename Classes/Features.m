classdef Features
    % Classes
    
    properties
    end
    
    enumeration
        blacknessRatio
        aspectRatio
        
        
        numberOfHoles
        holesAreaRatio
        holesVerticalSymmetry
        
        holesAreaTop
        holesAreaBottom
        
        subtractedVerticalSymmetry
        subtractedHorizontalSymmetry
        
        verticalSymmetry
        horizontalSymmetry
        topRightBottomLeftSymmetry
        topLeftBottomRightSymmetry
        
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
    end
    
    methods(Static)
    end
    
    methods                  
        function obj = Features()
        end
    end
    
end