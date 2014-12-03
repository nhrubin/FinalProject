function[iApp, jApp, bestDist] = bestApproximateMatch(A, anno, B, bPrime, l, i, j)
    curVec = featureConcat(B, bPrime, l, i, j);
%     curVec = shiftdim(curVec, 1);
    [~, ah, aw] = size(A{l});
    [q, bestDist] = ksearch(anno, curVec, 1, .01);
    [iApp, jApp] = ind2sub([ah,aw], q);
end

