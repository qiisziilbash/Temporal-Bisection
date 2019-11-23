%% Siegel 1986 out of range 1-16
criterionTime1                  = 1;
criterionTime2                  = 16;

durations                       = [.5 1 2 2.8 4 5.7 8 16 32];
numberOfTrials                  = [20 70 20 20 20 20 20 70 20];
reinforcement                   = reinforcement3;

% PSE = 2.53 < 4
% .5 and 32 had less response(n.s.) as compared to anchors (scalar)

%% Siegel 1986 out of range 2-8
criterionTime1                  = 2;
criterionTime2                  = 8;

durations                       = [.5 1 2 2.8 4 5.7 8 16 32];
numberOfTrials                  = [20 20 70 20 20 20 70 20 20];
reinforcement                   = reinforcement3;

%  PSE = 3.6 < 4
% .5 and 32 had less response(n.s.) as compared to anchors (scalar)


%% Siegel 1986
criterionTime1                  = 2;
criterionTime2                  = 8;

durations                       = [2 2.8 4 5.7 8];
numberOfTrials                  = [30 20 20 20 30];
reinforcement                   = reinforcement3;

% PSE = 3.92 ~ 4


%% Siegel 1986
criterionTime1                  = 2;
criterionTime2                  = 8;

durations                       = [2 2.4 2.8 3.3 4 4.8 5.7 6.8 8];
numberOfTrials                  = [70 20 20 20 20 20 20 20 70];
reinforcement                   = reinforcement3;

% PSE = 3.73 ~ 4

%% linear
criterionTime1                  = 2;
criterionTime2                  = 8;

durations                       = [2 3 4 5 6 7 8];
numberOfTrials                  = [50 20 20 20 20 20 50];

reinforcement                   = reinforcement3;

%% logaritmic
criterionTime1                  = 2;
criterionTime2                  = 8;

durations                       = [2 2.52 3.18 4 5.04 6.35 8];
numberOfTrials                  = [50 20 20 20 20 20 50];

reinforcement                   = reinforcement3;


