function [init_result] = kiks_init(arena,colormask)

// Ouput variables initialisation (not found in input variables)
init_result=[];

// Number of arguments in function call
[%nargout,%nargin] = argn(0)

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------

global("KIKS_GUI_COLOR","KIKS_PORT","KIKS_COLOR_BACKGROUND","KIKS_OBJECT_BALL_SMALLRATIO","KIKS_ROBOT_RADIUS","KIKS_NET_BUFSIZ","KIKS_FID","KIKS_MMPERPIXEL","KIKS_ARENA_MX","KIKS_ARENA_MASK","KIKS_TIMESCALE","KIKS_ROBOT_DATA","KIKS_PROX_POS","KIKS_LIGHT_POS","KIKS_SPDC","KIKS_SESSIONACTIVE","KIKS_VERSION");
global("KIKS_2D_GRID","KIKS_ARENA_HDL","KIKS_RBT_HDL","KIKS_GUI_HDL","KIKS_RBTMASK","KIKS_RBTMASK_COL","KIKS_2DVISUALIZE","KIKS_WALL_WIDTH","KIKS_WALL_RENDER","KIKS_RBTLIST","KIKS_INT_LIMIT","KIKS_INTERPOLATE","KIKS_INT_LIST","KIKS_INT_CELL","KIKS_ACC_LIST","KIKS_ACC_CELL","KIKS_STAT_LIST","KIKS_STAT_CELL","KIKS_SENS_LIST","KIKS_SENS_CELL","KIKS_OBJS_CELL");
global("KIKS_PROX_DIR","KIKS_PROX_ANG","KIKS_RBT_BODY","KIKS_RBT_LAMP","KIKS_RBT_DIOD","KIKS_MONITOR_WIN","KIKS_MONITOR_ON");
global("KIKS_ROUNDOBJMASK","KIKS_ROUNDOBJMASK_COL","KIKS_ROUNDOBJECT","KIKS_ROUNDOBJECT_RADIUS");
global("KIKS_KSEND_CONSTANT","KIKS_CALIBRATE_BAUD","KIKS_REGCODE","KIKS_OBJECT_SMALLBALL_MASK_COL");
global("KIKS_MAX_SPEED","KIKS_WALL_CLOCK","KIKS_LINKTIME");
global("KIKS_PROX_NNET1","KIKS_PROX_NNET2","KIKS_PROX_NNET3","KIKS_PROX_NNET4","KIKS_PROX_NNET5","KIKS_PROX_NNET6","KIKS_PROX_NNET7","KIKS_PROX_NNET8","KIKS_PROX_MINRAND","KIKS_PROX_MAXRAND");
global("KIKS_PROX_NETBUF1","KIKS_PROX_NETBUF2","KIKS_PROX_NETBUF3","KIKS_PROX_NETBUF4","KIKS_PROX_NETBUF5","KIKS_PROX_NETBUF6","KIKS_PROX_NETBUF7","KIKS_PROX_NETBUF8");
global("KIKS_SIMPROX_MAXDIST","KIKS_SIMPROX_STEPLENGTH","KIKS_HALT_BOOL");
global("KIKS_OBJECT_LIGHT_RADIUS","KIKS_OBJECT_LIGHT","KIKS_OBJECT_LIGHT_MASK","KIKS_LIGHT_NNET_ARRAY","KIKS_PROX_NNET_ARRAY");
global("KIKS_OBJECT_BALL","KIKS_OBJECT_BALL_MASK","KIKS_OBJECT_BALL_MASK_COL","KIKS_OBJECT_BALL_RADIUS")
global("KIKS_COMP_LIST","KIKS_COMP_CELL","KIKS_COMPUTER_SPEED","KIKS_COMPUTER_SPEED_SIM","KIKS_COLOR_BACKGROUND","KIKS_COLOR_BALL","KIKS_COLOR_CYLINDER","KIKS_COLOR_ROBOT","KIKS_OBJECT_SMALLBALL","KIKS_OBJECT_SMALLBALL_RADIUS","KIKS_OBJECT_SMALLBALL_MASK");
global("KIKS_AMETHOD_CELL","KIKS_REMOTEKHEP_MTRX","KIKS_SIM_STEP","KIKS_SIM_PAUSE","KIKS_SIM_PROX_STEP","KIKS_K213_STEP","KIKS_502500","KIKS_1250","KIKS_GUI_LASTPOS","KIKS_SETTINGS_DIR","KIKS_AVAIL_NNET","KIKS_TRACE_MAX","KIKS_CALLSIGNS");
global("KIKS_ROUND_MASK_CELL","KIKS_ROUND_MASK","KIKS_MOVLOCK","KIKS_GRIPPER_ACTIVE");
global("KIKS_KIKSNET_PROTOCOL_VERSION","KIKS_HISTORY_HDL","KIKS_LOG_HISTORY","KIKS_STATUS_BUFFER","KIKS_STATUS_BUFFER_CNT","KIKS_KIKSNET_REPLY","KIKS_PROXIMITY_DIRECTIONS","KIKS_PROXIMITY_POSITIONS","KIKS_SIMPROX_STEPS","KIKS_TURRETS","KIKS_TOOLBOX_IMAGES","KIKS_ROBOT_DIAMETER","KIKS_ROBOT_DISTANCE_BETWEEN_WHEELS","KIKS_SIM_PROX_SCALE","KIKS_SIM_PROX_DIST","KIKS_LIC_CDE","KIKS_LIC_VFK","KIKS_LIC_LIC");

