function f = featureConcat(im, imPrime, l, i, j)
    numLevels = size(im, 1);
    coarseWindow = 1;
    fineWindow = 2;
    imFine = im{l}(i-fineWindow:i+fineWindow);
    imPrimeFine = imPrime{l}(i-fineWindow:i+fineWindow);
    imFine = reshape(imFine, [1,25]);
    imPrimeFine = reshape(imPrimeFine, [1,25])
    if (l < numLevels)
        imCoarse = im{l+1}(i-coarseWindow:i+coarseWindow);
        imPrimeCoarse = imPrime{l+1}(i-coarseWindow:i+coarseWindow);
        imCoarse = reshape(imCoarse, [1,9]);
        imPrimeCoarse = reshape(imPrimeCoarse, [1,9]);
    else
        imCoarse = [];
        imPrimeCoarse = [];
    end
    f = [imFine, imPrimeFine, imCoarse, imPrimeCoarse];
end

