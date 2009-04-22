function [ray_xvals,ray_yvals] = kiks_calculate_line(start,stop)

// Ouput variables initialisation (not found in input variables)
ray_xvals=[];
ray_yvals=[];

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);


[rad,deg,dist] = kiks_calculate_angle(start,stop);
ray_xvals = round(mtlb_a(mtlb_imp(0,dist)*cos(rad),mtlb_double(mtlb_e(start,1))));
ray_yvals = round(mtlb_a(mtlb_imp(0,dist)*sin(rad),mtlb_double(mtlb_e(start,2))));
endfunction
