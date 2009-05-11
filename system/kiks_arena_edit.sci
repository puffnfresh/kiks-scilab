function [] = kiks_arena_edit(cancel)

// Number of arguments in function call
[%nargout,%nargin] = argn(0)

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

global("KIKS_ARENA_EDITING_MODE","KIKS_WALL_RENDER","KIKS_ARENA_EDITING_OBJECTNO","KIKS_ARENA_EDITING_STATE","KIKS_2D_GRID","KIKS_2D_GRID_OLD","KIKS_GUI_HDL","KIKS_GUI_ENABLED","KIKS_ARENA_EDITING","KIKS_BALLARRAY","KIKS_LIGHTARRAY","KIKS_RBTARRAY","KIKS_MMPERPIXEL","KIKS_ARENA_MASK_ORIG","KIKS_ARENA_COLORMASK_ORIG","KIKS_MMPERPIXEL_OLD");

if isempty(KIKS_ARENA_EDITING) then
  KIKS_ARENA_EDITING = 1;
  KIKS_ARENA_EDITING_MODE = 0;
  KIKS_ARENA_EDITING_STATE = 0;
  KIKS_ARENA_EDITING_OBJEC = 0;
  // !! L.9: Matlab function findobj not yet converted, original calling sequence used
  // L.9: Name conflict: function name changed from findobj to %findobj
  h = findobj("Type","uicontrol");
  // !! L.10: Matlab function get not yet converted, original calling sequence used
  // L.10: Name conflict: function name changed from get to %get
  KIKS_GUI_ENABLED = get(h,"Enable");
  // !! L.11: Matlab function set not yet converted, original calling sequence used
  // L.11: Name conflict: function name changed from set to %set
  set(h,"Enable","off");

  // !! L.13: Matlab function findobj not yet converted, original calling sequence used
  // L.13: Name conflict: function name changed from findobj to %findobj
  h = findobj("tag","arena_edit");
  // !! L.14: Matlab function get not yet converted, original calling sequence used
  // L.14: Name conflict: function name changed from get to %get
  p = get(h,"Position");
  // !! L.15: Matlab function set not yet converted, original calling sequence used
  // L.15: Name conflict: function name changed from set to %set
  set(h,"String","done");
  // !! L.16: Matlab function set not yet converted, original calling sequence used
  // L.16: Name conflict: function name changed from set to %set
  set(h,"Enable","on");
  // !! L.17: Matlab function findobj not yet converted, original calling sequence used
  // L.17: Name conflict: function name changed from findobj to %findobj
  h = findobj("tag","arena_new");
  // !! L.18: Matlab function set not yet converted, original calling sequence used
  // L.18: Name conflict: function name changed from set to %set
  set(h,"String","cancel");
  // !! L.19: Matlab function set not yet converted, original calling sequence used
  // L.19: Name conflict: function name changed from set to %set
  set(h,"Callback","kiks_arena_edit(1);");
  // !! L.20: Matlab function set not yet converted, original calling sequence used
  // L.20: Name conflict: function name changed from set to %set
  set(h,"Enable","on");
  // !! L.21: Matlab function findobj not yet converted, original calling sequence used
  // L.21: Name conflict: function name changed from findobj to %findobj
  // !! L.21: Matlab function set not yet converted, original calling sequence used
  // L.21: Name conflict: function name changed from set to %set
  set(findobj("tag","StaticText_arena"),"enable","on");
  // !! L.22: Matlab function findobj not yet converted, original calling sequence used
  // L.22: Name conflict: function name changed from findobj to %findobj
  // !! L.22: Matlab function set not yet converted, original calling sequence used
  // L.22: Name conflict: function name changed from set to %set
  set(findobj("tag","status"),"enable","on");
  // !! L.23: Matlab function findobj not yet converted, original calling sequence used
  // L.23: Name conflict: function name changed from findobj to %findobj
  h = findobj("tag","arena_edit_mode");
  // !! L.24: Matlab function set not yet converted, original calling sequence used
  // L.24: Name conflict: function name changed from set to %set
  set(h,"String","mode: draw");
  // !! L.25: Matlab function set not yet converted, original calling sequence used
  // L.25: Name conflict: function name changed from set to %set
  set(h,"visible","on");
  // !! L.26: Matlab function set not yet converted, original calling sequence used
  // L.26: Name conflict: function name changed from set to %set
  set(h,"Enable","on");

  // !! L.28: Matlab function findobj not yet converted, original calling sequence used
  // L.28: Name conflict: function name changed from findobj to %findobj
  h = findobj("tag","arena_load");
  // !! L.29: Matlab function set not yet converted, original calling sequence used
  // L.29: Name conflict: function name changed from set to %set
  set(h,"visible","off");
  // !! L.30: Matlab function findobj not yet converted, original calling sequence used
  // L.30: Name conflict: function name changed from findobj to %findobj
  h = findobj("tag","arena_save");
  // !! L.31: Matlab function set not yet converted, original calling sequence used
  // L.31: Name conflict: function name changed from set to %set
  set(h,"visible","off");
  // !! L.32: Matlab function findobj not yet converted, original calling sequence used
  // L.32: Name conflict: function name changed from findobj to %findobj
  h = findobj("tag","arena_checkpoint");
  // !! L.33: Matlab function set not yet converted, original calling sequence used
  // L.33: Name conflict: function name changed from set to %set
  set(h,"visible","off");
  // !! L.34: Matlab function findobj not yet converted, original calling sequence used
  // L.34: Name conflict: function name changed from findobj to %findobj
  h = findobj("tag","arena_reset");
  // !! L.35: Matlab function set not yet converted, original calling sequence used
  // L.35: Name conflict: function name changed from set to %set
  set(h,"visible","off");

  // !! L.37: Matlab function findobj not yet converted, original calling sequence used
  // L.37: Name conflict: function name changed from findobj to %findobj
  h = findobj("tag","arena_color_slider");
  // !! L.38: Matlab function set not yet converted, original calling sequence used
  // L.38: Name conflict: function name changed from set to %set
  set(h,"visible","on");
  // !! L.39: Matlab function set not yet converted, original calling sequence used
  // L.39: Name conflict: function name changed from set to %set
  set(h,"enable","on");
  // !! L.40: Matlab function get not yet converted, original calling sequence used
  // L.40: Name conflict: function name changed from get to %get
  v = get(h,"Value");  // !! L.40: Matlab function set not yet converted, original calling sequence used
  // L.40: Name conflict: function name changed from set to %set
  set(h,"BackgroundColor",[mtlb_double(v)/255,mtlb_double(v)/255,mtlb_double(v)/255]);

  KIKS_MMPERPIXEL_OLD = KIKS_MMPERPIXEL;
  KIKS_2D_GRID_OLD = KIKS_2D_GRID;
  KIKS_2D_GRID = 1;
  // delete robots
  while size(mtlb_logic(mtlb_double(KIKS_RBTARRAY),">",0))
    // !! L.47: Unknown function kiks_delete_robot not converted, original calling sequence used
    kiks_delete_robot(mtlb_e(KIKS_RBTARRAY,1));
  end;

  // delete lights
  while size(mtlb_logic(mtlb_double(KIKS_LIGHTARRAY),">",0))
    // !! L.52: Unknown function kiks_delete_object not converted, original calling sequence used
    kiks_delete_object(mtlb_e(KIKS_LIGHTARRAY,1),1);
  end;

  // delete balls
  while size(mtlb_logic(mtlb_double(KIKS_BALLARRAY),">",0))
    // ! L.57: mtlb(KIKS_BALLDATA) can be replaced by KIKS_BALLDATA() or KIKS_BALLDATA whether KIKS_BALLDATA is an M-file or not
    // !! L.57: Unknown function KIKS_BALLDATA not converted, original calling sequence used
    // !! L.57: Unknown function kiks_delete_object not converted, original calling sequence used
    kiks_delete_object(mtlb_e(KIKS_BALLARRAY,1),mtlb_a(2,mtlb_double(KIKS_BALLDATA(mtlb_e(KIKS_BALLARRAY,1),5))));
  end;

  KIKS_MMPERPIXEL = 1;
  // ! L.61: mtlb(KIKS_ARENA_COLORMASK_ORI) can be replaced by KIKS_ARENA_COLORMASK_ORI() or KIKS_ARENA_COLORMASK_ORI whether KIKS_ARENA_COLORMASK_ORI is an M-file or not
  kiks_arena(KIKS_ARENA_MASK_ORIG,mtlb(KIKS_ARENA_COLORMASK_ORI),1);
  // !! L.62: Matlab function findobj not yet converted, original calling sequence used
  // L.62: Name conflict: function name changed from findobj to %findobj
  h = findobj("tag","arena_grid");
  // !! L.63: Matlab function set not yet converted, original calling sequence used
  // L.63: Name conflict: function name changed from set to %set
  set(h,"enable","off");
  // !! L.64: Matlab function findobj not yet converted, original calling sequence used
  // L.64: Name conflict: function name changed from findobj to %findobj
  h = findobj("tag","arena_redraw");
  // !! L.65: Matlab function set not yet converted, original calling sequence used
  // L.65: Name conflict: function name changed from set to %set
  set(h,"enable","off");
