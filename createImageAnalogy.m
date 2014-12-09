function Bprime = createImageAnalogy(A, Aprime, B)
% completes the analogy A is to Aprime and B is to Bprime, and returns
% Bprime.
    numLevels = 5;
    aPyr = gaussianPyramid(A, numLevels);
    aPrimePyr = gaussianPyramid(Aprime, numLevels);
    bPyr = gaussianPyramid(B, numLevels);
    bPrimePyr = cell(numLevels, 1);
    % compute feature vectors for each pixel in A
    A = featureVectors(aPyr, aPrimePyr);
    % stores the Aprime index used for each Bprime pixel
    s = cell(numLevels, 1);
    for l = numLevels:-1:1
        [bh, bw, ~] = size(bPyr{l})
        s{l} = zeros(bh, bw, 2);
        % initialize Bprime to B for reasonable edge behavior
        bPrimePyr{l} = bPyr{l};%zeros(bh, bw, 3);
        % create the approximate nearest neighbor search structure
        a = A{l};
        [al, ah, aw] = size(a);
        a = permute(a, [1 3 2]);
        a = reshape(a, [al, ah*aw]);
        anno = ann(a);
        for i = 3:bh-2
            i
            for j = 3:bw-2
                q = bestMatch(a, anno, bPyr, bPrimePyr, s, l, i, j, ah, aw);
                [j2, i2] = ind2sub([aw,ah], q);
                bPrimePyr{l}(i, j,:) = aPrimePyr{l}(i2, j2,:);
                s{l}(i,j,:) = [i2, j2];
            end
        end
        anno = close(anno);
    end
    Bprime = bPrimePyr{1};
end

