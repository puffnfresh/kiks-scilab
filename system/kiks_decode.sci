function [cmd,values] = kiks_decode(dastr)

// Ouput variables initialisation (not found in input variables)
cmd=[];
values=[];

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

//   [cmd,values] = kiks_decode(dastr)
//   Decodes a message from ''CMD,arg1,arg2,arg3<endline>'' - format to
//   [CMD arg1 arg2 arg3] - format.
// 
// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------

cmd = mtlb_e(dastr,1);
i = 3;
numstr = "";
values = [];
pos = 1;

while i<=size(mtlb_double(dastr),2)
  if bool2s(bool2s(mtlb_logic(mtlb_double(mtlb_e(dastr,i)),"~=",asciimat(",")))&bool2s(mtlb_logic(mtlb_double(mtlb_e(dastr,i)),"~=",asciimat(char(10)))))&bool2s(mtlb_logic(mtlb_double(mtlb_e(dastr,i)),"~=",asciimat(char(13)))) then
    numstr = numstr+mtlb_e(dastr,i);
  else
    nr = evstr(numstr);
    if ~isempty(nr) then
      values(1,pos) = nr;
    end;
  
    numstr = "";
    pos = pos+1;
  end;
  i = i+1;
end;
endfunction
