function [res] = kiks_speedtest(niter)

// Ouput variables initialisation (not found in input variables)
res=[];

// Number of arguments in function call
[%nargout,%nargin] = argn(0)

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------

// !! L.7: Unknown function kiks_status not converted, original calling sequence used
kiks_status("Testing Matlab speed on this computer");
if %nargin<1 then niter = 4;end;

res = %inf;
for iter = mtlb_imp(1,mtlb_double(niter))
  timer();
//  for i = 1:10
//    A = ones(i*10,i*10);
//    for j = 1:2:50
//      A(i:i*10-i,i:i*10-i) = j^j;
//      B = round(sin(A)*j);
//      C = round(cos(A)*j);
//      D = sqrt(mtlb_a(B*C,A));
//    end;
//    // !! L.21: Matlab function filter2 not yet converted, original calling sequence used
//    E = filter2([0,1,0;1,1,1;0,1,0]/5,mtlb_s(mtlb_s(mtlb_a(A,B),C),D));
//    // !! L.22: Unknown function kiks_status not converted, original calling sequence used
//    kiks_status("Testing Matlab speed on this computer"+char(ones(1,i)*asciimat(".")));
//  end;
  svd(ones(740, 740));
  bres = timer();
  // !! L.25: Matlab function sprintf not yet converted, original calling sequence used
  // !! L.25: Unknown function kiks_status not converted, original calling sequence used
  kiks_status(sprintf("Test #%d: %2.2f",iter,bres));
  if bres<res then res = bres;end;
end;
// !! L.28: Matlab function sprintf not yet converted, original calling sequence used
// !! L.28: Unknown function kiks_status not converted, original calling sequence used
kiks_status(sprintf("Best result: %2.2f, test finished.",res));
endfunction
