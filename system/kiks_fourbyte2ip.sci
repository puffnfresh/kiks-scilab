function [res] = kiks_fourbyte2ip(val) // fourbyte is expected to be a signed integer

// Ouput variables initialisation (not found in input variables)
res=[];

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// !! L.3: Matlab function bitget not yet converted, original calling sequence used
// ! L.3: abs(mtlb_double(bitget(val,1:32))) may be replaced by:
// !    --> mtlb_double(bitget(val,1:32)) if mtlb_double(bitget(val,1:32)) is real
setbits = mtlb_find(abs(mtlb_double(bitget(val,1:32))));
// !! L.4: Matlab function bitset not yet converted, original calling sequence used
fourbyte = sum(mtlb_double(bitset(0,setbits)),"m");

// !! L.6: Matlab function bitshift not yet converted, original calling sequence used
// !! L.6: Matlab function bitshift not yet converted, original calling sequence used
shift1 = bitshift(bitshift(fourbyte,-8*3),8*3);
// !! L.7: Matlab function bitshift not yet converted, original calling sequence used
// !! L.7: Matlab function bitshift not yet converted, original calling sequence used
shift2 = bitshift(bitshift(fourbyte,-8*2),8*2);
// !! L.8: Matlab function bitshift not yet converted, original calling sequence used
// !! L.8: Matlab function bitshift not yet converted, original calling sequence used
shift3 = bitshift(bitshift(fourbyte,-8),8);

byte1 = mtlb_s(fourbyte,mtlb_double(shift3));
// !! L.11: Matlab function bitshift not yet converted, original calling sequence used
byte2 = bitshift(mtlb_s(mtlb_double(shift3),mtlb_double(shift2)),-8);
// !! L.12: Matlab function bitshift not yet converted, original calling sequence used
byte3 = bitshift(mtlb_s(mtlb_double(shift2),mtlb_double(shift1)),-8*2);
// !! L.13: Matlab function bitshift not yet converted, original calling sequence used
byte4 = bitshift(shift1,-8*3);

// !! L.15: Matlab function sprintf not yet converted, original calling sequence used
res = sprintf("%d.%d.%d.%d",byte4,byte3,byte2,byte1);
endfunction
