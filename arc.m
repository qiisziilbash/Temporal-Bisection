%% dec rule  
case 'Absolute-Similarity'
            [ct1_prop, ct2_prop] = get_scalar_perception_props(duration, ct1, ct2, abs_err);
            
            if duration < ct1 % left side of short anchor
                [lower,~] = get_perception_CI(threshold, abs_err, ct1);
                if duration > lower
                    ct1_prop = 1;
                else
                    [ct1_prop_duration, ~] = get_scalar_perception_props(duration, ct1, ct2, abs_err);
                    [ct1_prop_lower, ~] = get_scalar_perception_props(lower, ct1, ct2, abs_err);
                    ct1_prop = 0.5 + 0.5 * ct1_prop_duration / ct1_prop_lower;
                end    
            elseif duration > ct2 % right side of the long anchor
                [~,upper] = get_perception_CI(threshold, abs_err, ct2);
                if duration < upper
                    ct1_prop = 0 ;
                else
                    [~, ct2_prop_duration] = get_scalar_perception_props(duration, ct1, ct2, abs_err);
                    [~, ct2_prop_upper] = get_scalar_perception_props(upper, ct1, ct2, abs_err);
                    ct1_prop = 1 - (0.5 + 0.5*(ct2_prop_duration / ct2_prop_upper)); 
                end
            else % middle of the anchors
                ct1_prop = ct1_prop / (ct1_prop + ct2_prop);
            end