function [durations, perceptions] = get_scalar_normal_perception(resolution, upper_limmit, absolute_error)
    durations = 0:resolution:upper_limmit;
    perceptions = zeros(1,length(durations));
    
    if ~exist('absolute_error', 'var')
        absolute_error = .2;
    end

    i = 1;
    for duration = durations
        pdf = normpdf([1 duration] ,duration,  absolute_error*duration);
        perceptions(i) = pdf(1) / pdf(2);
        i = i +1;
    end 
end

