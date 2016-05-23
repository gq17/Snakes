% This file is to test the distance
% By GUO Qiang 23/05/2016 at ENS
clear all; close all;

% Load data
load('normal.mat');
load('abnormal.mat');

% Compute the correlation

[DistArray, CorrArray] = ComputeDistCentral(nor05);
