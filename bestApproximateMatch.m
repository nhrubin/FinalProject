function[iApp, jApp] = bestApproximateMatch(A, B, bPrime, l, i, j)
    bestDist = inf;
    iApp = 0;
    jApp = 0;
    [h, w, ~] = size(A{l});
    curVec = featureConcat(B, bPrime, l, i, j);
    curVec = shiftdim(curVec, -1);
    for i2 = 3:h-2
        for j2 = 3:w-2
            aVec = A{l}(i2,j2,:);
            dist = distVec(curVec, aVec);
            if (dist < bestDist)
                bestDist = dist;
                iApp = i2;
                jApp = j2;
            end
        end
    end
end

