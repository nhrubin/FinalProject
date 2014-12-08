imAname = 'gray-trees1.jpg';
filterName = 'colored';
imBname = 'gray-trees2.jpg';

A = im2double(imread(['images/' imAname]));
Aprime = im2double(imread(['images/' filterName '-' imAname]));
B = im2double(imread(['images/' imBname]));

% for colorizing
A = cat(3, A, A, A);
B = cat(3, B, B, B);

% A = rgb2hsv(A);
% Aprime = rgb2hsv(Aprime);
% B = rgb2hsv(B);

Bprime = createImageAnalogy(A, Aprime, B);

% Bprime = hsv2rgb(Bprime);

imwrite(Bprime, ['images/' filterName '-test-' imBname]);