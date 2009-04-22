function [res,ver] = kiks_checkversion()

// Ouput variables initialisation (not found in input variables)
res=[];
ver=[];

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------

global("KIKS_REGCODE");

res = 0;
ver = 0;
stopit = 0;
try 
  request = "GET /currentversion.htm HTTP/1.0"+13+10+"Host: www.tstorm.se"+13+10+13+10;
  // !! L.14: Unknown function tcpip_open not converted, original calling sequence used
  fid = tcpip_open("www.tstorm.se",80);
  // !! L.15: Unknown function kiks_status not converted, original calling sequence used
  kiks_status("Checking for available updates");
  if mtlb_logic(mtlb_double(fid),"~=",-1) then
    while ~isempty(request) // !! L.17: Unknown function tcpip_write not converted, original calling sequence used
     request = tcpip_write(fid,request);end;
    str = [];
    %v0_1 = getdate();  %v0_1(3:5) = [];  %v0_1(6) = %v0_1(6)+%v0_1(7)/1000;  t0 = %v0_1(1:6);
    lines = 0;
    version = [];
    xpause(1000*(1/3));
    // !! L.23: Unknown function kiks_status not converted, original calling sequence used
    kiks_status("Checking for available updates.");
    xpause(1000*(1/3));
    // !! L.25: Unknown function kiks_status not converted, original calling sequence used
    kiks_status("Checking for available updates..");
    xpause(1000*(1/3));
    // !! L.27: Unknown function kiks_status not converted, original calling sequence used
    kiks_status("Checking for available updates...");
  
    // !! L.29: Unknown function tcpip_read not converted, original calling sequence used
    str = tcpip_read(fid,1024);
    // !! L.30: Unknown function tcpip_status not converted, original calling sequence used
  
    if mtlb_logic(mtlb_double(tcpip_status(fid)),"~=",0) then // !! L.30: Unknown function tcpip_close not converted, original calling sequence used
     tcpip_close(fid);end;
    if ~isempty(str) then
      // L.32: No equivalent for findstr() in Scilab so mtlb_findstr() is called
      rs = mtlb_findstr(str,"KiKS");
      if ~isempty(rs) then
        version = mtlb_e(str,mtlb_imp(mtlb_a(rs,5),$));
      end;
    end;
    if ~isempty(version) then
      // !! L.38: Matlab function deblank not yet converted, original calling sequence used
      ver = deblank(version);
      res = 1;
    end;
    // !! L.41: Unknown function kiks_status not converted, original calling sequence used
    kiks_status("Checking for available updates... done.");
  else
    // !! L.43: Unknown function kiks_status not converted, original calling sequence used
    kiks_status("Checking for available updates... failed. No internet connection?");
  end;
catch 
  // !! L.46: Unknown function kiks_status not converted, original calling sequence used
  kiks_status("Warning: Could not find tcp/ip tools.");
end;
endfunction
