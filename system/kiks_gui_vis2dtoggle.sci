function [] = kiks_gui_vis2dtoggle()

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------

global("KIKS_2DVISUALIZE","KIKS_GUI_HDL");
if isempty(KIKS_2DVISUALIZE) then
  return;
end;

if mtlb_logic(mtlb_double(KIKS_2DVISUALIZE),"==",0) then
  KIKS_2DVISUALIZE = 1;
  kiks_arena_window_open;
else
  KIKS_2DVISUALIZE = 0;
  kiks_arena_window_close;
end;
endfunction
