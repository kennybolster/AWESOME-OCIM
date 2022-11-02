load('data/ao.mat');
load('data/WOA09/WOASAL.mat');
load('data/WOA09/WOATEMP.mat');
addpath C:\Users\w10146938\Downloads\gsw_matlab_v3_06_16;
addpath C:\Users\w10146938\Downloads\gsw_matlab_v3_06_16\html\;
addpath C:\Users\w10146938\Downloads\gsw_matlab_v3_06_16\library\;
addpath C:\Users\w10146938\Downloads\gsw_matlab_v3_06_16\pdf\;
addpath C:\Users\w10146938\Downloads\gsw_matlab_v3_06_16\thermodynamics_from_t\;

SA = WOASAL(ao.iocn);
CT = WOATEMP(ao.iocn);

targetlat = ao.lat(58);
targetlon1 = ao.lon(134);
targetlon2 = ao.lon(135);
s1 = (ao.Lat == targetlat) & (ao.Lon == targetlon1);
s2 = (ao.Lat == targetlat) & (ao.Lon == targetlon2);

sal1 = SA(s1);
sal2 = SA(s2);
temp1 = CT(s1);
temp2 = CT(s2);
p1 = ao.Depth(s1);
p2 = ao.Depth(s2);

dynheight1 = gsw_geo_strf_dyn_height(sal1, temp1, p1, 0);
dynheight2 = gsw_geo_strf_dyn_height(sal2, temp2, p2, 0);
geo_strf = [dynheight1 dynheight2];

long = [targetlon1 targetlon2];
lat = [targetlat targetlat];
p = ao.depth(1:16);

geostrophic_velocity = gsw_geostrophic_velocity(geo_strf, long, lat, p')
