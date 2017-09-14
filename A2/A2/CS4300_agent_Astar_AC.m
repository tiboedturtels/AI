function action = CS4300_agent_Astar_AC(percept)
% CS4300_agent_Astar_AC - A* search agent with AC
%    Uses A* to find best path back to start and AC to avoid trouble
% On input:
%     percept (1x5 Boolean vector): percept values
%      (1): Stench
%      (2): Breeze
%      (3): Glitters
%      (4): Bumped
%      (5): Screamed
% On output:
%     action (int): action selected by agent
%       FORWARD = 1;
%       ROTATE_RIGHT = 2;
%       ROTATE_LEFT = 3;
%       GRAB = 4;
%       SHOOT = 5;
%       CLIMB = 6;
% Call:
%     a = CS4300_agent_Astar_AC([0,0,0,0,0]);
% Author:
%     William Garnes and Cam Jackson
%     UU
%     Fall 2017
%

