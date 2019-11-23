function out  = run_bisection(criterionTime1, criterionTime2, durations, numberOfTrials, repetition,...
                              reinfo_rule, dec_rule, p_learning_rate, n_learning_rate, decay_rate, abs_err)
%% Initialize 
    means       = zeros(repetition, length(unique(durations)));
    sds         = zeros(repetition, length(unique(durations)));

    ct1s        = ones(repetition, sum(numberOfTrials)) * criterionTime1;
    ct2s        = ones(repetition, sum(numberOfTrials)) * criterionTime2;

    responses   = zeros(repetition, sum(numberOfTrials));
    
    trials      = zeros(repetition, sum(numberOfTrials));
    
    testDurations = zeros(1,sum(numberOfTrials));
    idx = 1;
    for i = 1 : length(durations)
        testDurations(idx:idx+numberOfTrials(i)-1) = durations(i);
        idx = idx + numberOfTrials(i);
    end
        
    for run = 1 : repetition
        trials(run,:) = testDurations(randperm(length(testDurations)));
    end

%% Main
    original_p_learning_rate  = p_learning_rate;
    original_n_learning_rate  = n_learning_rate;
    
    for run = 1 : repetition
        disp(['Run : ' num2str(run)])
        p_learning_rate    = original_p_learning_rate;
        n_learning_rate    = original_n_learning_rate;
        
        for trial = 1 : size(trials,2)
            if choose_ct1(ct1s(run,trial), ct2s(run,trial), trials(run,trial), dec_rule, abs_err)
                responses (run, trial) = 0; % record the response as short
                if trial < size(trials,2)
                    [ct1s(run, trial+1), ct2s(run, trial+1)] = ...
                        update_perceptions(ct1s(run, trial), ct2s(run,trial), trials(run, trial), 0,...
                                           criterionTime1, criterionTime2,...
                                           reinfo_rule, p_learning_rate, n_learning_rate);
                end
            else
                responses (run, trial) = 1; % record the response as long
                if trial < size(trials,2)
                    [ct1s(run, trial+1), ct2s(run, trial+1)] = ...
                        update_perceptions(ct1s(run, trial), ct2s(run,trial), trials(run, trial), 1,...
                                           criterionTime1, criterionTime2,...
                                           reinfo_rule, p_learning_rate, n_learning_rate);
                end
            end
            
            p_learning_rate  = p_learning_rate * (1 - decay_rate);
            n_learning_rate  = n_learning_rate * (1 - decay_rate);
        end 
        
%% Collect data for each run
        for i = 1 : length(durations)
            temp            = responses(run, find(trials(run,:) == durations(i)));
            means(run,i)    = mean(temp);
            sds(run,i)      = std(temp);
        end
    end
%% Collect data for all runs
    out.means       = means;
    out.sds         = sds;
    out.responses   = responses;
    out.trials      = trials;
    out.ct1s        = ct1s;
    out.ct2s        = ct2s;
end

