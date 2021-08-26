import open3d as o3d
import os
import numpy as np

dir = os.path.join(os.path.expanduser('~'), 'Desktop', 'screenshots_taros')
files = os.listdir(dir)

pcd = o3d.io.read_point_cloud(os.path.join(dir,files[0]))
old_colors = np.sum(np.asarray(pcd.colors), axis = 1)
old_colors[old_colors<1.3] = 0
old_colors[old_colors>1.9] = 1
old_colors[old_colors>1] = 2

rgb_codes = np.array([(100, 100, 100),(80, 125, 0),(161, 61, 45)])/255
#(102, 153, 0), (79, 99, 90)
#(255, 174, 3)
#(140,179,105)
new_colors = rgb_codes[old_colors. astype(int)]
pcd.colors = o3d.utility.Vector3dVector(new_colors)

def custom_draw_geometry_with_custom_fov(pcd, fov_step):
    vis = o3d.visualization.Visualizer()
    vis.create_window()
    vis.add_geometry(pcd)
    ctr = vis.get_view_control()
    print("Field of view (before changing) %.2f" % ctr.get_field_of_view())
    ctr.change_field_of_view(step=fov_step)
    print("Field of view (after changing) %.2f" % ctr.get_field_of_view())
    vis.run()
    vis.destroy_window()

import pdb; pdb.set_trace()
custom_draw_geometry_with_custom_fov(pcd, 90)
#o3d.visualization.draw_geometries([pcd])
