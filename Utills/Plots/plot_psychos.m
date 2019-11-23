function plot_psychos(result, repetition, durations)
    if min(durations) == result.ct1s(1)
        subplot(2,2,1:2)
        hold on
        
        for i = 1 : repetition
            scatter(durations, result.means(i,:), 10, 'g')
        end
        
        ylim([0 1])
        scatter(durations, mean(result.means(:,:)), 80, 'k','filled')
        %errorbar(durations, mean(result.means(:,:)), std(result.means(:,:)))
        fitResult = log_fit(durations,mean(result.means,1));
        xData = min(durations)-1:0.01:max(durations)+1;
        yData = 1 ./(1 + exp(-fitResult.k*(xData-fitResult.m)));
        
        plot(xData,yData,'k','LineWidth',3)
        plot(minmax(xData),[0.5 0.5],'r','LineWidth',3)
        plot([fitResult.m fitResult.m], [0 1],'g','LineWidth',3)
        title(['TIP = ' num2str(fitResult.m) ' & Slope = ' num2str(fitResult.k) ])

        set(gca,'FontSize',18)
        xlabel('Duration (secs)')
        ylabel('Long Response Probablity')

        subplot(2,2,3)
        hold on
        
        for i = 1 : repetition
            plot(durations, result.sds(i,:))
        end

        subplot(2,2,4)
        hold on
        ylim([0 1.25 * max(durations)])
        xlabel('Trial')
        ylabel('Duration (sec)')
        for i = 1 : repetition
            plot(result.ct1s(i,:))
            plot(result.ct2s(i,:))
        end
    else
        hold on
        for i = 1 : repetition
            scatter(durations, result.means(i,:))
        end

        plot(durations,mean(result.means,1),'k','LineWidth',3)
        set(gca, 'XScale', 'log')
        xRange = [min(durations)*.75 max(durations)*1.5];
        axis([ xRange  -inf inf]); 
        xticks(durations);
        plot(minmax(xRange),[0.5 0.5],'r','LineWidth',3)
        plot(ones(1,2)*sqrt(result.ct1s(1)*result.ct2s(1)),...
            minmax(result.means),'g','LineWidth',3)

        set(gca,'FontSize',18)
        xlabel('Duration (secs)')
        ylabel('Long Response Probablity')
    end

end

