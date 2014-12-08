function q = bestMatch(A, anno, B, bPrime, s, l, i, j)
    bVec = featureConcat(B, bPrime, l, i, j);
    [qApp, dApp] = bestApproximateMatch(A, anno, bVec, l);
    [qCoh, dCoh] = bestCoherenceMatch(A, bVec, s, l, i, j);
    kappa = 20;
    if (dCoh <= dApp*(1+(2^-l)*kappa))
%         i2 = iCoh;
%         j2 = jCoh;
        q = qCoh;
    else
%         i2 = iApp;
%         j2 = jApp;
        q = qApp;
    end
end

