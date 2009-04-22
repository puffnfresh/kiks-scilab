function [] = kiks_set_robot_data()

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------

global("KIKS_PROXIMITY_DIRECTIONS","KIKS_PROXIMITY_POSITIONS","KIKS_PROX_DIR","KIKS_PROX_ANG","KIKS_GRIPPER_ACTIVE","KIKS_LIGHT_POS","KIKS_PROX_POS","KIKS_SPDC","KIKS_ROBOT_DATA","KIKS_RBTMASK_COL","KIKS_COLOR_ROBOT","KIKS_RBT_DIOD","KIKS_RBT_LAMP","KIKS_RBT_BODY","KIKS_RBTMASK","KIKS_WALL_WIDTH","KIKS_MMPERPIXEL","KIKS_RBT_BODY","KIKS_GRIPPER_ACTIVE","KIKS_ROBOT_DATA","KIKS_ROBOT_DISTANCE_BETWEEN_WHEELS","KIKS_ROBOT_DIAMETER","KIKS_SPDC","KIKS_PROX_POS","KIKS_LIGHT_POS");

KIKS_ROBOT_RADIUS = floor(KIKS_ROBOT_DIAMETER/2);
// internal representation of the simulated robot
kx = mtlb_a(mtlb_a(1,KIKS_ROBOT_RADIUS),KIKS_WALL_WIDTH);// coordinate=1+radius+wall
ky = mtlb_a(mtlb_a(1,KIKS_ROBOT_RADIUS),KIKS_WALL_WIDTH);
ang = 0;

// ! L.15: mtlb(KIKS_PROXIMITY_DIRECTION) can be replaced by KIKS_PROXIMITY_DIRECTION() or KIKS_PROXIMITY_DIRECTION whether KIKS_PROXIMITY_DIRECTION is an M-file or not.
KIKS_PROX_DIR = (%pi/180)*mtlb(KIKS_PROXIMITY_DIRECTION);
KIKS_PROX_ANG = -(%pi/180)*KIKS_PROXIMITY_POSITIONS;

//KIKS_ROBOT_DATA = [ kx   ky   ang  0    0    0    0    0    ; % xpos ypos rotation_angle move_mode(0=speed,1=position) left_wheel_speed right_wheel_speed left_wheel_counter right_wheel_counter
//    KIKS_ROBOT_DISTANCE_BETWEEN_WHEELS   KIKS_ROBOT_RADIUS   0    0    0    0    0    0    ; % diameter_between_wheels robot_radius lT lM lE rT rM rE
//    0    0    0    0    0    0    0    0    ; % registers for internal use (general speed variables)
//    0    0    0    0    0    0    0    0    ; % baud rate variables
//    20   64   20   64   0    0    0   -1    ; % max_speed_left, acc_left, max_speed_right, acc_right, left_wheel_target, right_wheel_target, movement_accumulated_time
//    0    0    0    0    0    0    0    0    ; % position mode profiles: lt0 lt1 lt2 lt3 left_maxspeed left_acc server_left_speed server_right_speed
//    0    0    0    0    0    0    -1  -1    ; % position mode profiles: rt0 rt1 rt2 rt3 right_maxspeed right_acc                     
//    0    0    0    0    0    0    0    0    ; % registers for internal use (general speed variables)
//    0    0    0    0    0    0    0    0    ; % proximity sensor data
//    0    0    0    0    0    0    0    0    ; % light sensor data
//    127  200  0    0    0    0    0    0    ; % gripper data: arm_position gripper_position resistivity object_present arm_target gripper_target
//    0    0    0    0    0    0    0    0   ]; % radio data: buffer_empty==1 message_in_reception_buffer==1 message_send_failed==1

// ! L.31: mtlb(KIKS_ROBOT_DISTANCE_BETW) can be replaced by KIKS_ROBOT_DISTANCE_BETW() or KIKS_ROBOT_DISTANCE_BETW whether KIKS_ROBOT_DISTANCE_BETW is an M-file or not.
KIKS_ROBOT_DATA = [
	kx,ky,ang,0,0,0,0,0; // xpos ypos rotation_angle move_mode(0=speed,1=position) left_wheel_speed right_wheel_speed left_wheel_counter right_wheel_counter
	mtlb(KIKS_ROBOT_DISTANCE_BETW),KIKS_ROBOT_RADIUS,0,0,0,0,0,0; // diameter_between_wheels robot_radius lT lM lE rT rM rE
	0,0,0,0,0,0,0,0; // registers for internal use (general speed variables)
	0,0,0,0,0,0,0,0; // baud rate variables
	20,64,20,64,0,0,0,-1; // max_speed_left, acc_left, max_speed_right, acc_right, left_wheel_target, right_wheel_target, movement_accumulated_time
	0,0,0,0,0,0,0,0; // position mode profiles: lt0 lt1 lt2 lt3 left_maxspeed left_acc server_left_speed server_right_speed
	0,0,0,0,0,0,-1,-1; // position mode profiles: rt0 rt1 rt2 rt3 right_maxspeed right_acc
	0,0,0,0,0,0,0,0; // registers for internal use (general speed variables)
	0,0,0,0,0,0,0,0; // proximity sensor data
	0,0,0,0,0,0,0,0; // light sensor data
	127,200,0,0,0,0,0,0; // gripper data: arm_position gripper_position resistivity object_present arm_target gripper_target
	0,0,0,0,0,0,0,0]; // radio data: buffer_empty==1 message_in_reception_buffer==1 message_send_failed==1

