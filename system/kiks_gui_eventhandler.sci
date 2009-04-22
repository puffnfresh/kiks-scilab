function [] = kiks_gui_eventhandler(win,x,y,ibut)

printf("Event handler %d\n", ibut);
if ibut == -1000 then
  kiks_quit;
end;

endfunction;
