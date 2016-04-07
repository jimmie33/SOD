
I = imreadRGB(fullfile('../../SOID/SalDetEval/dataset/MSRA/srcimg/','0_1_1728.jpg'));
imsz = [size(I,1), size(I,2)];

tic;
[P, S] = getProposals(I, net, param);
res = propOpt(P, S, param);

% scale bboxes to full size
res = bsxfun(@times, res, imsz([2 1 2 1])');
resRefine = refineWin(I, res, net, param);
toc

subplot(1,2,1)
imshow(I)
for i = 1:size(res,2)
    rect = res(:,i);
    rect(3:4) = rect(3:4)-rect(1:2) +1;
    rectangle('Position',rect,'linewidth',2,'edgecolor',[1 0 0]);
end

subplot(1,2,2)

imshow(I)
for i = 1:size(resRefine,2)
    rect = resRefine(:,i);
    rect(3:4) = rect(3:4)-rect(1:2) +1;
    rectangle('Position',rect,'linewidth',2,'edgecolor',[1 0 0]);
end


