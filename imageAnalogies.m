imAname = 'tree1small.png';
filterName = 'blurred';
imBname = 'tree2small.jpg';

A = im2double(imread(imAname));
Aprime = im2double(imread([filterName '-' imAname]));
B = im2double(imread(imBname));

Bprime = createImageAnalogy(A, Aprime, B);

imwrite(Bprime, [filterName '-' imBname]);