function [] = kiks_setdiod(id,dnr,status)

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------

global("KIKS_RBTDIOD_HDL");

// !! L.9: Matlab function get not yet converted, original calling sequence used
// L.9: Name conflict: function name changed from get to %get
a = %get(KIKS_RBTDIOD_HDL(id,mtlb_a(mtlb_double(dnr),1)),"Facecolor");
// !! L.10: Matlab function set not yet converted, original calling sequence used
// L.10: Name conflict: function name changed from set to %set
%set(KIKS_RBTDIOD_HDL(id,mtlb_a(mtlb_double(dnr),1)),"Visible","off");
// !! L.11: Matlab function set not yet converted, original calling sequence used
// L.11: Name conflict: function name changed from set to %set
%set(KIKS_RBTDIOD_HDL(id,mtlb_a(mtlb_double(dnr),1)),"Tag","deleteme");

select status
  case 0 then
    // !! L.14: Unknown function KIKS_RBTdiodpatch not converted, original calling sequence used
    KIKS_RBTDIOD_HDL(id,mtlb_a(mtlb_double(dnr),1)) = KIKS_RBTdiodpatch(id,[0.3,0.9,0.3]);
  case 1 then
    // !! L.16: Unknown function KIKS_RBTdiodpatch not converted, original calling sequence used
    KIKS_RBTDIOD_HDL(id,mtlb_a(mtlb_double(dnr),1)) = KIKS_RBTdiodpatch(id,[1,0.4,0.4]);
  case 2 then
    if mtlb_logic(mtlb_double(a),"==",[1,0.4,0.4]) then
      // !! L.19: Unknown function KIKS_RBTdiodpatch not converted, original calling sequence used
      KIKS_RBTDIOD_HDL(id,mtlb_a(mtlb_double(dnr),1)) = KIKS_RBTdiodpatch(id,[0.3,0.9,0.3]);
    else
      // !! L.21: Unknown function KIKS_RBTdiodpatch not converted, original calling sequence used
      KIKS_RBTDIOD_HDL(id,mtlb_a(mtlb_double(dnr),1)) = KIKS_RBTdiodpatch(id,[1,0.4,0.4]);
    end;
end;

kiks_draw_robot(id);
endfunction
