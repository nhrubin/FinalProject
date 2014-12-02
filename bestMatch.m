function [i2, j2] = bestMatch(A, anno, B, bPrime, s, l, i, j)
    [iApp, jApp, dApp] = bestApproximateMatch(A, anno, B, bPrime, l, i, j);
    [iCoh, jCoh, dCoh] = bestCoherenceMatch(A, B, bPrime, s, l, i, j);
    kappa = 2;
    if (dCoh <= dApp*(1+(2^-l)*kappa))
        i2 = iCoh;
        j2 = jCoh;
%         disp('coh');
    else
        i2 = iApp;
        j2 = jApp;
%         disp('app');
    end
end

