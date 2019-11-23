function choice = choose_ct1( ct1_perception, ct2_perception, duration, decision_rule, abs_err)

	switch decision_rule
        case 'Relative-Similarity'
            if duration < ct1_perception % left side of short anchor
                ct1_prop = 1;
            elseif duration > ct2_perception % right side of the long anchor
                ct1_prop = 0;
            else % middle of the anchors
                [ct1_prop, ct2_prop] = get_scalar_perception_props(duration, ct1_perception, ct2_perception, abs_err);
                ct1_prop = ct1_prop / (ct1_prop + ct2_prop);
            end
	end

    if rand < ct1_prop 
        choice = 1;
    else
        choice = 0;
    end
end

