function Bprime = createImageAnalogy(A, Aprime, B)
    numLevels = 5;
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

