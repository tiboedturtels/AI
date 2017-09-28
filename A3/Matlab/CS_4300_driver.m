function driver = CS_4300_driver
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here


DP(1).clauses = [-1,2,3,4];
DP(2).clauses = [-2];
DP(3).clauses = [-3];
DP(4).clauses = [1];
thm(1).clauses = [4];
vars = [1,2,3,4];
driver = CS4300_RTP(DP,thm,vars);