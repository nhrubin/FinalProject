function q = bestMatch(A, anno, B, bPrime, s, l, i, j, ah, aw)
% Finds the best matching pixel in A prime for a given pixel (i,j) in
% bPrime. A is the array of feature vectors for A and Aprime, anno is the
% ANN search structure.
    bVec = featureConcat(B, bPrime, l, i, j);
    [qApp, dApp] = bestApproximateMatch(anno, bVec);
    [qCoh, dCoh] = bestCoherenceMatch(A, bVec, s{l}, i, j, ah, aw);
    kappa = 1; % increase this to favor coherence matches
    if (dCoh <= dApp*(1+(2^-l)*kappa))
        q = qCoh;
    else
        q = qApp;
    end
end