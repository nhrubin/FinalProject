function pyramid = gaussianPyramid(im, numLevels)
    pyramid = cell(numLevels, 1);
    for i = 1:numLevels
%         paddedIm = padarray(im, [2,2], NaN);
        pyramid{i} = im;
        im = impyramid(im, 'reduce');
    end
end

