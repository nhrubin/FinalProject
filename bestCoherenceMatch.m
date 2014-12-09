function [q, bestDist] = bestCoherenceMatch(A, qVec, s, i, j, ah, aw)
% examine already synthesized neighbors of pixel (i,j) in Bprime to find a
% match that may not be absolutely as good as the approximate match but
% will make the overall picture look more coherent.
    nSize = 4; % neighborhood size
    [h,w,~] = size(s);
    indices = ones(1, 350); % indicies in A of each potential match
    index = 1;
    for m = max(-nSize, 3-i):0
        for n = max(-nSize, 3-j):min(nSize, w-j)
            qi = i+m;
            qj = j+n;
            if (qi == i && qj > j)
                continue;
            end
            pPoss = s(qi, qj)-[m,n];
            pi = pPoss(1);
            pj = pPoss(2);
            if (pi < 1 || pj < 1 || pi > ah || pj > aw)
                continue;
            end
            p = sub2ind([aw, ah], pj, pi);
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
    % make an ANN search structure from potential matches
    pts = A(:, indices);
    anno = ann(pts);
    [q, bestDist] = ksearch(anno, qVec, 1, .01);
    q = indices(q);
    anno = close(anno);
end

