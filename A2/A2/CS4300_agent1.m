function action = CS4300_agent1(percept)
% CS4300_agent1
%    Takes actions: right, left, climb
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
%     a = CS4300_agent1([0,1,0,0,0]);
% Author:
%     William Garnes and Cameron Jackson
%     UU
%     Fall 2017 
%

persistent state

FORWARD = 1;
ROTATE_RIGHT = 2;
ROTATE_LEFT = 3;
GRAB = 4;
SHOOT = 5;
CLIMB = 6;

action = randi(3,1);

if isempty(state)
    state = 0;
end
