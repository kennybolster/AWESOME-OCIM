load water_transport.mat;
load ao.mat;
load WOA09\WOATEMP.mat;
load WOA09\WOASAL.mat;

[i, j, s] = find(water_transport);
index = 1:ao.nocn;
index = index';
latitude = ao.Lat;
longitude = ao.Lon;
depth = ao.Depth;
volume = ao.Vol;
grid_info = table(index, latitude, longitude, depth, volume);
grid_info.temperature = WOATEMP(ao.iocn);
grid_info.salinity = WOASAL(ao.iocn);

transport = table(i, j, s);

writetable(grid_info, 'for_clusters/grid_info.csv');
writetable(transport, 'for_clusters/ocim1.csv');





