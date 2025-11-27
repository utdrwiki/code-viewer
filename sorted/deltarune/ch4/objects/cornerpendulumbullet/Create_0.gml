event_inherited();
active = 0;
destroyonhit = 0;
swingtarget_x = x;
swingtarget_y = y;
swingpoint_x = swingtarget_x;
swingpoint_y = scr_get_box(1) - 16;
swingdistance = point_distance(x, y, swingpoint_x, swingpoint_y);
vertical_mirroring = 1;
surface_effect = -1;
image_alpha = 0;
target = 4;
damage = 45;
if (i_ex(obj_herosusie))
    damage = 65;
grazepoints = 4;
