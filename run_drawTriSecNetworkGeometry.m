close all;
clear all;
addpath('./Source Files/');


ISD = 200;       % specify inter-site distance
centerNodeBPos = [0;0]; % center site positons
numOfRings = 2; % sites lays as rings around the center site.
% numOfRings = 0, 1 site. numOfRings = 1, 1+6 sites. numOfRings = 2, 1+6+12 sites

% the region of interest
ROI.width = (2*numOfRings+1)*ISD;
ROI.height = ROI.width;

%----------------------------------------------------------------------------------
figure('position',[100,100,500,500]);hold on;
drawTriSecNetworkGeometry(numOfRings,centerNodeBPos,ISD,'g-');
axis(ROI.width/2*[-1.2,1.2,-1.2,1.2]);
%------------------------------------------------------------------------------------ 
   