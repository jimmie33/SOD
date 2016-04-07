function downloadModel(modelName)

if strcmp(modelName, 'GoogleNet')
    fprintf('downloading GoogleNet model files\n'); 
    if ~exist(fullfile('model',modelName), 'dir')
        mkdir(fullfile('model',modelName));
    end
    urlwrite('model', 'model/GoogleNet/deploy.prototxt');
    urlwrite('model', 'model/GoogleNet/GoogleNet_SOD_finetune.caffemodel');
elseif strcmp(modelName, 'VGG16')
    fprintf('downloading VGG16 model files\n'); 
    if ~exist(fullfile('model',modelName), 'dir')
        mkdir(fullfile('model',modelName));
    end
    urlwrite('model', 'model/VGG16/deploy.prototxt');
    urlwrite('model', 'model/VGG16/VGG16_SOD_finetune.caffemodel');
else
    fprintf('model name not known\n');
end