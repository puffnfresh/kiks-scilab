function [] = kiks_error(errstr)

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------


// !! L.8: Matlab function errordlg not yet converted, original calling sequence used
errordlg(errstr,"KiKS error");
endfunction
