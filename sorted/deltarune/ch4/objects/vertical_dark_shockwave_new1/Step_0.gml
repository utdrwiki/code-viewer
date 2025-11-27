if (con == 1)
{
    timer++;
    if (position == "above")
    {
        if (timer == 1)
            spd = -10;
        else
            spd += 0.75;
    }
    if (position == "below")
    {
        if (timer == 1)
            spd = 10;
        else
            spd -= 0.75;
    }
    if (timer > 5 && timer < 12)
    {
        _xoffset = -4 + random(8);
        _yoffset = -4 + random(8);
    }
    if (timer == 17 || timer == 19 || timer == 21 || timer == 23)
    {
        if (image_index == 0)
            image_index = 1;
        else
            image_index = 0;
    }
    if (timer == 26)
    {
        snd_stop(snd_wallclaw);
        snd_play_pitch(snd_wallclaw, 0.7);
        sprite_index = spr_titan_shockwave_bullet;
        image_yscale = 1;
        image_xscale = 1;
        anim = instance_create(x, y, obj_animation);
        anim.sprite_index = spr_titan_shockwave_bullet_explosion;
        anim.image_xscale = 0.5;
        anim.image_yscale = 0.5;
        anim.depth = depth;
        timer = 0;
        con = 2;
        if (position == "above")
            spd = 30;
        if (position == "below")
            spd = -30;
    }
}
if (con == 2)
{
    timer++;
    var __y;
    if (position == "above")
        __y = 30;
    if (position == "below")
        __y = -30;
    repeat (2)
    {
        bullet = instance_create(314 + random(12), (y - 24) + random(48) + __y, obj_vertical_dark_shockwave_new2);
        bullet.angle_position = angle_position;
        bullet.mode = 4;
        bullet._x = x;
        bullet._y = (y - 24) + random(48) + __y;
        bullet.depth = depth + 1;
    }
    if (timer == 20)
        instance_destroy();
}
event_inherited();
if (con == 1)
{
    if (image_xscale < 2)
        image_xscale += 0.2;
    if (image_yscale < 2)
        image_yscale += 0.2;
}
yoffset += spd;
if (con == 2)
{
    if (spd > 0)
    {
        image_yscale = image_xscale * -1.5;
        spd -= 0.15;
    }
    if (spd < 0)
    {
        image_yscale = image_xscale * 1.5;
        spd += 0.15;
    }
}
if (position == "above")
    y = cameray() + 90 + yoffset;
if (position == "below")
    y = ((cameray() + cameraheight()) - 160) + yoffset;
