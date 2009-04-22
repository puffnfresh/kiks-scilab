function [val] = kiks_mod(xval,modval) 

// Ouput variables initialisation (not found in input variables)
val=[];

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------

val = xval;
while mtlb_logic(mtlb_double(val),">=",mtlb_double(modval))
  val = mtlb_s(mtlb_double(val),mtlb_double(modval));
end;
while mtlb_logic(mtlb_double(val),"<",0)
  val = mtlb_a(mtlb_double(val),mtlb_double(modval));
end;
endfunction