%v0 = getdate();%v0(3:5) = [];%v0(6) = %v0(6)+%v0(7)/1000;rand("seed",sum(100*%v0(1:6),"m"));

init_result = 0;
KIKS_GUI_HDL = [];

KIKS_VERSION = "2.2.0";
KIKS_KIKSNET_PROTOCOL_VE = 1;

KIKS_GUI_COLOR = [200/255,200/255,200/255];

KIKS_LIC_CDE = [];
KIKS_LIC_VFK = [];
KIKS_LIC_LIC = [];

KIKS_GRIPPER_ACTIVE = [];
%v0 = getdate();%v0(3:5) = [];%v0(6) = %v0(6)+%v0(7)/1000;rand("seed",sum(100*%v0(1:6),"m"));

// ! L.40: mtlb(kiks_preferences) can be replaced by kiks_preferences() or kiks_preferences whether kiks_preferences is an M-file or not
// !! L.40: Unknown function kiks_preferences not converted, original calling sequence used
kiks_preferences;// Load preferences
if mtlb_logic(mtlb_double(KIKS_MMPERPIXEL),"<",1) then
  error("KIKS_MMPERPIXEL cannot be less than 1!\nEdit kiks_preferences.m to change the value of KIKS_MMPERPIXEL.");
end;

// Check path
//try 
  // !! L.47: Matlab function path not yet converted
  // !! L.47: Matlab function path not yet converted
  // !! L.47: Matlab function path not yet converted, original calling sequence used
  //path(kiks_getpath(),mtlb(path));
  // !! L.48: Matlab function path not yet converted
  // !! L.48: Matlab function path not yet converted
  // !! L.48: Matlab function path not yet converted, original calling sequence used
  //path(kiks_getsystempath(),mtlb(path));
  // !! L.49: Matlab function path not yet converted
  // !! L.49: Matlab function path not yet converted
  // !! L.49: Matlab function path not yet converted, original calling sequence used
  //path(kiks_getpath()+"kMatlab",mtlb(path));
//catch 
  //error("Could not find KiKS path in Matlab path settings. Run kiks_setup from the kiks root directory.");
//end;
//if ~isempty(KIKS_SETTINGS_DIR) then // !! L.53: Matlab function path not yet converted
 // !! L.53: Matlab function path not yet converted
 // !! L.53: Matlab function path not yet converted, original calling sequence used
 //path(KIKS_SETTINGS_DIR,mtlb(path));end;// don''t need to save this

// !! L.55: Matlab function path not yet converted
// !! L.55: Matlab function path not yet converted
// !! L.55: Matlab function path not yet converted, original calling sequence used
//path(mtlb(path));// Let Matlab validate path settings   

// !! L.57: Matlab function findobj not yet converted, original calling sequence used
// L.57: Name conflict: function name changed from findobj to %findobj
h = findobj("Name","KiKS");
close(h);
if ~isempty(h) then
  // L.60: No simple equivalent, so mtlb_fprintf() is called
  mtlb_fprintf("<KiKS> warning:  A KiKS zombie session has been detected and terminated.\n");
  // L.61: No simple equivalent, so mtlb_fprintf() is called
  mtlb_fprintf("<KiKS> warning:  This usually happens when you have used the ''clear all'' command.\n");
end;

