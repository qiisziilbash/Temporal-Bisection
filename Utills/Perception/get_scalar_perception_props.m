function [ct1_prop, ct2_prop] = get_scalar_perception_props(duration, ct1, ct2, absolute_error)
    
    pdf = normpdf([1 duration/ct1] ,duration/ct1,  absolute_error*duration/ct1);
    ct1_prop = pdf(1) / pdf(2);
    
    pdf = normpdf([1 duration/ct2] ,duration/ct2,  absolute_error*duration/ct2);
    ct2_prop = pdf(1) / pdf(2);
  
end

