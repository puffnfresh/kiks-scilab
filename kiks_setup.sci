function [] = kiks_setup()

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);


// Update Matlab path
// !! L.4: Matlab function which not yet converted, original calling sequence used
// kpath = which("kiks_setup");
k2path = getcwd() + filesep();
//i = max(size(mtlb_double(kpath)));
//while bool2s(mtlb_logic(mtlb_double(mtlb_e(kpath,i)),"~=",asciimat("\")))&bool2s(mtlb_logic(mtlb_double(mtlb_e(kpath,i)),"~=",asciimat("/"))) i = i-1;end;
//k2path = "";
//for j = 1:i
//  k2path = k2path+mtlb_e(kpath,j);
//end;
kikspath = k2path;
systempath = k2path+"system";
siminfopath = k2path+"siminfo";
kmatlabpath = k2path+"kMatlab";
turretspath = k2path+"turrets";
robotspath = k2path+"robots";
// !! L.17: Matlab function path not yet converted
// !! L.17: Matlab function path not yet converted
// !! L.17: Matlab function path not yet converted, original calling sequence used
//path(kmatlabpath,mtlb(path));
// !! L.18: Matlab function path not yet converted
// !! L.18: Matlab function path not yet converted
// !! L.18: Matlab function path not yet converted, original calling sequence used
//path(siminfopath,mtlb(path));
// !! L.19: Matlab function path not yet converted
// !! L.19: Matlab function path not yet converted
// !! L.19: Matlab function path not yet converted, original calling sequence used
//path(robotspath,mtlb(path));
// !! L.20: Matlab function path not yet converted
// !! L.20: Matlab function path not yet converted
// !! L.20: Matlab function path not yet converted, original calling sequence used
//path(turretspath,mtlb(path));
// !! L.21: Matlab function path not yet converted
// !! L.21: Matlab function path not yet converted
// !! L.21: Matlab function path not yet converted, original calling sequence used
//path(systempath,mtlb(path));
// !! L.22: Matlab function path not yet converted
// !! L.22: Matlab function path not yet converted
// !! L.22: Matlab function path not yet converted, original calling sequence used
//path(kikspath,mtlb(path));
getd(kmatlabpath);
getd(siminfopath);
getd(robotspath);
getd(turretspath);
getd(systempath);
getd(kikspath);

%v0 = getdate();%v0(3:5) = [];%v0(6) = %v0(6)+%v0(7)/1000;t = %v0(1:6);

// ! L.25: mtlb(kiks_calibrate) can be replaced by kiks_calibrate() or kiks_calibrate whether kiks_calibrate is an M-file or not
// !! L.25: Unknown function kiks_calibrate not converted, original calling sequence used
kiks_calibrate;

// !! L.27: Matlab function pathtool not yet converted
// !! L.27: Matlab function pathtool not yet converted, original calling sequence used
//pathtool;
// !! L.28: Matlab function msgbox not yet converted, original calling sequence used
//msgbox("KiKS has updated the Matlab path settings and opened the Path Browser window. Be sure to save these settings for future sessions.");
// !! L.29: Matlab function path not yet converted
// !! L.29: Matlab function path not yet converted
// !! L.29: Matlab function path not yet converted, original calling sequence used
//path(mtlb(path));
endfunction
