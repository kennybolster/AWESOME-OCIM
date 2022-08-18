load('data/ao.mat');
load('data/AEROSOLDEP.mat')
E = ao.nanOCN;
E(ao.iocn) = AEROSOLDEP.MINERAL(ao.iocn);
surfdust = E(:, :, 1);
pcolor(ao.lon, ao.lat, surfdust);
caxis([0 1000])
colorbar;
shading flat;