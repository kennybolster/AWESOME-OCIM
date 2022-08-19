# -*- coding: utf-8 -*-
"""
Created on Thu Aug 18 15:29:41 2022

@author: w10146938
"""

import pandas as pd
import numpy as np
from sklearn.cluster import KMeans
import matplotlib.pyplot as plt
from scipy import sparse

grid = pd.read_csv('grid_info.csv')
ocim1 = pd.read_csv('ocim1.csv')
R = 6371000
# approximate radius of earth in meters
grid['x'] = R * np.cos(grid.latitude/180*np.pi) * np.cos(grid.longitude/180*np.pi)
grid['y'] = R * np.cos(grid.latitude/180*np.pi) * np.sin(grid.longitude/180*np.pi)
grid['z'] = R * np.sin(grid.latitude/180*np.pi)
clustermat = grid[['depth', 'temperature', 'salinity', 'x', 'y', 'z']].values
# making matrix for clustering algorithm
n_clusters = 8
kmn = KMeans(n_clusters = n_clusters, random_state = 940).fit(clustermat)
grid['cluster'] = kmn.predict(clustermat)

transport = sparse.coo_matrix((n_clusters, n_clusters))





