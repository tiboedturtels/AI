function r = CS4300_TestDriver()
%CS4300_TestDriver Summary of this function goes here
%   Detailed explanation goes here
    clear all;
    t=CS4300_WW1(50,'CS4300_hybrid_agent',[0,1,0,0;0,0,1,0;0,3,2,0;0,0,0,0]);
    CS4300_show_trace(t, 0.5);
end

