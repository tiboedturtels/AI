function driver = CS_4300_driver
% driver for the program
%
% Author:
%     William Garnes and Cameron Jackson
%     UU
%     Fall 2017
%

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
DP(16).clauses = [13,14];
DP(17).clauses = [12,13];
DP(18).clauses = [15,16];
DP(19).clauses = [19,-20];
DP(20).clauses = [21,22,23,24];
DP(21).clauses = [25,26,27,28];
DP(22).clauses = [29,30,31];
DP(23).clauses = [32,33,34];
DP(24).clauses = [35,36,37,38];
DP(25).clauses = [39,40,41];
DP(26).clauses = [42,43,44];
DP(27).clauses = [45,46,47,48];
DP(28).clauses = [49,50,51,52];
DP(29).clauses = [53,54,55,56];
DP(30).clauses = [56,57,58,59];
DP(31).clauses = [-25,26,-27,28];
DP(32).clauses = [-29,30,-31];
DP(33).clauses = [-32,33,-34];
DP(34).clauses = [-35,36,-37,38];
DP(35).clauses = [-39,40,-41];
DP(36).clauses = [-42,43,-44];
DP(37).clauses = [-45,46,-47,48];
DP(38).clauses = [-49,50,-51,52];
DP(39).clauses = [-53,54,-55,56];
DP(40).clauses = [-56,57,-58,59];
DP(41).clauses = [60,61,62];
DP(42).clauses = [-29,30,31];
DP(43).clauses = [32,-33,34];
DP(44).clauses = [-35,36,37,38];
DP(45).clauses = [39,40,-41];
DP(46).clauses = [42,-43,-44];
DP(47).clauses = [45,-46,47,48];
DP(48).clauses = [49,50,-51,52];
DP(49).clauses = [53,-54,55,56];
DP(50).clauses = [-56,57,58,59];

thm(1).clauses = [21];

vars = [1,2,3,4];

CS4300_RTP(DP,thm,vars);

driver = 1;