// define graphics and gui
// !! L.65: Unknown function kiks_gui not converted, original calling sequence used
KIKS_GUI_HDL = kiks_gui();
// !! L.66: Matlab function set not yet converted, original calling sequence used
// L.66: Name conflict: function name changed from set to %set
set(KIKS_GUI_HDL,"CloseRequestFcn","kiks_quit");
// !! L.67: Matlab function findobj not yet converted, original calling sequence used
// L.67: Name conflict: function name changed from findobj to %findobj
// !! L.67: Matlab function get not yet converted, original calling sequence used
// L.67: Name conflict: function name changed from get to %get
//scrn = get(findobj("type","root"),"screensize");
scrn = get(0,"screensize_px");
// !! L.68: Matlab function get not yet converted, original calling sequence used
// L.68: Name conflict: function name changed from get to %get
pos = get(KIKS_GUI_HDL,"position");
pos = mtlb_i(pos,2,mtlb_s(mtlb_s(mtlb_double(mtlb_e(scrn,4)),mtlb_double(mtlb_e(pos,4))),22));
pos = mtlb_i(pos,1,4);
// !! L.71: Matlab function set not yet converted, original calling sequence used
// L.71: Name conflict: function name changed from set to %set
set(KIKS_GUI_HDL,"position",pos);
KIKS_GUI_LASTPOS = pos;

kiks_gui_loghistory();
// L.74: Drawing events are not queued in Scilab
//drawnow

robotlist = makecell([0,0]);
robots = mtlb_dir(kiks_getpath()+"robots"+filesep()+"*.sci");
[nr,tmp] = size(robots);
for i = 1:nr
  robotlist(i).entries = strsubst(basename(robots(i).name),"_"," ");
end;

KIKS_TURRETS = makecell([0,0]);
turretlist = makecell([0,0]);
turrets = mtlb_dir(kiks_getpath()+"turrets"+filesep()+"*.sci");
[nr,tmp] = size(turrets);
for i = 1:nr
  turretname = basename(turrets(i).name);
  // !! L.89: Verify that expression evaluated by execstr() is Scilab compatible
  id = evstr(turretname+"()");
  KIKS_TURRETS(id).entries = turretname;
  // !! L.91: Matlab function sprintf not yet converted, original calling sequence used
  // !! L.91: Unknown function kiks_status not converted, original calling sequence used
  kiks_status(sprintf("Turret #%d located (%s)",id,turretname));
end;
KIKS_KIKSNET_REPLY = "";
exec('robots'+filesep()+char(robotlist(1))+'.sci');

KIKS_MOVLOCK = 0;
// ! L.97: mtlb(KIKS_PROXIMITY_SENSORS_R) can be replaced by KIKS_PROXIMITY_SENSORS_R() or KIKS_PROXIMITY_SENSORS_R whether KIKS_PROXIMITY_SENSORS_R is an M-file or not
KIKS_SIM_PROX_DIST = mtlb(KIKS_PROXIMITY_SENSORS_R);
KIKS_1250 = mtlb_imp(mtlb_double(KIKS_MMPERPIXEL),ceil(mtlb_double(KIKS_SIM_PROX_STEP)/mtlb_double(KIKS_MMPERPIXEL)),floor(mtlb_double(KIKS_SIM_PROX_DIST)/mtlb_double(KIKS_MMPERPIXEL)));
[tmp,sz] = size(KIKS_1250);
KIKS_1250 = KIKS_1250(2:sz);// don''t include (0,0)
KIKS_502500 = mtlb_imp(floor(50/mtlb_double(KIKS_MMPERPIXEL)),ceil(mtlb_double(KIKS_K213_STEP)/mtlb_double(KIKS_MMPERPIXEL)),floor(500/mtlb_double(KIKS_MMPERPIXEL)));
KIKS_HALT_BOOL = 0;
KIKS_MAX_SPEED = 2;
KIKS_WALL_CLOCK = 1;
KIKS_COMPUTER_SPEED = 0;
KIKS_FID = -1;
KIKS_NET_BUFSIZ = 65535;
// !! L.108: Unknown function kiks_load_settings not converted, original calling sequence used
retstr = kiks_load_settings();

// !! L.110: Matlab function ver not yet converted
// !! L.110: Matlab function ver not yet converted, original calling sequence used
//KIKS_TOOLBOX_IMAGES = ver("images");

