function pyramid = gaussianPyramid(im, numLevels)
% create a Gaussian pyramid for the given image with the given number of
% levels
    pyramid = cell(numLevels, 1);
    for i = 1:numLevels
        pyramid{i} = im;
        im = impyramid(im, 'reduce');
    end
end

