function [lower, upper] = get_perception_CI(threshold, abs_err, ct)
    x = 0:0.01:5;
    y = exp (-1 *(x - 1).^2 ./ (2 * x.^2 * abs_err^2));
    [~,idx] = max(y);
    y1 = y(1:idx);
    y2 = y(idx+1:end);
    
    x1 = x(1:idx);
    x2 = x(idx+1:end);
    
    temp = 0;
    i = 1;
    while temp < threshold
        idx = min(find(y2<y1(i)));
        if ~isempty(idx)
            if (sum(y1(1:i)) + sum(y2(idx:end))) / sum(y) > threshold
                lower = x1(i) * ct;
                upper = x2(idx) * ct;
                return 
            end
        end
        i = i +1;
    end
end