// !! L.112: Matlab function ver not yet converted
// !! L.112: Matlab function ver not yet converted, original calling sequence used
//nv = ver("nnet");
//if ~isempty(nv) then
//  // !! L.114: Matlab function which not yet converted, original calling sequence used
//  netpath1 = which("nnet_prox1.mat");
//  // !! L.115: Matlab function which not yet converted, original calling sequence used
//  netpath2 = which("nnet_prox2.mat");
//  // !! L.116: Matlab function which not yet converted, original calling sequence used
//  netpath3 = which("nnet_prox3.mat");
//  // !! L.117: Matlab function which not yet converted, original calling sequence used
//  netpath4 = which("nnet_prox4.mat");
//  // !! L.118: Matlab function which not yet converted, original calling sequence used
//  netpath5 = which("nnet_prox5.mat");
//  // !! L.119: Matlab function which not yet converted, original calling sequence used
//  netpath6 = which("nnet_prox6.mat");
//  // !! L.120: Matlab function which not yet converted, original calling sequence used
//  netpath7 = which("nnet_prox7.mat");
//  // !! L.121: Matlab function which not yet converted, original calling sequence used
//  netpath8 = which("nnet_prox8.mat");
//  if bool2s(~isempty(netpath1))&bool2s(bool2s(~isempty(netpath2))&bool2s(bool2s(~isempty(netpath3))&bool2s(bool2s(~isempty(netpath4))&bool2s(bool2s(~isempty(netpath5))&bool2s(bool2s(~isempty(netpath6))&bool2s(bool2s(~isempty(netpath7))&bool2s(~isempty(netpath8)))))))) then
//    KIKS_AVAIL_NNET = 1;
//    loadmatfile(netpath1);  // ! L.124: mtlb(net) can be replaced by net() or net whether net is an M-file or not
//    KIKS_PROX_NNET1 = mtlb(net);
//    loadmatfile(netpath2);  // ! L.125: mtlb(net) can be replaced by net() or net whether net is an M-file or not
//    KIKS_PROX_NNET2 = mtlb(net);
//    loadmatfile(netpath3);  // ! L.126: mtlb(net) can be replaced by net() or net whether net is an M-file or not
//    KIKS_PROX_NNET3 = mtlb(net);
//    loadmatfile(netpath4);  // ! L.127: mtlb(net) can be replaced by net() or net whether net is an M-file or not
//    KIKS_PROX_NNET4 = mtlb(net);
//    loadmatfile(netpath5);  // ! L.128: mtlb(net) can be replaced by net() or net whether net is an M-file or not
//    KIKS_PROX_NNET5 = mtlb(net);
//    loadmatfile(netpath6);  // ! L.129: mtlb(net) can be replaced by net() or net whether net is an M-file or not
//    KIKS_PROX_NNET6 = mtlb(net);
//    loadmatfile(netpath7);  // ! L.130: mtlb(net) can be replaced by net() or net whether net is an M-file or not
//    KIKS_PROX_NNET7 = mtlb(net);
//    loadmatfile(netpath8);  // ! L.131: mtlb(net) can be replaced by net() or net whether net is an M-file or not
//    KIKS_PROX_NNET8 = mtlb(net);
//  else
//    KIKS_AVAIL_NNET = 0;
//  end;
//else
//  KIKS_AVAIL_NNET = 0;
//end;
KIKS_AVAIL_NNET = 0;

loadmatfile(kiks_getsystempath()+"nnet_array.mat");
KIKS_SIMPROX_MAXDIST = KIKS_SIM_PROX_DIST;// mm to track
nnetarrsz = size(mtlb_double(KIKS_PROX_NNET_ARRAY));
KIKS_SIMPROX_STEPS = nnetarrsz($);
nnetsteps = nnetarrsz($)-1;
nnetsteplen = 50/nnetsteps;
KIKS_SIM_PROX_SCALE = nnetsteplen*(mtlb_double(KIKS_SIM_PROX_DIST)/50);

KIKS_PROX_MINRAND = 0.9;
KIKS_PROX_MAXRAND = 1;

if isempty(KIKS_KSEND_CONSTANT) then
  // Could not find computer-specific settings
  KIKS_KSEND_CONSTANT = 0;
  KIKS_CALIBRATE_BAUD = 0;
end;

