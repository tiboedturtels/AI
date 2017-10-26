function t = CS4300_RunTests()
%CS4300_RUNTESTS Summary of this function goes here
%   Detailed explanation goes here

    clear function CS4300_hybrid_agent;
    [scores,traces]=CS4300_WW3(50,'CS4300_hybrid_agent');
    %CS4300_show_trace(t, 1);
    scores(1).score
    scores(2).score
    scores(3).score
    CS4300_show_trace(traces, 0.5);
end

