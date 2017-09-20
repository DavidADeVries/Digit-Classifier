classdef Classes
    % Classes
    
    properties
        displayString
        displayColour
    end
    
    enumeration  
        zero(   '0', [0 0 0])
        one(    '1', [1 0 0])
        two(    '2', [0 1 0])
        three(  '3', [0 0 1])
        four(   '4', [1 1 0])
        five(   '5', [1 0 1]);
        six(    '6', [0 1 1]);
        seven(  '7', [0.75 0.25 0.25]);
        eight(  '8', [0.25 0.75 0.25]);
        nine(   '9', [0.25 0.25 0.75])
        
        reject('Reject', [0.9 0.9 0.9])
    end
    
    methods(Static)
    end
    
    methods                  
        function obj = Classes(displayString, rgbVector)
            obj.displayString = displayString;
            obj.displayColour = rgbVector;
        end
    end
    
end