cde = 0;
lic = 0;
vfk = 0;
name = "";
org = "";
email = "";
reginfo = "";
KIKS_REGCODE = [];
// !! L.164: Matlab function which not yet converted, original calling sequence used
//datapath = which("kiks_reginfo.mat");
cde = "UNREGISTERED";
// !! L.166: Matlab function sprintf not yet converted, original calling sequence used
// !! L.166: Unknown function kiks_status not converted, original calling sequence used
kiks_status(sprintf(" \nKiKS v%s (c) 2000-2004 Theodor Storm <theodor@tstorm.se>\nhttp://www.tstorm.se\nMany thanks to Peter Rydesäter (Peter.Rydesater@mh.se)\nfor the Matlab tcp/ip toolbox. Download the latest version at\nhttp://petrydpc.ite.mh.se/tools/.\n",KIKS_VERSION));

//if ~isempty(datapath) then
//  loadmatfile(datapath);
//  KIKS_LIC_CDE = cde;
//  KIKS_LIC_VFK = vfk;
//  KIKS_LIC_LIC = lic;
//  KIKS_REGCODE = cde;
//end;

KIKS_REGCODE = cde;

KIKS_SESSIONACTIVE = 1;
// !! L.179: Unknown function kiks_status not converted, original calling sequence used
kiks_status(retstr);

KIKS_MONITOR_WIN = [];
KIKS_MONITOR_ON = [];
KIKS_REMOTEKHEP_MTRX = [];

prox_dir = [90,45,10,-10,-45,-90,180,-180];
prox_ang = [-68,-43,-13,13,43,68,158,-158];
KIKS_PROX_DIR = (%pi/180)*prox_dir;
KIKS_PROX_ANG = (%pi/180)*prox_ang;
num = 0;

KIKS_COLOR_BACKGROUND = [0.25,0.3,0.35];

KIKS_SIM_STEP = 0;
KIKS_SIM_PAUSE = 0;
KIKS_COMPUTER_SPEED_SIM = 1;
KIKS_LINKTIME = 0;
KIKS_2D_GRID = 0;
KIKS_WALL_WIDTH = 128;// mm
KIKS_WALL_RENDER = 0;// mm
KIKS_RBTLIST = makecell([0,0]);
KIKS_INT_LIMIT = 25;
KIKS_INTERPOLATE = 1;
KIKS_INT_CELL = makecell([1,8],"1 mm","2 mm","5 mm","10 mm","15 mm","20 mm","25 mm","no limit");

KIKS_INT_LIST = [1,2,5,10,15,20,25,0];
KIKS_ACC_CELL = makecell([1,2],"Wall clock (simplistic)","High precision (realistic)");
KIKS_ACC_LIST = [1,-1];
KIKS_STAT_LIST = [10,15,20,25,30,40,0];
KIKS_STAT_CELL = makecell([1,7],"10 updates/sec","15 updates/sec","20 updates/sec","25 updates/sec","30 updates/sec","40 updates/sec","no limit");
KIKS_SENS_LIST = [1,2,5,10];
KIKS_SENS_CELL = makecell([1,4],"1 mm","2 mm","5 mm","10 mm");
KIKS_OBJS_CELL = makecell([1,3],"light","ball","cylinder");
KIKS_COMP_LIST = [20.33,15.11,10.25,10.01,5.87,5.7,5.47,4.39,3.27,3.18];
KIKS_COMP_CELL = makecell([1,10],"143Mhz UltraSPARC","300Mhz Celeron-A","300Mhz UltraSPARC-II","450Mhz Celeron-A","733Mhz Pentium III","900Mhz Celeron II","800Mhz Pentium III EB","1Ghz Pentium III","1.2Ghz AMD Athlon","1.4Ghz AMD Athlon");
KIKS_AMETHOD_CELL = makecell([1,2],"emulate CPU speed","target speed: 100%");

res = 0;

KIKS_TIMESCALE = -1;
KIKS_2DVISUALIZE = 0;// set to higher than 0 to draw arena

// !! L.222: Unknown function kiks_set_robot_data not converted, original calling sequence used
kiks_set_robot_data;

