function Bprime = createImageAnalogy(A, Aprime, B)
    numLevels = 7;
    aPyr = gaussianPyramid(A, numLevels);
    aPrimePyr = gaussianPyramid(Aprime, numLevels);
    bPyr = gaussianPyramid(B, numLevels);
    bPrimePyr = cell(numLevels, 1);
    A = featureVectors(aPyr, aPrimePyr);
    s = cell(numLevels, 1);
    for l = numLevels:-1:1
        [bh, bw, ~] = size(bPyr{l})
        s{l} = zeros(bh, bw, 2);
        bPrimePyr{l} = bPyr{l};%zeros(bh, bw, 3);
        a = A{l};
        [al, ah, aw] = size(a);
        a = permute(a, [1 3 2]);
        a = reshape(a, [al, ah*aw]);
        anno = ann(a);
        for i = 3:bh-2
            i
            for j = 3:bw-2
                [i2, j2] = bestMatch(A, anno, bPyr, bPrimePyr, s, l, i, j);
                bPrimePyr{l}(i, j,:) = aPrimePyr{l}(i2, j2,:);
                s{l}(i,j,:) = [i2, j2];
            end
        end
        anno = close(anno);
    end
    Bprime = bPrimePyr{1};
end

