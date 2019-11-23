function [ct1_perception, ct2_perception] = update_perceptions(ct1_perception, ct2_perception,...
                                                               duration, choice_is_ct2,...
                                                               criterionTime1, criterionTime2,...
                                                               reinforcement, p_learning_rate, n_learning_rate)
    switch reinforcement
        case 'Anchors'
            if choice_is_ct2
                if  duration == criterionTime2
                    ct2_perception = (1 - p_learning_rate) * ct2_perception + p_learning_rate * criterionTime2;
                elseif duration > mean([ct1_perception, ct2_perception]) && duration < ct2_perception
                    r = 1 - (ct2_perception - duration)/((ct2_perception - ct1_perception)/2);

                    ct1_perception = (1 - n_learning_rate) * ct1_perception + n_learning_rate * ct1_perception * (1 + r);
                    ct2_perception = (1 - n_learning_rate) * ct2_perception + n_learning_rate * ct2_perception * (1 + r);
                end
            else 
                if  duration == criterionTime1
                    ct1_perception = (1 - p_learning_rate) * ct1_perception + p_learning_rate * criterionTime1;
                elseif duration > ct1_perception && duration < mean([ct2_perception,ct1_perception]) 
                    r = 1 - (duration - ct1_perception) / ((ct2_perception - ct1_perception)/2);

                    ct1_perception = (1 - n_learning_rate) * ct1_perception + n_learning_rate * ct1_perception * (1 - r);
                    ct2_perception = (1 - n_learning_rate) * ct2_perception + n_learning_rate * ct2_perception * (1 - r);
                end
            end
    end

end