// general mask for round objects
max_radius = 100;
MX = mtlb_a(floor(max_radius/mtlb_double(KIKS_MMPERPIXEL))*2,1);
MY = mtlb_a(floor(max_radius/mtlb_double(KIKS_MMPERPIXEL))*2,1);
KIKS_ROUND_MASK_CELL = cell(1,100);
// ! L.229: real(MX) may be replaced by:
// !    --> MX if MX is Real
// ! L.229: real(MY) may be replaced by:
// !    --> MY if MY is Real
KIKS_ROUND_MASK = zeros(real(MX),real(MY));
for x = mtlb_imp(1,MX)
  for y = mtlb_imp(1,MY)
    if mtlb_logic(sqrt(mtlb_a(mtlb_s(x,mtlb_a(MX,1)/2)*mtlb_s(x,mtlb_a(MX,1)/2),mtlb_s(y,mtlb_a(MY,1)/2)*mtlb_s(y,mtlb_a(MY,1)/2))),"<=",max_radius/mtlb_double(KIKS_MMPERPIXEL)) then KIKS_ROUND_MASK(x,y) = 1;end;
  end;
end;

KIKS_PORT = 0;

KIKS_ROUNDOBJECT_RADIUS = 16;
KIKS_ROUNDOBJECT(1,:) = (KIKS_ROUNDOBJECT_RADIUS/mtlb_double(KIKS_MMPERPIXEL))*cos(%pi/4:%pi/4:2*%pi);
KIKS_ROUNDOBJECT(2,:) = -(KIKS_ROUNDOBJECT_RADIUS/mtlb_double(KIKS_MMPERPIXEL))*sin(%pi/4:%pi/4:2*%pi);

KIKS_OBJECT_LIGHT_RADIUS = 16;

KIKS_OBJECT_LIGHT(1,:) = cos(%pi/10:%pi/10:2*%pi);
KIKS_OBJECT_LIGHT(2,:) = sin(%pi/10:%pi/10:2*%pi);
[tmp,sz] = size(KIKS_OBJECT_LIGHT(1,:));
KIKS_OBJECT_LIGHT(1,2:2:sz) = KIKS_OBJECT_LIGHT(1,2:2:sz)*(KIKS_OBJECT_LIGHT_RADIUS/mtlb_double(KIKS_MMPERPIXEL));
KIKS_OBJECT_LIGHT(2,2:2:sz) = KIKS_OBJECT_LIGHT(2,2:2:sz)*(KIKS_OBJECT_LIGHT_RADIUS/mtlb_double(KIKS_MMPERPIXEL));
KIKS_OBJECT_LIGHT(1,1:2:sz) = KIKS_OBJECT_LIGHT(1,1:2:sz)*mtlb_s(KIKS_OBJECT_LIGHT_RADIUS/mtlb_double(KIKS_MMPERPIXEL),(KIKS_OBJECT_LIGHT_RADIUS*0.66)/mtlb_double(KIKS_MMPERPIXEL));
KIKS_OBJECT_LIGHT(2,1:2:sz) = KIKS_OBJECT_LIGHT(2,1:2:sz)*mtlb_s(KIKS_OBJECT_LIGHT_RADIUS/mtlb_double(KIKS_MMPERPIXEL),(KIKS_OBJECT_LIGHT_RADIUS*0.66)/mtlb_double(KIKS_MMPERPIXEL));

MX = mtlb_a(floor(KIKS_OBJECT_LIGHT_RADIUS/mtlb_double(KIKS_MMPERPIXEL))*2,1);
MY = mtlb_a(floor(KIKS_OBJECT_LIGHT_RADIUS/mtlb_double(KIKS_MMPERPIXEL))*2,1);
// !! L.254: Unknown function kiks_scale not converted, original calling sequence used
KIKS_OBJECT_LIGHT_MASK = kiks_scale(KIKS_ROUND_MASK,MX,MY);

KIKS_OBJECT_BALL_RADIUS = 32;
KIKS_OBJECT_BALL_SMALLRA = 1/2;
KIKS_OBJECT_BALL(1,:) = (KIKS_OBJECT_BALL_RADIUS/mtlb_double(KIKS_MMPERPIXEL))*cos(%pi/8:%pi/8:2*%pi);
KIKS_OBJECT_BALL(2,:) = -(KIKS_OBJECT_BALL_RADIUS/mtlb_double(KIKS_MMPERPIXEL))*sin(%pi/8:%pi/8:2*%pi);
MX = mtlb_a(floor(KIKS_OBJECT_BALL_RADIUS/mtlb_double(KIKS_MMPERPIXEL))*2,1);
MY = mtlb_a(floor(KIKS_OBJECT_BALL_RADIUS/mtlb_double(KIKS_MMPERPIXEL))*2,1);
// !! L.262: Unknown function kiks_scale not converted, original calling sequence used
KIKS_OBJECT_BALL_MASK = kiks_scale(KIKS_ROUND_MASK,MX,MY);
KIKS_OBJECT_BALL_MASK_CO = mtlb_double(KIKS_OBJECT_BALL_MASK)*mtlb_double(KIKS_COLOR_BALL);

