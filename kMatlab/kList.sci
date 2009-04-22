function [] = kList(ref)

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

//KLIST   Display the list of commands of Khepera
// 
//kList(ref)
//  Use the reference obtained with kopen.

// Written by Yves Piguet, 9/98.

kcmd(ref,"list",1)
endfunction
