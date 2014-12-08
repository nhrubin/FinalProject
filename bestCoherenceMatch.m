function [q, bestDist] = bestCoherenceMatch(A, qVec, s, i, j)
    nSize = 12;
    [h,w,~] = size(s);
    [~,ha,wa] = size(A);
    pts = inf(size(qVec, 1), 350);
    indices = ones(1, 350);
    index = 1;
    for m = max(-nSize, 1-i):0
        for n = max(-nSize, 1-j):min(nSize, w-j)
            qi = i+m;
            qj = j+n;
            if (qi == i && qj > j)
                continue;
            end
            pPoss = s(qi, qj)-[m,n];
            pi = pPoss(1);
            pj = pPoss(2);
            if (pi < 1 || pj < 1 || pi > ha || pj > wa)
                continue;
            end
            p = sub2ind([wa, ha], pj, pi);
            indices(index) = p;
            index = index+1;
        end
    end
    if (index == 1)
        q = 1;
        bestDist = inf;
        return;
    end
    indices = indices(1:index-1);
    pts = A(:, indices);
    anno = ann(pts);
    [q, bestDist] = ksearch(anno, qVec, 1, .01);
    ind = randi(numel(q));
    q = q(ind);
    bestDist = bestDist(ind);
    q = indices(q);
    anno = close(anno);
end

