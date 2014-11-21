function d = distance(A, aPrime, B, bPrime, l, i, j, i2, j2)
    fA = featureConcat(A, aPrime, l, i2, j2);
    fB = featureConcat(B, bPrime, l, i, j);
    d = norm(fA-fB)^2;
end