else
  KIKS_ARENA_EDITING = [];
  KIKS_ARENA_EDITING_STATE = 0;
  KIKS_ARENA_EDITING_OBJEC = 0;
  KIKS_MMPERPIXEL = KIKS_MMPERPIXEL_OLD;
  KIKS_2D_GRID = KIKS_2D_GRID_OLD;

  // !! L.73: Matlab function findobj not yet converted, original calling sequence used
  // L.73: Name conflict: function name changed from findobj to %findobj
  polys = mtlb_sort(findobj("tag","WALL_POLYGON"));
  if %nargin==0 then
    // !! L.75: Unknown function kiks_status not converted, original calling sequence used
    kiks_status("Rendering arena...");
    for i = 1:max(size(mtlb_double(polys)))
      // !! L.77: Matlab function get not yet converted, original calling sequence used
      // L.77: Name conflict: function name changed from get to %get
      col = get(mtlb_e(polys,i),"Edgecolor");
      // !! L.78: Matlab function get not yet converted, original calling sequence used
      // L.78: Name conflict: function name changed from get to %get
      x = mtlb_s(mtlb_double(get(mtlb_e(polys,i),"xdata")),mtlb_double(KIKS_WALL_RENDER));
      // !! L.79: Matlab function get not yet converted, original calling sequence used
      // L.79: Name conflict: function name changed from get to %get
      y = mtlb_s(mtlb_double(get(mtlb_e(polys,i),"ydata")),mtlb_double(KIKS_WALL_RENDER));
      x = [x;x(1)];  y = [y;y(1)];
      minx = mtlb_min(x,"m");  maxx = mtlb_max(x,"m");
      miny = mtlb_min(y,"m");  maxy = mtlb_max(y,"m");
      for j = mtlb_imp(miny,maxy)
        xp = mtlb_imp(minx,maxx);
        // ! L.85: real(mtlb_a(mtlb_s(maxx,minx),1)) may be replaced by:
        // !    --> mtlb_a(mtlb_s(maxx,minx),1) if mtlb_a(mtlb_s(maxx,minx),1) is Real
        yp = ones(1,real(mtlb_a(mtlb_s(maxx,minx),1)))*j;
        // !! L.86: Matlab function inpolygon not yet converted, original calling sequence used
        in = inpolygon(xp,yp,x,y);
        KIKS_ARENA_MASK_ORIG(j,xp(in)) = mtlb_logic(mtlb_double(mtlb_e(col,1)),">",0);
        KIKS_ARENA_COLORMASK_ORI(j,xp(in)) = ceil(mtlb_double(mtlb_e(col,1))*255);
      end;
      // !! L.90: Matlab function sprintf not yet converted, original calling sequence used
      // !! L.90: Unknown function kiks_status not converted, original calling sequence used
      kiks_status(sprintf("Rendering arena... %.0f%%\n",(i/max(size(mtlb_double(polys))))*100));
    end;
  end;
  mtlb_delete(polys);

  // !! L.95: Matlab function findobj not yet converted, original calling sequence used
  // L.95: Name conflict: function name changed from findobj to %findobj
  h = findobj("type","uicontrol");
  for i = 1:max(size(mtlb_double(h)))
    // !! L.97: Matlab function set not yet converted, original calling sequence used
    // L.97: Name conflict: function name changed from set to %set
    set(mtlb_e(h,i),"Enable",char(mtlb_e(KIKS_GUI_ENABLED,i)));
  end;

  // !! L.100: Matlab function findobj not yet converted, original calling sequence used
  // L.100: Name conflict: function name changed from findobj to %findobj
  h = findobj("tag","arena_edit");
  // !! L.101: Matlab function set not yet converted, original calling sequence used
  // L.101: Name conflict: function name changed from set to %set
  set(h,"String","edit");

  // !! L.103: Matlab function findobj not yet converted, original calling sequence used
  // L.103: Name conflict: function name changed from findobj to %findobj
  h = findobj("tag","arena_new");
  // !! L.104: Matlab function set not yet converted, original calling sequence used
  // L.104: Name conflict: function name changed from set to %set
  set(h,"String","new");
  // !! L.105: Matlab function set not yet converted, original calling sequence used
  // L.105: Name conflict: function name changed from set to %set
  set(h,"Callback","kiks_arena_new");

  // !! L.107: Matlab function findobj not yet converted, original calling sequence used
  // L.107: Name conflict: function name changed from findobj to %findobj
  h = findobj("tag","arena_color_slider");
  // !! L.108: Matlab function set not yet converted, original calling sequence used
  // L.108: Name conflict: function name changed from set to %set
  set(h,"visible","off");

  // !! L.110: Matlab function findobj not yet converted, original calling sequence used
  // L.110: Name conflict: function name changed from findobj to %findobj
  h = findobj("tag","arena_edit_mode");
  // !! L.111: Matlab function set not yet converted, original calling sequence used
  // L.111: Name conflict: function name changed from set to %set
  set(h,"visible","off");

  // !! L.113: Matlab function findobj not yet converted, original calling sequence used
  // L.113: Name conflict: function name changed from findobj to %findobj
  h = findobj("tag","arena_load");
  // !! L.114: Matlab function set not yet converted, original calling sequence used
  // L.114: Name conflict: function name changed from set to %set
  set(h,"visible","on");
  // !! L.115: Matlab function findobj not yet converted, original calling sequence used
  // L.115: Name conflict: function name changed from findobj to %findobj
  h = findobj("tag","arena_save");
  // !! L.116: Matlab function set not yet converted, original calling sequence used
  // L.116: Name conflict: function name changed from set to %set
  set(h,"visible","on");
  // !! L.117: Matlab function findobj not yet converted, original calling sequence used
  // L.117: Name conflict: function name changed from findobj to %findobj
  h = findobj("tag","arena_checkpoint");
  // !! L.118: Matlab function set not yet converted, original calling sequence used
  // L.118: Name conflict: function name changed from set to %set
  set(h,"visible","on");
  // !! L.119: Matlab function findobj not yet converted, original calling sequence used
  // L.119: Name conflict: function name changed from findobj to %findobj
  h = findobj("tag","arena_reset");
  // !! L.120: Matlab function set not yet converted, original calling sequence used
  // L.120: Name conflict: function name changed from set to %set
  set(h,"visible","on");

  kiks_arena(KIKS_ARENA_MASK_ORIG,KIKS_ARENA_COLORMASK_ORI);
end;
endfunction
