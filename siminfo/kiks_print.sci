function [] = kiks_print(str)

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------

// !! L.7: Unknown function kiks_status not converted, original calling sequence used
kiks_status(str,1);
endfunction
