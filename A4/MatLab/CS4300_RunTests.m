function t = CS4300_RunTests()
% CS4300_RunTests - Driver function for tests
% Call: 
%     CS4300_RunTests
% Author: 
%     William Garnes and Cameron Jackson 
%     UU 
%     Fall 2017 
%
    clear function CS4300_hybrid_agent;
    [scores,traces]=CS4300_WW3(50,'CS4300_hybrid_agent');
    scores(1).score
    scores(2).score
    scores(3).score
    CS4300_show_trace(traces, 0.5);
end

