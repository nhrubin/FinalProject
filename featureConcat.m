function f = featureConcat(im, imPrime, l, i, j)
    numLevels = size(im, 1);
    coarseWindow = 1;
    fineWindow = 2;
    imFine = im{l}(i-fineWindow:i+fineWindow, j-fineWindow:j+fineWindow, :);
    imPrimeFine = imPrime{l}(i-fineWindow:i, j-fineWindow:j+fineWindow, :);
    imFine = reshape(imFine, [75,1]);
    imPrimeFine = reshape(imPrimeFine, [45,1]);
    imPrimeFine = imPrimeFine(1:36);
    if (l < numLevels)
        imCoarse = im{l+1}(i/2-coarseWindow:i/2+coarseWindow, j/2-coarseWindow:j/2+coarseWindow, :);
        imPrimeCoarse = imPrime{l+1}(i/2-coarseWindow:i/2+coarseWindow, j/2-coarseWindow:j/2+coarseWindow, :);
        imCoarse = reshape(imCoarse, [27,1]);
        imPrimeCoarse = reshape(imPrimeCoarse, [27,1]);
    else
        imCoarse = [];%NaN(1,27);
        imPrimeCoarse = [];%NaN(1,27);
    end
    f = [imFine; imPrimeFine; imCoarse; imPrimeCoarse];
end

