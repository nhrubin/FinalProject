imAname = 'tree1.png';
filterName = 'blur';
imBname = 'tree2.png';

A = im2double(imread(imAname));
Aprime = im2double(imread([filterName '-' imAname]));
B = im2double(imread(imBname));

Bprime = createImageAnalogy(A, Aprime, B);

imwrite(Bprime, [filterName '-' imBname]);