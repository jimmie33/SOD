function [TP NPred NGT] = evaluateBBox(imgList,res,classrange)
if nargin < 3
    classrange = [];
end
TTP = zeros(numel(res),numel(imgList));
NPred = zeros(numel(res),numel(imgList));
NGT = zeros(1,numel(imgList));
for i = 1:numel(res)
    pred_num = zeros(1,numel(imgList));
    TP = zeros(1,numel(imgList));
    for j = 1:numel(imgList)
        if ~isempty(classrange) && ~any(imgList(j).label==classrange)
            continue
        end
        NGT(j) = size(imgList(j).anno,1);
        pred_num(j) = size(res{i}{j},2);
        bboxes = getGTHitBoxes(res{i}{j},imgList(j).anno, 0.5);
        TP(j) = size(bboxes,2);
    end
    TTP(i,:) = TP;
    NPred(i,:) = pred_num;
end
TP = TTP;