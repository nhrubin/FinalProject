function[q, bestDist] = bestApproximateMatch(anno, curVec)
    [q, bestDist] = ksearch(anno, curVec, 1, .01);
    ind = randi(numel(q));
    q = q(ind);
    bestDist = bestDist(ind);
end

