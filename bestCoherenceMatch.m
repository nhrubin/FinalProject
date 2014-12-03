function [i2, j2, bestDist] = bestCoherenceMatch(A, B, bPrime, s, l, i, j);
    nSize = 12;
    s = s{l};
    A = A{l};
    [h,w,~] = size(s);
    [~,ha,wa] = size(A);
    qVec = featureConcat(B, bPrime, l, i, j);
    pts = [];
    indices = [];
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
            pts = [pts, A(:, pi, pj)];
            indices = [indices; [pi, pj]];
        end
    end
    anno = ann(pts);
    [q, bestDist] = ksearch(anno, qVec, 1, .01);
    i2 = indices(q, 1);
    j2 = indices(q, 2);
    anno = close(anno);
end

