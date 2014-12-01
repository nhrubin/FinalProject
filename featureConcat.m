function f = featureConcat(im, imPrime, l, i, j)
    numLevels = size(im, 1);
    coarseWindow = 1;
    fineWindow = 2;
    imFine = im{l}(i-fineWindow:i+fineWindow, j-fineWindow:j+fineWindow, :);
    imPrimeFine = imPrime{l}(i-fineWindow:i+fineWindow, j-fineWindow:j+fineWindow, :);
    imFine = reshape(imFine, [1,75]);
    imPrimeFine = reshape(imPrimeFine, [1,75]);
    if (l < numLevels)
        imCoarse = im{l+1}(i/2-coarseWindow:i/2+coarseWindow, j/2-coarseWindow:j/2+coarseWindow, :);
        imPrimeCoarse = imPrime{l+1}(i/2-coarseWindow:i/2+coarseWindow, j/2-coarseWindow:j/2+coarseWindow, :);
        imCoarse = reshape(imCoarse, [1,27]);
        imPrimeCoarse = reshape(imPrimeCoarse, [1,27]);
    else
        imCoarse = NaN(1,27);
        imPrimeCoarse = NaN(1,27);
    end
    f = [imFine, imPrimeFine, imCoarse, imPrimeCoarse];
end

