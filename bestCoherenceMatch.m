function [i2, j2, bestDist] = bestCoherenceMatch(A, B, bPrime, s, l, i, j);
    nSize = 12;
    s = s{l};
    [h,w,~] = size(s);
    [ha,wa,~] = size(A{l});
    qVec = featureConcat(B, bPrime, l, i, j);
    qVec = shiftdim(qVec, -1);
    bestDist = inf;
    i2 = 0;
    j2 = 0;
    for m = -nSize:nSize
        for n = -nSize:0
            qi = i+m;
            qj = j+n;
            if (qi < 1 || qj < 1 || qi > h || qj > w)
                continue;
            end
            if (qi == i && qj > j)
                continue;
            end
            pPoss = s(qi, qj)-[m,n];
            pi = pPoss(1);
            pj = pPoss(2);
            if (pi < 1 || pj < 1 || pi > ha || pj > wa)
                continue;
            end
            pVec = A{l}(pi, pj, :);
            dist = distVec(qVec, pVec);
            if (dist < bestDist)
                bestDist = dist;
                i2 = pi;
                j2 = pj;
            end
        end
    end
end

