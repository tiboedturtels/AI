function driver = CS_4300_driver
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here


DP(1).clauses = [-1,2,3,4];
DP(2).clauses = [-2];
DP(3).clauses = [-3];
DP(4).clauses = [1];
DP(5).clauses = [8,9,10,11];
DP(6).clauses = [12,13,14,15];
DP(7).clauses = [16,17];
DP(8).clauses = [18,19,20];
DP(9).clauses = [8,2];
DP(10).clauses = [5,6];
DP(11).clauses = [7];
DP(12).clauses = [10,12,15];
DP(13).clauses = [6,18];
DP(14).clauses = [-19];
DP(15).clauses = [19,-4,11];
thm(1).clauses = [-11];
vars = [1,2,3,4];

driver = CS4300_RTP(DP,thm,vars);