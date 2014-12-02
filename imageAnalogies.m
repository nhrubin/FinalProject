imAname = 'tree3.jpg';
filterName = 'inverted';
imBname = 'tree2medium.jpg';

A = im2double(imread(['images/' imAname]));
Aprime = im2double(imread(['images/' filterName '-' imAname]));
B = im2double(imread(['images/' imBname]));

Bprime = createImageAnalogy(A, Aprime, B);

imwrite(Bprime, ['images/' filterName '-' imBname]);