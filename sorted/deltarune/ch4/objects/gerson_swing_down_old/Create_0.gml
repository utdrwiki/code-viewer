event_inherited();
timer = 0;
con = 0;
destroyonhit = false;
image_speed = 0;
vspeed = -6;
friction = 0.4;
image_xscale = 2;
image_yscale = 2;
fakeout = 0;
if (instance_number(obj_gerson_swing_down) == 3)
{
    with (obj_gerson_swing_down)
        fakeout = 1;
}
