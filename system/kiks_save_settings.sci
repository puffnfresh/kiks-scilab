function [retstr] = kiks_save_settings()

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

global("KIKS_SETTINGS_DIR","KIKS_COMPUTER_SPEED","KIKS_KSEND_CONSTANT","KIKS_CALIBRATE_BAUD","KIKS_KSEND_VARIATION")
retstr = "";
if ~isempty(KIKS_SETTINGS_DIR) then
  datapath = KIKS_SETTINGS_DIR+"/kiks_data.mat";
else
  // !! L.12: Matlab function which not yet converted, original calling sequence used
  datapath = getcwd() + filesep() + 'system' + filesep() + "kiks_data.mat";
end;

if ~isempty(datapath) then
  // !! L.16: Matlab function sprintf not yet converted, original calling sequence used
  // !! L.16: Unknown function kiks_status not converted, original calling sequence used
  kiks_status(sprintf("Saving settings to %s\n",datapath));
  try 
    savematfile(datapath,"KIKS_KSEND_CONSTANT","KIKS_CALIBRATE_BAUD","KIKS_KSEND_VARIATION","KIKS_COMPUTER_SPEED");
  catch 
    // !! L.20: Matlab function sprintf not yet converted, original calling sequence used
    // !! L.20: Unknown function kiks_status not converted, original calling sequence used
    kiks_status(sprintf("Error: Could not write to %s\n",datapath));
  end;
  return;
else
  if ~isempty(KIKS_SETTINGS_DIR) then
    savepath = KIKS_SETTINGS_DIR+"/"
  else
    savepath = kiks_getsystempath();
  end;

  savepath = savepath+"kiks_data.mat";
  // !! L.31: Matlab function sprintf not yet converted, original calling sequence used
  // !! L.31: Unknown function kiks_status not converted, original calling sequence used
  kiks_status(sprintf("Saving settings to %s\n",savepath));
  try 
    savematfile(savepath,"KIKS_KSEND_CONSTANT","KIKS_CALIBRATE_BAUD","KIKS_KSEND_VARIATION","KIKS_COMPUTER_SPEED");
  catch 
    // !! L.35: Matlab function sprintf not yet converted, original calling sequence used
    // !! L.35: Unknown function kiks_status not converted, original calling sequence used
    kiks_status(sprintf("Error: Could not write to %s\n",savepath));
  end;
end;
endfunction
