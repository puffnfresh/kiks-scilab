function [] = kiks_gui_kiksnet_passwor(title)

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);


// !! L.3: Matlab function dialog not yet converted, original calling sequence used
h = dialog("Visible","off","PaperUnits","points");
// !! L.4: Matlab function set not yet converted, original calling sequence used
// L.4: Name conflict: function name changed from set to %set
%set(h,"Name",title);
// !! L.5: Matlab function get not yet converted, original calling sequence used
// L.5: Name conflict: function name changed from get to %get
p = %get(h,"Position");
xs = 300;
ys = 100;
p = mtlb_i(p,1,mtlb_a(mtlb_double(mtlb_e(p,1)),mtlb_s(mtlb_double(mtlb_e(p,3)),xs)/2));
p = mtlb_i(p,2,mtlb_a(mtlb_double(mtlb_e(p,2)),mtlb_s(mtlb_double(mtlb_e(p,4)),ys)/2));
p = mtlb_i(p,3,xs);
p = mtlb_i(p,4,ys);
// !! L.12: Matlab function set not yet converted, original calling sequence used
// L.12: Name conflict: function name changed from set to %set
%set(h,"Position",p);










// !! L.23: Matlab function uicontrol not yet converted, original calling sequence used
h1 = uicontrol("Parent",h,"FontName","verdana","BackgroundColor",[1,1,1],"HorizontalAlignment","left","ListboxTop",0,"Position",[50,50,200,18],"String","","Style","edit","Tag","passwd","TooltipString","Enter administrator password for KiKSnet server");






// !! L.30: Matlab function uicontrol not yet converted, original calling sequence used
h2 = uicontrol("Parent",h,"Callback","kiks_gui_kiksnet_password_close(gcf);","ListboxTop",0,"Position",[100,10,100,20],"String","ok","Tag","ok");
// !! L.31: Matlab function set not yet converted, original calling sequence used
// L.31: Name conflict: function name changed from set to %set
%set(h,"Visible","on");

// !! L.33: Matlab function uiwait not yet converted, original calling sequence used
uiwait(h);
endfunction
