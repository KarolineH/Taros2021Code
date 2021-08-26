
import os
from PIL import Image
import numpy as np
import open3d as o3d
import pickle

pth = os.path.join('/media', 'user','Data','karo','datasets', 'justin-strawberries', '12_27_25.896','underneath_view','depth.png')
outpth = os.path.join('/media', 'user','Data','karo','datasets', 'justin-strawberries', '12_27_25.896','underneath_view','pcl.pickle')
map = Image.open(pth)
depth = np.reshape(np.array(map.getdata()),[480,848])


import argparse
import sys

focalLength = 422.5395812988281
centerX = 424.4189453125
centerY = 239.8482666015625
scalingFactor = 1000


depth = Image.open(pth).convert('I')
points = []
import pdb; pdb.set_trace()
for v in range(depth.size[1]):
    for u in range(depth.size[0]):
        Z = depth.getpixel((u,v)) / scalingFactor
        if Z==0: continue
        if Z>2: continue
        X = (u - centerX) * Z / focalLength
        Y = (v - centerY) * Z / focalLength
        points.append((X,Y,Z))

coordinates = np.array(points)

pcd = o3d.geometry.PointCloud()
pcd.points = o3d.utility.Vector3dVector(coordinates)
o3d.visualization.draw_geometries([pcd])

pickle.dump( coordinates[:110000,:], open( outpth, "wb" ) )
import pdb; pdb.set_trace()
