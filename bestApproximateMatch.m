function[q, bestDist] = bestApproximateMatch(anno, curVec)
% use ANN to find the most similar pixel in Aprime, by comparing
% neighborhoods of A, Aprime, B, and Bprime and the current and
% next-coarsest levels.
    [q, bestDist] = ksearch(anno, curVec, 1, .01);
end

