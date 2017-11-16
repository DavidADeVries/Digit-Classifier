function [percentCorrect, labelledConfusionMatrix] = analyzeClassification(glyphs, classes)
%[percentCorrect, confusionMatrix] = analyzeClassification(glyphs)

numClasses = length(classes);

confusionMatrix = zeros(numClasses);

index = 1:numClasses;

for i=1:length(glyphs)
    glyph = glyphs{i};
    
    r = index(classes == glyph.trueClass);
    c = index(classes == glyph.foundClass);
    
    confusionMatrix(r,c) = confusionMatrix(r,c) + 1;
end

labelledConfusionMatrix = zeros(numClasses+1);

labelledConfusionMatrix(1,1) = NaN;
labelledConfusionMatrix(2:end,1) = 0:9;
labelledConfusionMatrix(1,2:end) = 0:9;
labelledConfusionMatrix(2:end,2:end) = confusionMatrix;

numCorrect = sum(diag(confusionMatrix));

percentCorrect = numCorrect ./ length(glyphs);

end

