function[iApp, jApp, bestDist] = bestApproximateMatch(A, anno, curVec, l)
    [~, ah, aw] = size(A{l});
    [q, bestDist] = ksearch(anno, curVec, 1, .01);
    [iApp, jApp] = ind2sub([ah,aw], q);
end

