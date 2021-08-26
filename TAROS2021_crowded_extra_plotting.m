%%
%7,8 view  [-90 35 10]
%13,14 view [-90 -90 0]

%

figure;
pcloud = pointCloud(pc,'Color',uint8(pred_labels));
pcshow(pcloud, 'MarkerSize', 60);
set(gca, 'visible', 'off')
%set(gcf,'color','w');
%set(gca,'color','w');
set(gca, 'CameraPosition', [-90 -90 0]);
set(gca, 'CameraPosition', [0 0 90]);
set(gca, 'CameraPosition', [-30 35 10]);
camzoom(4);

figure;
pcloud = pointCloud(pc,'Color',uint8(true_labels));
pcshow(pcloud, 'MarkerSize', 60);
set(gca, 'visible', 'off')
set(gcf,'color','w');
set(gca,'color','w');
set(gca, 'CameraPosition', [-90 -90 0]);
set(gca, 'CameraPosition', [0 0 90]);
set(gca, 'CameraPosition', [-30 35 10]);
camzoom(4);
newxLim = xlim();
newyLim = ylim();
newzLim = zlim();

figure;
pcloud = pointCloud(error_cloud,'Color',uint8(error_labels));
pcshow(pcloud, 'MarkerSize', 60);
set(gca, 'visible', 'off')
set(gcf,'color','w');
set(gca,'color','w');
set(gca, 'CameraPosition', [-90 -90 0]);
set(gca, 'CameraPosition', [0 0 90]);
set(gca, 'CameraPosition', [-30 35 10]);
camzoom(1);
xlim(newxLim);
ylim(newyLim);
zlim(newzLim);