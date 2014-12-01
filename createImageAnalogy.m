function Bprime = createImageAnalogy(A, Aprime, B)
    numLevels = 1;
    aPyr = gaussianPyramid(A, numLevels);
    aPrimePyr = gaussianPyramid(Aprime, numLevels);
    bPyr = gaussianPyramid(B, numLevels);
    bPrimePyr = cell(numLevels, 1);
    s = cell(numLevels, 1);
    for l = numLevels:-1:1
        [bh, bw, ~] = size(bPyr{l});
        s{l} = zeros(bh, bw, 2);
        bPrimePyr{l} = zeros(bh, bw, 3);
        for i = 3:bh-2
            i
            for j = 3:bw-2
                [i2, j2] = bestMatch(aPyr, aPrimePyr, bPyr, bPrimePyr, s, l, i, j);
                bPrimePyr{l}(i, j,:) = aPrimePyr{l}(i2, j2,:);
                s{l}(i,j,:) = [i2, j2];
            end
        end
    end
    Bprime = bPrimePyr{i};
end

