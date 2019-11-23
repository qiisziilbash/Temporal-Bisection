
%% by mahdi shafiei 24 Sept 2018
%% Task Parameters
criterionTime1                  = 2;
criterionTime2                  = 8;

durations                       = [2 2.4 2.8 3.3 4 4.8 5.7 6.8 8];
numberOfTrials                  = [70 20 20 20 20 20 20 20 70];
repetition                      = 100;


reinforcement_rule              = 'Anchors';                      % should implement other cases if needed
decision_rule                   = 'Relative-Similarity';          % should implement other cases if needed

%% Free Parameters
absolute_perception_error       = 0.6;                  % this is absolute error of subject for 1 second duration (in sec)
positive_learning_rate          = 0;                  
negative_learning_rate          = 0;
decay_rate                      = 0;                 % learning rates are multiplied by (1 - decay_rate) in each trial

%% Main Run
result = run_bisection(criterionTime1, criterionTime2, ...
                      durations, numberOfTrials, repetition, ...
                      reinforcement_rule, decision_rule, ...
                      positive_learning_rate, negative_learning_rate,...
                      decay_rate, absolute_perception_error);
                  
%% Plot the psychometircs
plot_psychos(result, repetition, durations);

%% Plot TIP over alpha and beta
% alphas = 0:.1:1;
% betas   = 0:.1:1; 
% plot_TIP_vs_learning_rate(alphas, betas, criterionTime1, criterionTime2, durations, numberOfTrials, repetition, reinforcement_rule, decision_rule, decay_rate, absolute_perception_error, threshold)


