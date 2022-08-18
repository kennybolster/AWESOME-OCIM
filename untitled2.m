load('data/ao.mat');
load('data/water_transport.mat');

targetlat = 9.45;
targetlon = -104.54 + 360;
targetdepth = 3290;
% NEPR

[~, latindex] = min(abs(ao.lat - targetlat));
[~, lonindex] = min(abs(ao.lon - targetlon));
[~, depthindex] = min(abs(ao.depth - targetdepth));
targetpos = ao.EQNPOS(latindex, lonindex, depthindex);

timescales = [1, 10, 100, 1000, 10000, 100000];
ntimes = length(timescales);
dists = zeros(ao.nocn, ntimes);

for i = 1:ntimes
    dists(:, i) = modelrun(timescales(i), water_transport, ao, targetpos);
end

[~, pmtindex] = min(abs(360 - 151 - ao.lon));

for i = 1:ntimes
    E = ao.nanOCN;
    E(ao.iocn) = dists(:, i);
    slice = squeeze(E(:, pmtindex, :))';
    figure(i);
    pcolor(ao.lat, -ao.depth, slice);
    shading flat;
    colorbar;
    title(timescales(i));
end

function e = modelrun(halflife, water_transport, ao, targetpos)
    b = zeros(ao.nocn,1);
    A = water_transport;
    
    b(targetpos) = -1e15 / ao.Vol(targetpos);
    
    lambda = log(.5) / halflife;
    decayA = speye(ao.nocn) * lambda;
    A = A + decayA;

    e = A\b;

end