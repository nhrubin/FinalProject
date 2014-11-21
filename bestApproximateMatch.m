function[iApp, jApp] = bestApproximateMatch(A, aPrime, B, bPrime, l, i, j)
    bestDist = inf;
    iApp = 0;
    jApp = 0;
    [h, w, ~] = size(A);
    for i2 = 1:h
        for j2 = 1:w
            dist = distance(A, aPrime, B, bPrime, l, i, j, i2, j2);
            if (dist < bestDist)
                bestDist = dist;
                iApp = i2;
                jApp = j2;
            end
        end
    end
end

