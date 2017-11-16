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
        
        leftSideContourVariance       
        rightSideContourVariance
    end
    
    methods(Static)
    end
    
    methods                  
        function obj = Features()
        end
    end
    
end