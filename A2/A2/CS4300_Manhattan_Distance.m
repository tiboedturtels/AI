function distance = CS4300_Manhattan_Distance(state,goal_state)
% CS4300_agent_Astar - A* search agent example
%    gives the manhattan distance from state to goal
%    state by adding the x distance from state to goal
%    and the y distance from state to goal
%
% On input:
%     state ([1*3] vector of values): [x,y,dir] agent state
%     goal_state ([1*3] vector of values): [x,y,dir] agent state
%     
%
% Author:
%     William Garnes and Cameron Jackson
%     UU
%     Fall 2017

distance = abs(state(1) - goal_state(1)) + abs(state(2) - goal_state(2));