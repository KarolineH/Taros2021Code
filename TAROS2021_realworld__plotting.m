directory = '/home/user/Desktop/project/deepLeafSegmentation/pointnet2_tensorflow2/cloud_vis/results_for_matlab/';
locations = dir(directory);
save_dir = '/home/user/Desktop/screenshots_taros/real_world/';
rgb_codes = [100, 100, 100;80, 125, 0;161, 61, 45];

%%
for i = [5,6,7,8]%1:length(locations)
    pred_labels = [];
    if contains(locations(i).name, '.out')
        file = strcat(directory, locations(i).name);
        data = load(file);
        if contains(file,'cloud.out')
           pc = data;
        else
            data = data + 1;
            data(data == 4) = 3;
            for j = 1:length(data)
                pred_labels(j,:) = rgb_codes(data(j,:),:);
            end
            view = [-90 35 10];
            plotting(pc,pred_labels,view, i,save_dir);
        end
    end
end

%%
plotting(pc,pred_labels, view, i,save_dir);

function out = plotting(pc,pred_labels, view, iteration, save_dir)
count = 1;
fa = figure;
fa.WindowState = 'maximized';
pcloud = pointCloud(pc,'Color',uint8(pred_labels));
pcshow(pcloud, 'MarkerSize', 140);
set(gca, 'visible', 'off')
set(gcf,'color','w');
set(gca,'color','w');
set(gca, 'CameraPosition', view);
camzoom(1);
file = append(save_dir,string(iteration),string(count),'png');
%print(gcf,file,'-dpng','-r300');
end