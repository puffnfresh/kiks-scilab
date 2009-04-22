function [] = kStatus(ref)

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

//KSTATUS   Display the status of the motion controller
// 
//value = kStatus(ref)
//  Displays the 6 values corresponding to the motion controller
//  status.
//  Use the reference obtained with kopen.

values = kGetStatus(ref);

string = "Left:   ";
for i = 1:2
  string = string+"(status = ";
  if mtlb_logic(mtlb_double(mtlb_e(values,(i-1)*3+1)),"==",1) then
    string = string+"AT TARGET) ";
  else
    string = string+"MOVING)    ";
  end;
  string = string+"(control = ";
  if mtlb_logic(mtlb_double(mtlb_e(values,(i-1)*3+2)),"==",1) then
    string = string+"SPEED)    ";
  else
    string = string+"POSITION) ";
  end;
  // !! L.25: Matlab function sprintf not yet converted, original calling sequence used
  string = string+sprintf("(Error = %d)",mtlb_e(values,(i-1)*3+3));
  disp(string);
  string = "Right:  ";
end;
endfunction
