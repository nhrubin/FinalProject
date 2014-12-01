function [i2, j2] = bestMatch(A, aPrime, B, bPrime, s, l, i, j)
    [iApp, jApp] = bestApproximateMatch(A, aPrime, B, bPrime, l, i, j);
    i2 = iApp;
    j2 = jApp;
%     [iCoh, jCoh] = bestCoherenceMatch(A, aPrime, B, bPrime, s, l, q);
%     dApp = distance(A, aPrime, B, bPrime, l, i, j, iApp, jApp);
%     dCoh = distance(A, aPrime, B, bPrime, l, i, j, iCoh, jCoh);
%     kappa = 1;
%     L = size(A, 1);
%     if (dCoh <= dApp*(1+2^(l-L)*kappa))
%         i2 = iCoh;
%         j2 = jCoh;
%     else
%         i2 = iApp;
%         j2 = jApp;
%     end
end

