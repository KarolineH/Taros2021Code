import pickle
import os
import open3d as o3d

file = os.path.join(os.path.expanduser('~'), 'Desktop', 'project', 'deepLeafSegmentation', 'synth_data', 'EXAMPLE_meshes_with_clouds_midres', '1.0_partial_clouds.pickle')
cloud = pickle.load(open(file,"rb"))

for i in [0,1,2]:
    pcd = o3d.geometry.PointCloud()
    pcd.points = o3d.utility.Vector3dVector(cloud[i])
    o3d.visualization.draw_geometries([pcd])
#o3d.io.write_point_cloud(os.path.join(os.path.expanduser('~'), 'Desktop', 'project', 'deepLeafSegmentation', 'synth_data', 'EXAMPLE_meshes_with_clouds_midres', 'cloud.pcd'), pcd)
