function q = bestMatch(A, anno, B, bPrime, s, l, i, j, ah, aw)
    bVec = featureConcat(B, bPrime, l, i, j);
    [qApp, dApp] = bestApproximateMatch(anno, bVec);
    [qCoh, dCoh] = bestCoherenceMatch(A, bVec, s{l}, i, j, ah, aw);
    kappa = 1;
    if (dCoh <= dApp*(1+(2^-l)*kappa))
        q = qCoh;
    else
        q = qApp;
    end
end