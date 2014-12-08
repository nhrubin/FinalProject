function[iApp, jApp, bestDist] = bestApproximateMatch(A, anno, curVec, l)
    [~, ah, aw] = size(A{l});
    [q, bestDist] = ksearch(anno, curVec, 1, .01);
    ind = randi(numel(q));
    q = q(ind);
    bestDist = bestDist(ind);
    [jApp, iApp] = ind2sub([aw,ah], q);
end

