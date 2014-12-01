function d = distance(A, aPrime, B, bPrime, l, i, j, i2, j2)
    fA = featureConcat(A, aPrime, l, i2, j2);
    fB = featureConcat(B, bPrime, l, i, j);
    nans = isnan(fA)+isnan(fB);
    fA(nans>0) = [];
    fB(nans>0) = [];
    d = norm(fA-fB)^2;
    d = d/size(fA,2);
end

