function t = CS4300_RunTests()
%CS4300_RUNTESTS Summary of this function goes here
%   Detailed explanation goes here

%     clear function CS4300_hybrid_agent;
%     t=CS4300_WW1(50,'CS4300_hybrid_agent',[0,0,0,3;0,0,0,0;2,1,0,0;0,0,0,0]);
%     CS4300_show_trace(t, 0.5);
%     
%     clear function CS4300_hybrid_agent;
%     t=CS4300_WW1(50,'CS4300_hybrid_agent',[0,0,0,1;3,2,1,0;0,0,0,0;0,0,1,0]);
%     CS4300_show_trace(t, 0.5);
%     
    clear function CS4300_hybrid_agent;
    t=CS4300_WW1(50,'CS4300_hybrid_agent',[0,0,0,0;0,0,0,0;3,2,0,0;0,1,0,0]);
    CS4300_show_trace(t, 0.5);
end

