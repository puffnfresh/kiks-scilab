function [retstr] = kiks_load_settings()

// Ouput variables initialisation (not found in input variables)
retstr=[];

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------

global("KIKS_COMPUTER_SPEED","KIKS_KSEND_CONSTANT","KIKS_CALIBRATE_BAUD","KIKS_KSEND_VARIATION","KIKS_COMPUTER_SPEED")
// loads computer-specific settings
retstr = "";
// !! L.10: Matlab function which not yet converted, original calling sequence used
datapath = getcwd() + filesep() + 'system' + filesep() + "kiks_data.mat";
if ~isempty(datapath) then
  // !! L.12: Matlab function sprintf not yet converted, original calling sequence used
  // !! L.12: Unknown function kiks_status not converted, original calling sequence used
  kiks_status(sprintf("Loading settings from %s\n",datapath));
  KIKS_COMPUTER_SPEED = 0;
  loadmatfile(getcwd() + filesep() + 'system' + filesep() + "kiks_data")
  if mtlb_logic(mtlb_double(KIKS_KSEND_CONSTANT),">",0) then
    // !! L.16: Matlab function sprintf not yet converted, original calling sequence used
    retstr = sprintf("Calibrated at %d baud (KIKS_KSEND_CONSTANT=%1.1f +-%1.1f%%)\nComputer speed index is %1.2f",KIKS_CALIBRATE_BAUD,KIKS_KSEND_CONSTANT,abs(mtlb_double(KIKS_KSEND_VARIATION)/(2*mtlb_double(KIKS_KSEND_CONSTANT)))*100,KIKS_COMPUTER_SPEED);
  else
    // !! L.18: Matlab function sprintf not yet converted, original calling sequence used
    retstr = sprintf("Computer speed index is %1.2f",KIKS_COMPUTER_SPEED);
  end;

  if KIKS_COMPUTER_SPEED==0 then
    retstr = retstr+"\nWarning: Computer speed not measured, please run kiks_calibrate again.\n<KiKS warning> Type ""help kiks_calibrate"" for more information.";
  end;

  return;
else
  KIKS_CALIBRATE_BAUD = 9600;
  KIKS_KSEND_CONSTANT = 0;
  KIKS_KSEND_VARIATION = 0;
  KIKS_COMPUTER_SPEED = 0;
  // !! L.31: Matlab function sprintf not yet converted, original calling sequence used
  retstr = sprintf("Warning: Could not load computer-specific settings;\n<KiKS warning> type ""help kiks_calibrate"" for more information.");
end;
endfunction
