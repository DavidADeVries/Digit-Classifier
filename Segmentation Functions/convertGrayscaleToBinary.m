function binaryImage = convertGrayscaleToBinary(rawImage)
%binaryImage = convertGrayscaleToBinary(rawImage)

maxValue = max(max(rawImage));
minValue = min(min(rawImage));

borderVals = [...
    rawImage(1,:),...
    rawImage(end,:),...
    rawImage(:,1)',...
    rawImage(:,end)'];

meanBorderVal = mean(borderVals);

% we assume the mean border val to be the intensity of the page, not ink

maxDiff = maxValue - meanBorderVal;
minDiff = meanBorderVal - minValue;

if maxDiff > minDiff % lower values are the page
    cutoff = mean([maxValue, meanBorderVal]);
    binaryImage = (rawImage >= cutoff);
else % higher values are the page
    cutoff = mean([minValue, meanBorderVal]);    
    binaryImage = (rawImage <= cutoff);
end

