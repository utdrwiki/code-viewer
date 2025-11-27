front = false;
surface = -1;
surface_y_offset = 350;
surface_scale = 0.5;
style = 1;
outline = 0;
hands = false;
followcamera = 0;
xoffset = 0;
caminfluence = 1;
last_hero_y = 0;
distance_from_kris = 220;
verticalspeed = -0.4;
tower_y_prev = 0;
if (i_ex(obj_rotating_tower_controller_new))
    tower_y_prev = obj_rotating_tower_controller_new.tower_y;
with (obj_cloud_controller_new)
{
    if (!active)
        other.xoffset = -9999;
}
hasspawns = i_ex(obj_dw_churchc_titanclimb2);
if (i_ex(obj_rotating_tower_controller_new))
{
    if (front == true)
        depth = obj_rotating_tower_controller_new.depth - 200;
    else
        depth = obj_rotating_tower_controller_new.depth + 50;
}
else if (front)
{
    depth = 1000;
}
else
{
    depth = 2000005;
}
