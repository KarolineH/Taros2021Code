import sys
import os
import numpy as np
import open3d as o3d

"""
- Expects a folder with point cloud txt files, and a folder with label files
- Matching files will have the same name
"""


""" Read the data """
# Find all relevant files
cloud_directory = os.path.join(os.path.expanduser('~'), 'Desktop', 'project', 'datasets', 'semantic3d','clouds')
label_directory = os.path.join(os.path.expanduser('~'), 'Desktop', 'project', 'datasets', 'semantic3d','labels')


def getitem(idx):
    cloud_path = sorted(os.listdir(cloud_directory))[idx]
    label_path = sorted(os.listdir(label_directory))[idx]
    cloud = open_file(os.path.join(cloud_directory, cloud_path))
    cloud = [[float(entry)for entry in line.split(' ')[:3]] for line in cloud]
    coordinates = np.array(cloud)
    cloud = None # for memory reasons

    labels = open_file(os.path.join(label_directory, label_path))
    labels = np.array([int(line) for line in labels])
    import pdb; pdb.set_trace()

    return coordinates

def open_file(path):
    file = open(path,"r")
    content = file.read()
    lines = content.split('\n') # split into a list single rows
    if lines[-1] == '': # trim the last row off if it is empty
        lines = lines[:-1]
    return lines

def vis_cloud(cloud):
    pcl = o3d.geometry.PointCloud()
    pcl.points = o3d.utility.Vector3dVector(cloud)
    o3d.visualization.draw_geometries([pcl])

cloud = getitem(0) # this is a np array [points x 3]
vis_cloud(cloud)



# ray tracing
# 64 rays vertical in 0.1 degree resolution horizontally
# first cut off all points above/below/too far away
# 230400 times, produce one ray
# load a piece of data, compare with all rays, then do it again for another piece of datasets




if "labels" in file.name:
    labels = np.array(lines)
    labels = labels.reshape(1,len(lines),1)
    if out_labels is None:
        out_labels = labels
    else:
        out_labels = np.concatenate((out_labels,labels),axis = 0)
        # out_labels is an array of (m clouds, n points, 1 label)
    import pdb; pdb.set_trace()

getitem(0)
