%% REAL data clouds
directory = 'pointnet2_tensorflow2/cloud_vis/real_world_test/'
locations = dir(directory)
for i = 1:length(locations)
    if(strlength(locations(i).name)>2)
        file = strcat(directory, locations(i).name);
        pc = pcread(file);
        pcshow(pc, 'MarkerSize', 50);
        view(44.0977, 88.8877)
        title(locations(i).name, 'Interpreter','none')
        w = waitforbuttonpress;
    end
end

%% NETWORK comparison
directory = 'pointnet2_tensorflow2/cloud_vis/samples/';
locations = dir(directory);
for j = 1:length(locations)
    if(strlength(locations(j).name)>2)
        folder = strcat(directory, locations(j).name);
        folder = strcat(folder, '/');
        files = dir(folder);
        for i = 1:length(files)
            if contains(files(i).name, 'pred');
                file = strcat(folder, files(i).name);
                pc = pcread(file);
                pcshow(pc, 'MarkerSize', 50);
                view(90,0)
                title(locations(j).name, 'Interpreter','none')
                w = waitforbuttonpress;
            end
        end
    end
end

%% Side by side
files = {'pointnet2_tensorflow2/cloud_vis/samples/2_3class_midres/sem_seg_3class_midres_4_pred_cloud4.pcd'; ...
'pointnet2_tensorflow2/cloud_vis/samples/3_3class_midres_noweights/sem_seg_3class_midres_noweights_pred_cloud4.pcd';...
'pointnet2_tensorflow2/cloud_vis/samples/1_3class_lowres/sem_seg_3class_pred_cloud4.pcd';...
'pointnet2_tensorflow2/cloud_vis/samples/2_3class_midres/sem_seg_3class_midres_4_pred_cloud7.pcd';...
'pointnet2_tensorflow2/cloud_vis/samples/3_3class_midres_noweights/sem_seg_3class_midres_noweights_pred_cloud7.pcd';...
'pointnet2_tensorflow2/cloud_vis/samples/1_3class_lowres/sem_seg_3class_pred_cloud7.pcd';...
'pointnet2_tensorflow2/cloud_vis/samples/2_3class_midres/sem_seg_3class_midres_4_pred_cloud18.pcd';...
'pointnet2_tensorflow2/cloud_vis/samples/3_3class_midres_noweights/sem_seg_3class_midres_noweights_pred_cloud18.pcd';...
'pointnet2_tensorflow2/cloud_vis/samples/1_3class_lowres/sem_seg_3class_pred_cloud18.pcd'};
titles = {'high resoltuion + weighting'; 'high resolution, no weighting'; 'low resolution'}
figure;
counter = 1;
for i = 1:length(files)
    pc = pcread(char(files(i)));
    subplot(1,3,counter)
    pcshow(pc, 'MarkerSize', 50);
    view(90,0)
    title(char(titles(counter)))
    if(mod(i,3)==0)
        counter = 0;
        pause;
    end
    counter = counter +1;
end


%% CROWDED SCENE COMPARISON
% Loading data
directory = 'pointnet2_tensorflow2/cloud_vis/crowded/'
crowded_locations = dir(directory);

clouds = {};
counter = 0;
figure;
for i = 1:length(crowded_locations)
    if contains(crowded_locations(i).name, 'pred');
    %if(strlength(crowded_locations(i).name)>2)
        counter = counter + 1;
        file = strcat(directory, crowded_locations(i).name);
        pc = pcread(file);
        clouds{counter} = pc;
        
        subplot(4,3,counter)
        pcshow(pc, 'MarkerSize', 50);
        view(44.0977, 88.8877)
    end
end

%% PLOT

figure;
pcshow(pc, 'MarkerSize', 50);
set(gca,'visible','off')

%pcshowpair(ptCloudA,ptCloudB) creates a visualization depicting the differences between the two input point clouds. The differences are displayed using a blending of magenta for point cloud A and green for point cloud B.