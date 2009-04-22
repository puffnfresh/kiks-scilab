function [bios,prot] = kversion(ref)

// Ouput variables initialisation (not found in input variables)
bios=[];
prot=[];

// Number of arguments in function call
[%nargout,%nargin] = argn(0)

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

//KVERSION   Read software version from Khepera
// 
//kversion(ref)
//  Display the versions of the BIOS and of the protocol.
//  Use the reference obtained with kopen.
//[vers_bios,vers_protocol] = kversion(ref)
//  Return the versions as strings.

// Written by Yves Piguet, 9/98.

reply = kcmd(ref,"B");
// L.13: No equivalent for findstr() in Scilab so mtlb_findstr() is called
i = mtlb_findstr(reply,",");
bios_string = mtlb_e(reply,i(1)+1:i(2)-1);
prot_string = mtlb_e(reply,i(2)+1:$);
// !! L.16: Matlab function sscanf not yet converted, original calling sequence used
values = sscanf(reply,"b,%f,%f");
bios = mtlb_e(values,1);
prot = mtlb_e(values,2);

if %nargout<=1 then // display nicely the versions
 // L.21: No simple equivalent, so mtlb_fprintf() is called
 mtlb_fprintf("Khepera BIOS version: %s\n",bios_string);
 // L.22: No simple equivalent, so mtlb_fprintf() is called
 mtlb_fprintf("Khepera protocol version: %s\n",prot_string);
end;
endfunction
