function [r] = kWriteByte(ref,data,address)

// Ouput variables initialisation (not found in input variables)
r=[];

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

//KWRITEBYTE   Write a byte to the extension bus
// 
//kWriteByte(ref,data,address)
//  Write a data byte to an address (0..63) on the extension bus
//  Use the communication parameters specified with kcmd.

// Written by Skye Legon 2/99

// !! L.10: Matlab function sprintf not yet converted, original calling sequence used
value = kcmd(ref,sprintf("W,%d,%d",round(mtlb_double(data)),round(mtlb_double(address))));
if mtlb_logic(mtlb_double(value),"==",asciimat("w")) then
  r = 0;
else
  r = -1;
end;
endfunction