KIKS_OBJECT_SMALLBALL_RA = floor(KIKS_OBJECT_BALL_RADIUS*KIKS_OBJECT_BALL_SMALLRA);
KIKS_OBJECT_SMALLBALL(1,:) = (KIKS_OBJECT_SMALLBALL_RA/mtlb_double(KIKS_MMPERPIXEL))*cos(%pi/8:%pi/8:2*%pi);
KIKS_OBJECT_SMALLBALL(2,:) = -(KIKS_OBJECT_SMALLBALL_RA/mtlb_double(KIKS_MMPERPIXEL))*sin(%pi/8:%pi/8:2*%pi);
MX = mtlb_a(floor(KIKS_OBJECT_SMALLBALL_RA/mtlb_double(KIKS_MMPERPIXEL))*2,1);
MY = mtlb_a(floor(KIKS_OBJECT_SMALLBALL_RA/mtlb_double(KIKS_MMPERPIXEL))*2,1);
// !! L.270: Unknown function kiks_scale not converted, original calling sequence used
KIKS_OBJECT_SMALLBALL_MA = kiks_scale(KIKS_ROUND_MASK,MX,MY);
KIKS_OBJECT_SMALLBALL_MA = mtlb_double(KIKS_OBJECT_SMALLBALL_MA)*mtlb_double(KIKS_COLOR_CYLINDER);

MX = mtlb_a(2*floor(KIKS_ROUNDOBJECT_RADIUS/mtlb_double(KIKS_MMPERPIXEL)),1);
MY = MX;
// !! L.275: Unknown function kiks_scale not converted, original calling sequence used
KIKS_ROUNDOBJMASK = kiks_scale(KIKS_ROUND_MASK,MY,MX);
KIKS_ROUNDOBJMASK_COL = mtlb_double(KIKS_ROUNDOBJMASK)*mtlb_double(KIKS_COLOR_CYLINDER);

if %nargin<1 then arena = [];end;
if %nargin<2 then colormask = [];end;

//KIKS_PROX_NNET_ARRAY = double(mtlb_double(KIKS_PROX_NNET_ARRAY));


// !! L.285: Matlab function findobj not yet converted, original calling sequence used
// L.285: Name conflict: function name changed from findobj to %findobj
h = findobj("Tag","kheppopup");
// !! L.286: Matlab function set not yet converted, original calling sequence used
// L.286: Name conflict: function name changed from set to %set
if type(h) == 9 then
  set(h,"String",KIKS_RBTLIST);
end;
// !! L.287: Matlab function findobj not yet converted, original calling sequence used
// L.287: Name conflict: function name changed from findobj to %findobj
h = findobj("Tag","timescale_popup");
// !! L.288: Matlab function set not yet converted, original calling sequence used
// L.288: Name conflict: function name changed from set to %set
if type(h) == 9 then
  set(h,"string",KIKS_ACC_CELL);
end;
// !! L.289: Matlab function findobj not yet converted, original calling sequence used
// L.289: Name conflict: function name changed from findobj to %findobj
H = findobj("Tag","toggle2dvis");
// !! L.290: Matlab function set not yet converted, original calling sequence used
// L.290: Name conflict: function name changed from set to %set
if type(H) == 9 then
  set(H,"String","enable visualization");
end;
// !! L.291: Matlab function findobj not yet converted, original calling sequence used
// L.291: Name conflict: function name changed from findobj to %findobj
h = findobj("Tag","acceleration_method");
// !! L.292: Matlab function set not yet converted, original calling sequence used
// L.292: Name conflict: function name changed from set to %set
if type(h) == 9 then
  set(h,"string",KIKS_AMETHOD_CELL);
