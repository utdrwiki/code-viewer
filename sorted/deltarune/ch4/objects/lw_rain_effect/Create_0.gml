rain_style = 1;
rain_letters = "ABCDEF";
rain_sprite[0] = 627;
rain_sprite[1] = 4516;
rain_sprite[2] = 1874;
rain_sprite[3] = 3147;
rain_sprite[4] = 847;
rain_sprite[5] = 2912;
xdir = -1;
xspeed = 1;
yspeed = 2;
if (global.plot > 280 && global.plot < 310)
    global.flag[794] = 0;
if (global.chapter == 4 && global.plot == 99)
    global.flag[794] = 0;
var _plotmode = (global.chapter == 4 && global.plot == 100 && global.flag[794] < 2) || global.flag[794] == 1;
genspeed = 2;
speed_mul = 5;
build_timer = 0;
prewarm = global.flag[794] >= 2;
crossfade = global.flag[794] == 3;
active = _plotmode || prewarm;
show_debug = false;
timer = -1;
color_overlay = true;
speed_sin = 0;
depth = 120;
rainsplash = prewarm;
stepped = 0;
init = false;
drop_wait = 30;
drop_timer = 0;
if (active)
    global.flag[794] = 2;
wrap_up = false;
room_exit = false;
room_door = false;
max_particles = 120;
cam_x = 0;
cam_y = 0;
ypan = false;
xpan = false;
dropcount = 0;
inherit_visibility = true;

function toggle_effect()
{
    if (argument_count >= 1)
        visible = argument[0];
    else
        visible = !visible;
    inherit_visibility = true;
    with (obj_lw_raindrop)
        visible = other.visible;
}
