function [r] = kFlush(ref)

// Ouput variables initialisation (not found in input variables)
r=[];

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

//KFLUSH   Flush the buffer
//kflush(ref)
//  Use the reference obtained with kopen.
//  NOTE: this command waits for """"timeout"""" seconds and then displays
//        the buffer with """"Command not found"""" at the bottom.

disp("Buffer contents:")
disp(kcmd(ref," ",1))
endfunction
