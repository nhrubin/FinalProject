imAname = 'gray-tree2small.jpg';
filterName = 'colored';
imBname = 'gray-tree3small.jpg';

A = im2double(imread(['images/' imAname]));
Aprime = im2double(imread(['images/' filterName '-' imAname]));
B = im2double(imread(['images/' imBname]));

% for colorizing
A = cat(3, A, A, A);
B = cat(3, B, B, B);

Bprime = createImageAnalogy(A, Aprime, B);

imwrite(Bprime, ['images/' filterName '-' imBname]);