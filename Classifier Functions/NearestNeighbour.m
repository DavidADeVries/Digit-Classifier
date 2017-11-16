classdef NearestNeighbour
    %NEARESTNEIGHBOUR 
    
    properties
        trainingSetFeatureVectors
        trainingSetTrueClasses
        
        k
    end
    
    methods
        function classifier = NearestNeighbour(glyphs, k, featureList)
            numFeatures = length(featureList);
            numGlyphs = length(glyphs);
            
            featureVectors = zeros(numGlyphs, numFeatures);
            trueClasses = cell(numGlyphs,1);
            
            for i=1:numGlyphs
                featureVectors(i,:) = glyphs{i}.getFeatureVector(featureList);
                trueClasses{i} = glyphs{i}.trueClass;
            end
            
            classifier.trainingSetFeatureVectors = featureVectors;
            classifier.trainingSetTrueClasses = trueClasses;
            classifier.k = k;
        end
        
        function glyphs = classifyGlyphs(classifier, glyphs, featureList)
            numGlyphs = length(glyphs);
            
            for i=1:numGlyphs
                vector = glyphs{i}.getFeatureVector(featureList);
                
                % calculate distance from this point to the all the
                % training points
                distances = (classifier.trainingSetFeatureVectors - vector);
                distances = distances .^ 2;
                distances = sum(distances, 2); % sum across rows
                distances = distances .^ 0.5;
                
                classes = getKNearestNeighbourClasses(distances, classifier.k, classifier.trainingSetTrueClasses);
                classification = getClassificationFromNearestNeighbours(classes);
                
                glyphs{i}.foundClass = classification;
            end
        end
    end
    
end

% **HELPER FUNCTIONS**
function classes = getKNearestNeighbourClasses(distances, k, trainingSetTrueClasses)
    classes = [];
    
    for i=1:k
        [~, index] = min(distances);
        
        classes = [classes, trainingSetTrueClasses{index}];
        
        % delete entries, so if needed next min can be found
        distances(index) = [];
        trainingSetTrueClasses(index) = [];
    end
end

function classification = getClassificationFromNearestNeighbours(neighbours)
    k = length(neighbours);
    
    if k == 1
        classification = neighbours(1);
    else        
        classes = enumeration('Classes');
        votes = zeros(k,1);
        
        for i=1:k
            votes(i) = sum(neighbours == classes(i));
        end
        
        [sortedVotes, sortIndex] = sort(votes);
        cutoff = k/2;
        
        if sortedVotes(1) == sortedVotes(2) || sortedVotes <= cutoff
            classification = Classes.reject; % reject if there's a tie, or not a majority vote
        else
            classification = neighbours(sortIndex(1));
        end
    end 
end