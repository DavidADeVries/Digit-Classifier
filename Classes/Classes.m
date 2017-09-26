classdef Classes
    % Classes
    
    properties
        displayString
        displayColour
        displayMarkerType
    end
    
    enumeration  
        zero(   '0', [0 0 0], '*')
        one(    '1', [1 0 0], '*')
        two(    '2', [0 1 0], '*')
        three(  '3', [0 0 1], '*')
        four(   '4', [1 1 0], '*')
        five(   '5', [1 0 1], '*');
        six(    '6', [0 1 1], '*');
        seven(  '7', [0 0 0], 'o');
        eight(  '8', [1 0 0], 'o');
        nine(   '9', [0 1 0], 'o')
        
        reject('Reject', [0 0 1], 'o')
    end
    
    methods(Static)
    end
    
    methods                  
        function obj = Classes(displayString, rgbVector, markerSymbol)
            obj.displayString = displayString;
            obj.displayColour = rgbVector;
            obj.displayMarkerType = markerSymbol;
        end
    end
    
end