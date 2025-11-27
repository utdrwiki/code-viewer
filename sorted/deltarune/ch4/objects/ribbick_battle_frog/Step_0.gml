if (!i_ex(obj_heart) || global.turntimer < 1)
{
    instance_destroy();
    exit;
}
if (y < (scr_get_box(1) + 24))
{
    y = scr_get_box(1) + 24;
    image_yscale = -1;
    image_index = 0;
    vspeed = 0;
    hspeed = 0;
    gravity = 0;
    attached = true;
    patience = 30 + irandom(30);
    stickiness = 15;
    canjump = false;
}
if (y < (scr_get_box(3) - 22) && !attached)
{
    if (x < (scr_get_box(2) + 24))
    {
        x = scr_get_box(2) + 24;
        attached = true;
        vspeed = 0.25;
        hspeed = 0;
        gravity = 0;
        image_index = 0;
        image_xscale = -1;
        image_yscale = 1;
        image_angle = -90;
        canjump = true;
    }
    if (x > (scr_get_box(0) - 22))
    {
        x = scr_get_box(0) - 22;
        attached = true;
        vspeed = 0.25;
        hspeed = 0;
        gravity = 0;
        image_index = 0;
        image_xscale = 1;
        image_yscale = 1;
        image_angle = 90;
        canjump = true;
    }
}
if (y >= (scr_get_box(3) - 22) && vspeed > 0)
{
    y = scr_get_box(3) - 22;
    vspeed = 0;
    hspeed = 0;
    gravity = 0;
    image_index = 0;
    attached = false;
    image_angle = 0;
    image_yscale = 1;
    canjump = true;
}
if (patience)
{
    patience--;
    stickiness = scr_approach(stickiness, 0, 1);
    if (patience == 0 || (stickiness == 0 && abs(x - (obj_heart.x + 8)) < 20))
    {
        patience = 0;
        stickiness = 0;
        attached = false;
        gravity = 0.25;
        vspeed = 0;
        image_index = 1;
    }
}
if (state == "jump")
{
    timer++;
    if (timer == 1)
        image_blend = c_gray;
    if (timer == 5)
        image_blend = c_white;
    if (timer == 10)
    {
        var aim = hop_trajectory();
        attached = false;
        image_angle = 0;
        image_yscale = 1;
        hspeed = lengthdir_x(1, aim) * 4;
        vspeed = (lengthdir_y(1, aim) * 6) - 2;
        image_index = 1;
        gravity = 0.25;
        timer = 0;
        state = "none";
        canjump = false;
        if (hspeed >= 0)
            image_xscale = 1;
        else
            image_xscale = -1;
    }
}
if (!attached && y != (scr_get_box(3) - 22))
{
    if (hspeed >= 0)
        image_xscale = 1;
    else
        image_xscale = -1;
}
