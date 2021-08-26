import numpy as np


point = (0,0,0,1)
position = np.array([[3],[2],[2]])
yaw = np.pi/4
pitch = 0#np.pi/4

Rz = np.array([[np.cos(yaw), -np.sin(yaw), 0],[np.sin(yaw), np.cos(yaw), 0],[0,0,1]])
Rx = np.array([[1,0,0],[0,np.cos(pitch), -np.sin(pitch)],[0,np.sin(pitch), np.cos(pitch)]])
Rcombined =  np.matmul(Rz, Rx)
T_global_to_local = np.concatenate([Rcombined,position], axis=1)
T_global_to_local = np.concatenate((T_global_to_local, np.array([[0],[0],[0],[1]]).transpose()))
Transform = np.linalg.inv(T_global_to_local)
point_in_sensor_frame = np.matmul(Transform,point)
point_in_sensor_frame


np.linalg.norm(position)
np.linalg.norm(point_in_sensor_frame[:3])









-----
