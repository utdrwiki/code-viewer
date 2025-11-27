if (con == 0)
{
}
if (con == 1 && alarm[0] < 1)
{
    scr_lerpvar("x", x, xtarget, 20, 3, "out");
    scr_lerpvar("y", y, ytarget, 20, 3, "out");
    con = 2;
}
if (con == 2 && anglespeed == 0)
{
    con = 0;
    image_alpha = 1;
}
if (angledirection == 1)
    image_angle += anglespeed;
else
    image_angle -= anglespeed;
if (anglespeed > 0)
{
    anglespeed -= 0.2;
    if (con == 2)
        anglespeed -= 0.8;
}
if (alarm[0] == 4)
    image_alpha = 1;
with (obj_jump_to_point)
{
    if (body_obj != -32322)
        body_obj.image_angle = other.image_angle;
}
timer++;
if (timer == 45)
{
    anglespeed = 2;
    scr_shakeobj();
    snd_play(snd_wing);
    depth = obj_guei_enemy.depth + 100;
}
if (i_ex(obj_growtangle))
    depth = obj_growtangle.depth - 1;
if (i_ex(obj_heart))
    init = 1;
if (!i_ex(obj_heart) && init == 1)
    instance_destroy();
