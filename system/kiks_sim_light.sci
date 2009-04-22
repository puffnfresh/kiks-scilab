function [] = kiks_sim_light(id)

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------

global("KIKS_SIM_LIGHT_FEXP","KIKS_ARENA_COLORMASK","KIKS_ROBOT_MATRIX","KIKS_LIGHT_POS","KIKS_LIGHTARRAY","KIKS_LIGHTDATA","KIKS_LIGHT_NNET_ARRAY","KIKS_PROX_ANG","KIKS_PROX_DIR","KIKS_MMPERPIXEL","KIKS_WALL_WIDTH","KIKS_WALL_RENDER");

prox_xvals = mtlb_a((mtlb_double(KIKS_ROBOT_MATRIX(id,2,2))+1)*cos(mtlb_s(mtlb_double(KIKS_PROX_ANG),mtlb_double(KIKS_ROBOT_MATRIX(id,1,3)))),mtlb_double(KIKS_ROBOT_MATRIX(id,1,1)));
prox_yvals = mtlb_a((mtlb_double(KIKS_ROBOT_MATRIX(id,2,2))+1)*sin(mtlb_s(mtlb_double(KIKS_PROX_ANG),mtlb_double(KIKS_ROBOT_MATRIX(id,1,3)))),mtlb_double(KIKS_ROBOT_MATRIX(id,1,2)));
prox_dirs = mtlb_a(mtlb_double(KIKS_PROX_DIR),mtlb_double(KIKS_ROBOT_MATRIX(id,1,3)));
[tmp,sensors] = size(prox_xvals);

KIKS_ROBOT_MATRIX(id,KIKS_LIGHT_POS,:) = round([mtlb_a(470,mtlb_double(rand())*20),mtlb_a(470,mtlb_double(rand())*20),mtlb_a(470,mtlb_double(rand())*20),mtlb_a(470,mtlb_double(rand())*25),mtlb_a(470,mtlb_double(rand())*20),mtlb_a(470,mtlb_double(rand())*20),mtlb_a(470,mtlb_double(rand())*20),mtlb_a(470,mtlb_double(rand())*20)]);
[tmp,lights] = size(mtlb_double(KIKS_LIGHTARRAY));
[tmp,samples] = size(mtlb_double(KIKS_LIGHT_NNET_ARRAY));
[ysz,xsz] = size(mtlb_double(KIKS_ARENA_COLORMASK));

for sens = 1:sensors
  for i = 1:lights
    // check if KIKS_LIGHTARRAY(i) should affect this sensor
    l_xp = KIKS_LIGHTDATA(i,1);
    l_yp = KIKS_LIGHTDATA(i,2);
    k_xp = prox_xvals(sens);
    k_yp = prox_yvals(sens);
  
    px = k_xp+cos(prox_dirs(sens));
    py = k_yp-sin(prox_dirs(sens));
  
    prox_dir = prox_dirs(sens);
    xdiff = k_xp-mtlb_double(l_xp);
    ydiff = k_yp-mtlb_double(l_yp);
    dist = round(sqrt(xdiff^2+ydiff^2))+1;
  
    if dist>samples then
      continue;
    end;
  
    wx = px-k_xp;
    wy = py-k_yp;
    vx = mtlb_double(l_xp)-k_xp;
    vy = mtlb_double(l_yp)-k_yp;
  
    angle = acos((wx*vx+wy*vy)/(sqrt(wx^2+wy^2)*sqrt(vx^2+vy^2)));
  
    falloff = 0;
  
    //        start=floor([k_yp,k_xp]/KIKS_MMPERPIXEL);
    //        [rad,deg,d]=kiks_calculate_angle(start,floor([l_yp,l_xp]/KIKS_MMPERPIXEL));
    //        ray_xvals = round((0:d)*cos(rad)+start(1));
    //        ray_yvals = round((0:d)*sin(rad)+start(2));
    [ray_yvals,ray_xvals] = kiks_calculate_line(floor([k_yp,k_xp]/mtlb_double(KIKS_MMPERPIXEL)),floor(mtlb_double([l_yp,l_xp])/mtlb_double(KIKS_MMPERPIXEL)));
    idx = mtlb_a(mtlb_s(ray_xvals,1)*ysz,ray_yvals);  // calculate index values for these points
    idx = mtlb_i(idx,mtlb_find(bool2s(mtlb_logic(idx,">",ysz*xsz))),ysz*xsz);
    idx = mtlb_i(idx,mtlb_find(bool2s(mtlb_logic(idx,"<",1))),1);
    try 
      // ! L.57: abs(mtlb_double(mtlb_e(KIKS_ARENA_COLORMASK,idx))) may be replaced by:
      // !    --> mtlb_double(mtlb_e(KIKS_ARENA_COLORMASK,idx)) if mtlb_double(mtlb_e(KIKS_ARENA_COLORMASK,idx)) is real
      obst = mtlb_find(abs(mtlb_double(mtlb_e(KIKS_ARENA_COLORMASK,idx))));  // get all non-zero entries
    catch 
      idx
      obst = 1;
    end;
  
    if obst then
      continue;
    end;
  
    //        if(dist>25)
    if angle>(%pi/2) then
      falloff = 1;
    else
      falloff = (1-cos(angle))^mtlb_double(KIKS_SIM_LIGHT_FEXP);
    end;
    //        end;
  
    intensity = round(mtlb_s(mtlb_a(mtlb_a(mtlb_double(mtlb_e(KIKS_LIGHT_NNET_ARRAY,dist)),falloff*mtlb_s(500,mtlb_double(mtlb_e(KIKS_LIGHT_NNET_ARRAY,dist)))),mtlb_double(rand())*30),15));
  
    //        if(sens==1)
    //            plot(ray_yvals-KIKS_WALL_WIDTH/KIKS_MMPERPIXEL,ray_xvals-KIKS_WALL_WIDTH/KIKS_MMPERPIXEL);
    //            kiks_print(sprintf(''%.1f'',angle*(180/pi)));
    //            kiks_print(sprintf(''intensity: %.1f'',KIKS_LIGHT_NNET_ARRAY(dist)));
    //            kiks_print(sprintf(''falloff: %1.f%% %.1f'',falloff*100,falloff*(500-KIKS_LIGHT_NNET_ARRAY(dist))));
    //        end;
  
    KIKS_ROBOT_MATRIX(id,KIKS_LIGHT_POS,sens) = mtlb_min(intensity,KIKS_ROBOT_MATRIX(id,KIKS_LIGHT_POS,sens));
  end;
end;
endfunction