KIKS_SPDC = 8.2;
KIKS_PROX_POS = 9;KIKS_LIGHT_POS = 10;// in case more registers are added, just change these to correct row number.

stp = %pi/32;
if isempty(KIKS_GRIPPER_ACTIVE) then
  //    KIKS_RBT_BODY(1,:)=(((KIKS_ROBOT_DATA(2,2)/KIKS_MMPERPIXEL)+1)*(cos([KIKS_ROBOT_DATA(1,3):stp:2*pi+KIKS_ROBOT_DATA(1,3)-stp])));
  //    KIKS_RBT_BODY(2,:)=-(((KIKS_ROBOT_DATA(2,2)/KIKS_MMPERPIXEL)+1)*(sin([KIKS_ROBOT_DATA(1,3):stp:KIKS_ROBOT_DATA(1,3)+2*pi-stp])));
  KIKS_RBT_BODY(1,:) = cos(KIKS_ROBOT_DATA(1,3):stp:2*%pi+KIKS_ROBOT_DATA(1,3)-stp);
  KIKS_RBT_BODY(2,:) = -sin(KIKS_ROBOT_DATA(1,3):stp:KIKS_ROBOT_DATA(1,3)+2*%pi-stp);
else
  KIKS_RBT_BODY(1,:) = (KIKS_ROBOT_DATA(2,2)/KIKS_MMPERPIXEL)*cos(%pi+%pi/2+KIKS_ROBOT_DATA(1,3):stp:2*%pi+%pi/2+KIKS_ROBOT_DATA(1,3));
  KIKS_RBT_BODY(2,:) = -(KIKS_ROBOT_DATA(2,2)/KIKS_MMPERPIXEL)*sin(%pi+%pi/2+KIKS_ROBOT_DATA(1,3):stp:2*%pi+%pi/2+KIKS_ROBOT_DATA(1,3));
  [tmp,pts] = size(KIKS_RBT_BODY);
  KIKS_RBT_BODY(1,pts+1) = -KIKS_ROBOT_DATA(2,2)/KIKS_MMPERPIXEL;
  KIKS_RBT_BODY(2,pts+1) = -KIKS_ROBOT_DATA(2,2)/KIKS_MMPERPIXEL;
  KIKS_RBT_BODY(1,pts+2) = -KIKS_ROBOT_DATA(2,2)/KIKS_MMPERPIXEL;
  KIKS_RBT_BODY(2,pts+2) = KIKS_ROBOT_DATA(2,2)/KIKS_MMPERPIXEL;
end;

KIKS_RBT_LAMP(1,:) = (5/KIKS_MMPERPIXEL)*cos(%pi/4:%pi/4:2*%pi);
KIKS_RBT_LAMP(2,:) = (5/KIKS_MMPERPIXEL)*sin(%pi/4:%pi/4:2*%pi);

KIKS_RBT_DIOD(1,:) = (2/KIKS_MMPERPIXEL)*cos(%pi/4:%pi/4:2*%pi);
KIKS_RBT_DIOD(2,:) = (2/KIKS_MMPERPIXEL)*sin(%pi/4:%pi/4:2*%pi);


MX = mtlb_a(floor(KIKS_ROBOT_DATA(2,2)/KIKS_MMPERPIXEL)*2,1);
MY = mtlb_a(floor(KIKS_ROBOT_DATA(2,2)/KIKS_MMPERPIXEL)*2,1);
// ! L.61: real(MY) may be replaced by:
// !    --> MY if MY is Real.
// ! L.61: real(MX) may be replaced by:
// !    --> MX if MX is Real.
KIKS_RBTMASK = zeros(real(MY),real(MX));
// ! L.62: real(MY) may be replaced by:
// !    --> MY if MY is Real.
// ! L.62: real(MX) may be replaced by:
// !    --> MX if MX is Real.
KIKS_RBTMASK_COL = zeros(real(MY),real(MX));
for x = mtlb_imp(1,MX)
  for y = mtlb_imp(1,MY)
    if mtlb_logic(sqrt(mtlb_a(mtlb_s(x,mtlb_a(MX,1)/2)*mtlb_s(x,mtlb_a(MX,1)/2),mtlb_s(y,mtlb_a(MY,1)/2)*mtlb_s(y,mtlb_a(MY,1)/2))),"<=",KIKS_ROBOT_DATA(2,2)/KIKS_MMPERPIXEL) then
      KIKS_RBTMASK(x,y) = 1;
      if mtlb_logic(KIKS_COLOR_ROBOT,">",0) then
        KIKS_RBTMASK_COL(x,y) = KIKS_COLOR_ROBOT;
      else
        // black/white stripes
        qs = abs(mtlb_double(KIKS_COLOR_ROBOT))/4;  // stripes in each quadrant
        ang = %pi/(8*qs);
        col = 1;
        xp = abs(mtlb_s(x,mtlb_a(MX,1)/2));
        yp = abs(mtlb_s(y,mtlb_a(MY,1)/2));
        hyp = sqrt(mtlb_a(xp*xp,yp*yp));
        for i = mtlb_imp(1,qs) // test each stripe
         xp_hi = cos(ang)*hyp;
         xp_low = cos(mtlb_a(ang,%pi/(4*qs)))*hyp;
         if mtlb_logic(xp,">=",xp_low) & mtlb_logic(xp,"<=",xp_hi) | mtlb_logic(hyp,"<=",2) then
           col = 255;
         end;
         ang = mtlb_a(ang,%pi/(2*qs));
        end;
        KIKS_RBTMASK_COL(x,y) = col;
      end;
    end;
  end;
end;
endfunction
