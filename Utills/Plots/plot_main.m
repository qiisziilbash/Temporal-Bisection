%% normal dist with different errors
x = 0:.01:3;
y = normpdf(x,1,.2);
y = y/ max(y );


plot(x,y,'k','LineWidth',2)

hold on
y = normpdf(x,1,.3);
y = y/ max(y );
plot(x,y,'k','LineWidth',3)


y = normpdf(x,1,.4);
y = y/ max(y );
plot(x,y,'k','LineWidth',4)

legend({'sigma = 0.2', 'sigma = 0.3', 'sigma = 0.4'},'FontSize',18)

set(gca,'FontSize',18)
set(gca,'FontWeight','Bold')
xlabel('Duration (secs)')
ylabel('Correct Response Probablity')

title('Normal Distribution for Perception with Different Errors')


%% scalar dist with different errors
[x, y] = get_scalar_normal_perception(.01, 3, .2);
plot(x,y,'k','LineWidth',2)

hold on
[x, y] = get_scalar_normal_perception(.01, 3, .3);
plot(x,y,'k','LineWidth',3)


[x, y] = get_scalar_normal_perception(.01, 3, .4);
plot(x,y,'k','LineWidth',4)

legend({'sigma = 0.2', 'sigma = 0.3', 'sigma = 0.4'},'FontSize',18)

set(gca,'FontSize',18)
set(gca,'FontWeight','Bold')
xlabel('Duration (secs)')
ylabel('Correct Response Probablity')

title('Scalar Distribution for Perception with Different Errors')


%% normal dist for bisection
x1 = 0:.01:16;
y1 = normpdf(x1,2,.6);
y1 = y1/ max(y1 );

x2 = 0:.01:16;
y2 = normpdf(x2,8,2.4);
y2 = y2/ max(y2 );


plot(x1,y1,'k','LineWidth',2)
hold on
plot(x2,y2,'k','LineWidth',4)

plot([4 4],[0 1],'r','LineWidth',3)
plot([3.2 3.2],[0 1],'g','LineWidth',3)
plot([5 5],[0 1],'b','LineWidth',3)

legend({'Short duration', 'Long duration', 'HM = 3.2','GM = 4','AM = 5'},'FontSize',18)

set(gca,'FontSize',18)
set(gca,'FontWeight','Bold')
xlabel('Duration (secs)')
ylabel('Correct Response Probablity')

title('Normal Distribution for Perception with Different Errors')


%% normal dist for bisection
[x, y] = get_scalar_normal_perception(.01, 8, .2);
plot(x*2,y,'k','LineWidth',2)
hold on
[x, y] = get_scalar_normal_perception(.01, 2, .2);
plot(x*8,y,'k','LineWidth',4)


plot([4 4],[0 1],'r','LineWidth',3)
plot([3.2 3.2],[0 1],'g','LineWidth',3)
plot([5 5],[0 1],'b','LineWidth',3)

legend({'Short duration', 'Long duration', 'HM = 3.2','GM = 4','AM = 5'},'FontSize',18)

set(gca,'FontSize',18)
set(gca,'FontWeight','Bold')
xlabel('Duration (secs)')
ylabel('Correct Response Probablity')

title('Scalar Distribution for Perception with Different Errors')

%% scalar distribution generation animation
    colors = linspace(1,3,length(durations));
    h = figure;
    durations = 0:.01:3;
    perceptions = zeros(1,length(durations));
	subplot(2,2,1:2)
    plot([1 1],[0 1])

    i = 1;
    for duration = durations
        pdf = normpdf([1 duration] ,duration,  .2*duration);
        perceptions(i) = pdf(1) / pdf(2);
        
        subplot(2,2,1:2)
        hold on
        y = normpdf(durations, duration, .2*duration);
        y = y / max(y);
        plot(durations,y,'k')
        scatter(1,perceptions(i),[],colors(i),'filled')
        
        subplot(2,2,3:4)
        hold on
        scatter(duration,perceptions(i),[],colors(i),'filled')
        
        pause(.01)
       
        
        frame = getframe(h); 
        im = frame2im(frame); 
        [imind,cm] = rgb2ind(im,256); 
        if i == 1 
          [imind,cm] = rgb2ind(im,256); 
          imwrite(imind,cm,'scalar.gif','gif', 'DelayTime',0.01 ,'Loopcount',inf); 
        else 
          imwrite(imind,cm,'scalar.gif','gif','DelayTime',0.01,'WriteMode','append'); 
        end 

        if mod(i,30) == 0
          saveas(h, ['image' num2str(i) '.png']);
        end
          
        i = i +1;
    end 
