function [i2, j2] = bestMatch(A, B, bPrime, s, l, i, j)
    [iApp, jApp, dApp] = bestApproximateMatch(A, B, bPrime, l, i, j);
    [iCoh, jCoh, dCoh] = bestCoherenceMatch(A, B, bPrime, s, l, i, j);
%     appVec = A{l}(iApp,jApp,:);
%     cohVec = A{l}(iCoh,jCoh,:);
%     bVec = featureConcat(B, bPrime, l, i, j);
%     bVec = shiftdim(bVec, -1);
%     dApp = distVec(appVec, bVec);
%     dCoh = distVec(cohVec, bVec);
%     dApp = distance(A, aPrime, B, bPrime, l, i, j, iApp, jApp);
%     dCoh = distance(A, aPrime, B, bPrime, l, i, j, iCoh, jCoh);
    kappa = 1;
    L = size(A, 1);
    if (dCoh <= dApp*(1+(2^-l)*kappa))
        i2 = iCoh;
        j2 = jCoh;
    else
        i2 = iApp;
        j2 = jApp;
    end
end

