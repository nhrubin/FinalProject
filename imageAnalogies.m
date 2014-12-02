imAname = 'tree1small.png';
filterName = 'inverted';
imBname = 'tree2small.jpg';

A = im2double(imread(['images/' imAname]));
Aprime = im2double(imread(['images/' filterName '-' imAname]));
B = im2double(imread(['images/' imBname]));

Bprime = createImageAnalogy(A, Aprime, B);

imwrite(Bprime, ['images/' filterName '-' imBname]);