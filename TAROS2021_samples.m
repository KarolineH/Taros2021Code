directory = '/home/user/Desktop/project/deepLeafSegmentation/pointnet2_tensorflow2/cloud_vis/results_for_matlab/samples/'
locations = dir(directory)
samples = [69,70]%[17,18,69,70,71,72];
save_dir = '/home/user/Desktop/screenshots_taros/sample_scene/pngs/';

%%
rgb_codes = [100,100,100;80,125,0;161,61,45];
% soil, leaves, stems
% error_colours = [255, 0, 127; 0, 0, 0; 0, 59, 119];
% error_colours(:,:,2)= [70, 70, 70; 255, 0, 127; 170, 34, 34];
% error_colours(:,:,3)= [0, 117, 153; 255, 36, 7; 255, 0, 127];
error_colours = [255, 0, 127; 72,143,49; 0,63,92];
error_colours(:,:,2)= [171,202,67; 255, 0, 127; 240,50,31];
error_colours(:,:,3)= [0,128,186;255,158,23; 255, 0, 127];
% 255,80,50
% 184,55,75
for i = samples
    error_cloud = [];
    error_labels = [];
    pred_labels = [];
    true_labels = [];
    if(strlength(locations(i).name)>2)
        file = strcat(directory, locations(i).name);
        data = load(file);
        if contains(file,'cloud.out')
           pc = data;
        else
            data = data + 1;
            data(data == 4) = 3;
            for j = 1:length(data)
                pred_labels(j,:) = rgb_codes(data(j,2),:);
                true_labels(j,:) = rgb_codes(data(j,1),:);
                if(data(j,1)~= data(j,2))
                    error_cloud(end+1,:) = pc(j,:);
                    error_labels(end+1,:) = error_colours(data(j,1),:,data(j,2));
                end
            end
            view = [-90 -90 0];
            plotting(pc,pred_labels,true_labels,error_cloud,error_labels, view, i,save_dir);
        end
    end
end
%%
plotting(pc,pred_labels,true_labels,error_cloud,error_labels, view, i,save_dir);

function out = plotting(pc,pred_labels,true_labels,error_cloud, error_labels, view, iteration, save_dir)
count = 1;
fa = figure;
fa.WindowState = 'maximized';
pcloud = pointCloud(pc,'Color',uint8(pred_labels));
pcshow(pcloud, 'MarkerSize', 160);
set(gca, 'visible', 'off')
set(gcf,'color','w');
set(gca,'color','w');
set(gca, 'CameraPosition', view);
camzoom(3);
file = append(save_dir,string(iteration),string(count),'png')
%print(gcf,file,'-dpng','-r300');

count = count + 1;
fb = figure;
fb.WindowState = 'maximized';
pcloud = pointCloud(pc,'Color',uint8(true_labels));
pcshow(pcloud, 'MarkerSize', 160);
set(gca, 'visible', 'off')
set(gcf,'color','w');
set(gca,'color','w');
set(gca, 'CameraPosition', view);
camzoom(3);
newxLim = xlim();
newyLim = ylim();
newzLim = zlim();
file = append(save_dir,string(iteration),string(count),'png')
%print(gcf,file,'-dpng','-r300');

count = count + 1;
fc = figure;
fc.WindowState = 'maximized';
pcloud = pointCloud(error_cloud,'Color',uint8(error_labels));
pcshow(pcloud, 'MarkerSize', 180);
set(gca, 'visible', 'off')
set(gcf,'color','w');
set(gca,'color','w');
set(gca, 'CameraPosition', view);
camzoom(0.8);
xlim(newxLim);
ylim(newyLim);
zlim(newzLim);
file = append(save_dir,string(iteration),string(count),'png')
%print(gcf,file,'-dpng','-r300');
end