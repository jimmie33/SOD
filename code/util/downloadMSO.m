
fprintf('downloading the MSO dataset\n');
urlwrite('http://www.cs.bu.edu/groups/ivc/data/SOS/MSO.zip', 'dataset/MSO.zip');
if ~exist('dataset/MSO','dir')
    mkdir('dataset/MSO');
end
fprintf('extracting the zip file\n');
unzip('dataset/MSO.zip', 'dataset/MSO/')