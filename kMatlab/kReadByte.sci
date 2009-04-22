function [r] = kReadByte(ref,address)

// Ouput variables initialisation (not found in input variables)
r=[];

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

//KREADBYTE   Read a byte from the extension bus
// 
//value = kReadByte(ref)
//  Read a byte from an address (0..63) on the extension bus
//  Use the reference obtained with kopen.

// !! L.8: Matlab function sprintf not yet converted, original calling sequence used
reply = kcmd(ref,sprintf("R,%d",round(mtlb_double(address))));
// !! L.9: Matlab function sscanf not yet converted, original calling sequence used
[value,count,errmsg] = sscanf(reply,"r,%d");
if isempty(errmsg) then
  r = value;
else
  r = -1;
end;
endfunction
