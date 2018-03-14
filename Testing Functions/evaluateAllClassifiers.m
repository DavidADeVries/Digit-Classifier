function [] = evaluateAllClassifiers()
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

k = 1;
evaluateFinal = true;

confusionMatrices = cell(16,1);

excelOutput = cell(17, 5);

excelOutput{1,1} = 'Size';
excelOutput{1,2} = 'Italic';
excelOutput{1,3} = 'Bold';
excelOutput{1,4} = 'Multiple Fonts';
excelOutput{1,5} = 'P Correct';

for size=0:1
    sizeTag = num2str(size);
    
    for italic=0:1
        italicTag = num2str(italic);
        
        for bold=0:1
            boldTag = num2str(bold);
            
            for multipleFonts=0:1
                multipleFontsTag = num2str(multipleFonts);
                
                [pCorrect, confusionMatrix] = evaluateClassifier(k, size, italic, bold, multipleFonts, evaluateFinal);
                                
                index = size*8 + italic*4 + bold*2 + multipleFonts + 1;
                
                excelOutput{1+index,1} = sizeTag;
                excelOutput{1+index,2} = italicTag;
                excelOutput{1+index,3} = boldTag;
                excelOutput{1+index,4} = multipleFontsTag;
                excelOutput{1+index,5} = pCorrect;
                
                confusionMatrices{index} = confusionMatrix;
                
                disp(index);
            end
        end
    end
end

path = 'C:\Users\David\OneDrive\Master''s Year 1\CSIC 859\Classifer Project\Results\Final Results';

xlswrite([path, '.xls'], excelOutput);

save([path, '.mat'], 'confusionMatrices');

end

