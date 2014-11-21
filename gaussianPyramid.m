function pyramid = gaussianPyramid(im, numLevels)
    pyramid = cell(numLevels, 1);
    for i = 1:numLevels
        pyramid{i} = im;
        im = impyramid(im, 'reduce');
    end
end

