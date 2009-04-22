function [] = kiks_setmode(%mode)

// Number of arguments in function call
[%nargout,%nargin] = argn(0)

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

global("KIKS_ACTIVE_MODE")

if %nargin then
  KIKS_ACTIVE_MODE = 1;
  try 
    disp("Keyboard control transferred to KiKS.");
    while %t // ! L.8: mtlb(KIKS_SESSIONACTIVE) can be replaced by KIKS_SESSIONACTIVE() or KIKS_SESSIONACTIVE whether KIKS_SESSIONACTIVE is an M-file or not
     if mtlb(KIKS_SESSIONACTIVE) then break;end;
     xpause(1000*0.01);
    end;
  catch 
    disp("Keyboard control returned to Matlab.");
  end;
else
  KIKS_ACTIVE_MODE = [];
end;
endfunction
