# -*- coding: utf-8 -*-
"""
Created on Thu Aug 18 15:29:41 2022

@author: w10146938
"""

import pandas as pd
import numpy as np
from sklearn.cluster import KMeans
import matplotlib.pyplot as plt

grid = pd.read_csv('grid_info.csv')
#ocim1 = pd.read_csv('ocim1.csv')
R = 6371000
# approximate radius of earth in meters
grid['x'] = R * np.cos(grid.latitude/180*np.pi) * np.cos(grid.longitude/180*np.pi)
grid['y'] = R * np.cos(grid.latitude/180*np.pi) * np.sin(grid.longitude/180*np.pi)
grid['z'] = R * np.sin(grid.latitude/180*np.pi)
plt.figure()
plt.scatter(grid.x[grid.z > 0], grid.y[grid.z > 0], s = .1, c = grid.z[grid.z > 0])



