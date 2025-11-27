event_inherited();
if (y > (obj_growtangle.y + 86))
{
    image_alpha -= 0.1;
    if (image_alpha <= 0)
        instance_destroy();
}
slowed = scr_approach(slowed, 1 + sqrt(slow_factor), 9);
slow_factor = scr_approach(slow_factor, 0, 1);
mydir += (rotspd / slowed);
image_angle += (turnrate / slowed / (1 + (3 * touched_water)));
if (push)
    y += (push / (1 + touched_water));
push = scr_approach_curve(push, 0, 12 - (touched_water * 4));
if (touched_water)
{
    hspeed = scr_approach_curve(hspeed, 0, 15);
    vspeed = scr_approach_curve(vspeed, 1, 12);
    image_xscale *= 0.99;
    image_yscale *= 0.99;
    if (image_xscale < 0.1)
        instance_destroy();
}
if (instance_exists(master))
{
    disttarg = scr_approach_curve(disttarg, metadisttarg, 18);
    mydist = scr_approach_curve(mydist, disttarg, 20);
    x = master.x + lengthdir_x(mydist, mydir);
    y = master.y + lengthdir_y(mydist, mydir);
    if ((master.timer % 4) == 0)
        grazed = false;
    image_alpha = master.image_alpha;
    if (master.timer == 200)
        metadisttarg = 0;
}
else if (master != noone)
{
    instance_destroy();
}
if (slowdown == true)
{
    if (gotopointer == false)
    {
        friction = 0.1;
        gravity = 0;
        if (turnrate > 0)
            turnrate -= 0.1;
        if (turnrate < 0)
            turnrate = 0;
    }
    else if (i_ex(obj_rouxls_laser_pointer_controller))
    {
        direction = point_direction(x, y, obj_rouxls_laser_pointer_controller._mouse_x, obj_rouxls_laser_pointer_controller._mouse_y);
        if (speed < 3)
            speed += 0.2;
        if (turnrate < 2)
            turnrate += 0.1;
    }
}