end;
// !! L.293: Unknown function kiks_setinterpolate not converted, original calling sequence used
kiks_setinterpolate;
kiks_gui_setlimitlistbox;
kiks_gui_getlimitlistbox;
kiks_gui_setstatlistbox;
kiks_gui_getstatlistbox;
kiks_gui_setobjlistbox;
kiks_gui_ixprox;
if KIKS_COMPUTER_SPEED>0 then
  // Insert this computers'' speed in the list
  ix = 1;
  [tmp,sz] = size(KIKS_COMP_CELL);
  while bool2s(ix<=sz)&bool2s(KIKS_COMPUTER_SPEED<KIKS_COMP_LIST(ix))
    ix = ix+1;
  end;
  for i = sz:-1:ix
    KIKS_COMP_CELL(1,i+1) = (KIKS_COMP_CELL(i))';
    KIKS_COMP_LIST(i+1) = KIKS_COMP_LIST(i);
  end;

  KIKS_COMP_CELL(1,ix) = makecell([1,1],"This CPU (emulation off)");
  KIKS_COMP_LIST = mtlb_i(KIKS_COMP_LIST,ix,KIKS_COMPUTER_SPEED);
  kiks_gui_setcomplistbox(ix);
else
  [tmp,sz] = size(KIKS_COMP_CELL);
  for i = sz:-1:1
    KIKS_COMP_CELL(1,i+1) = (KIKS_COMP_CELL(i))';
    KIKS_COMP_LIST(i+1) = KIKS_COMP_LIST(i);
  end;
  KIKS_COMP_CELL(1,1) = makecell([1,1],"This CPU (off)");
  KIKS_COMP_LIST = mtlb_i(KIKS_COMP_LIST,1,0);
  kiks_gui_setcomplistbox(1);
end;
kiks_gui_getcomplistbox;
kiks_gui_settimescale;
kiks_gui_gettimescale;

// !! L.329: Matlab function findobj not yet converted, original calling sequence used
// L.329: Name conflict: function name changed from findobj to %findobj
h = findobj("Tag","compspeed_popup");
if KIKS_COMPUTER_SPEED==0 then
  // !! L.331: Matlab function set not yet converted, original calling sequence used
  // L.331: Name conflict: function name changed from set to %set
  set(h,"Enable","off");
else
  // !! L.333: Matlab function set not yet converted, original calling sequence used
  // L.333: Name conflict: function name changed from set to %set
  set(h,"Enable","on");
end;
kiks_gui_getaccmethod;
// !! L.336: Matlab function findobj not yet converted, original calling sequence used
// L.336: Name conflict: function name changed from findobj to %findobj
h = findobj("Tag","simulate_popup");
// !! L.337: Matlab function set not yet converted, original calling sequence used
// L.337: Name conflict: function name changed from set to %set
set(h,"String",robotlist);
// !! L.338: Matlab function set not yet converted, original calling sequence used
// L.338: Name conflict: function name changed from set to %set
set(h,"Val",1);

// !! L.340: Matlab function findobj not yet converted, original calling sequence used
// L.340: Name conflict: function name changed from findobj to %findobj
h = findobj("Tag","version");
// !! L.341: Matlab function sprintf not yet converted, original calling sequence used
// !! L.341: Matlab function set not yet converted, original calling sequence used
// L.341: Name conflict: function name changed from set to %set
set(h,"string",sprintf("v%s",KIKS_VERSION));

// !! L.343: Matlab function findobj not yet converted, original calling sequence used
// L.343: Name conflict: function name changed from findobj to %findobj
h = findobj("Tag","version");

kiks_arena(arena,colormask);
// !! L.346: Matlab function findobj not yet converted, original calling sequence used
// L.346: Name conflict: function name changed from findobj to %findobj
H = findobj("type","patch");
mtlb_delete(H);
kiks_arena_window_open;

[res,onlineversion] = kiks_checkversion();

if bool2s(res==1)&bool2s(bool2s(mtlb_strcmp(KIKS_VERSION,onlineversion))==0) then
  // !! L.353: Matlab function sprintf not yet converted, original calling sequence used
  // !! L.353: Matlab function msgbox not yet converted, original calling sequence used
  msg = msgbox(sprintf("KiKS %s is available for download at http://www.tstorm.se",onlineversion),"New KiKS version available");
end;

if res==(-1) then
  init_result = -1;
end;

if bool2s(KIKS_REGCODE=="UNREGISTERED")~=1 then
  // !! L.361: Matlab function findobj not yet converted, original calling sequence used
  // L.361: Name conflict: function name changed from findobj to %findobj
  h = findobj("Tag","reginfo");
  // !! L.362: Matlab function set not yet converted, original calling sequence used
  // L.362: Name conflict: function name changed from set to %set
  set(h,"string",KIKS_REGCODE);
else
  // !! L.364: Unknown function kiks_tou not converted, original calling sequence used
  addinfo = kiks_tou([]);
end;
//kiks_status([sprintf(addinfo) 10]);
endfunction
