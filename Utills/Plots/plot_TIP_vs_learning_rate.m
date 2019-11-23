function plot_TIP_vs_learning_rate(alphas, betas, criterionTime1, criterionTime2, durations, numberOfTrials, repetition, reinforcement_rule, decision_rule, decay_rate, abs_err, threshold)

TIPs = zeros(1,length(alphas));
i = 1;
[x,y] = meshgrid (alphas, betas);
z = zeros (size(x));

for alpha = alphas
    j = 1;
    for beta = betas

        positiveLearningRate            = alpha;
        negativeLearningRate            = beta;

        result = run_bisection(criterionTime1, criterionTime2, durations,...
                      numberOfTrials, repetition, ...
                      reinforcement_rule, decision_rule, ...
                      positiveLearningRate, negativeLearningRate, decay_rate, abs_err);

        fitResult = log_fit(durations,mean(result.means,1));
        z(i,j) = fitResult.m;
        j = j + 1;
    end
    i = i + 1;
end

surf(x,y,z)
xlabel('negative learning rate')
ylabel('positive learning rate')
zlabel('TIP (sec)')
colorbar
title('TIP location with different learning rates')
end

