textureName = 'toast.jpg';

Aprime = im2double(imread(['images/' textureName]));
[h,w,~] = size(Aprime);

A = rand(h,w,3);
B = rand(200,200,3);

Bprime = createImageAnalogy(A, Aprime, B);

imwrite(Bprime, ['images/synthesized-' textureName]);