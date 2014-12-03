function vecs = featureVectors(pyr, primePyr)
    numLevels = size(pyr,1);
    vecs = cell(numLevels, 1);
    for l = numLevels:-1:1
        [h, w, ~] = size(pyr{l});
        if (l == numLevels)
            vecs{l} = zeros(111, h, w);
        else
            vecs{l} = zeros(165, h, w);
        end
        for i = 3:h-2
            for j = 3:w-2
                vecs{l}(:, i, j) = featureConcat(pyr, primePyr, l, i, j);
            end
        end
    end
end

