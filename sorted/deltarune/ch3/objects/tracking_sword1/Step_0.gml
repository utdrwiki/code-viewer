if (con < 2)
{
    x = obj_heart.x + 10 + lengthdir_x(len, direction);
    y = clamp(obj_heart.y + 10 + lengthdir_y(len, direction), cameray() + 40, cameray() + 320);
}
if (con == 0)
{
    timer++;
    if (timer == 1)
        snd_play_x(snd_knight_jump_quick, 1, 1.3);
    image_alpha = lerp(0, 0.5, timer / fadetohalftime);
    if (image_alpha == 0.5)
    {
        con = 1;
        timer = 0;
    }
}
if (con == 1)
{
    timer++;
    if (timer >= waittime)
    {
        image_alpha = lerp(0.8, 1, (timer - waittime) / fadetofulltime);
        len = lerp(len, lenstart + 10, (timer - waittime) / fadetofulltime);
        image_blend = merge_color(c_white, c_red, timer / 30);
    }
    if (image_alpha == 1)
    {
        con = 2;
        timer = 0;
        scr_afterimage_grow();
        afterimage.xrate = 0.2;
        afterimage.yrate = 0.2;
        afterimage.fade = 0.3;
    }
}
if (con == 2)
{
    timer++;
    if (timer == (flashtime + 1))
    {
        con = 3;
        timer = 0;
    }
}
if (con == 3)
{
    timer++;
    if (timer == 1)
    {
        afterimagecon = 1;
        targetx = x + lengthdir_x(900, direction + 180);
        targety = y + lengthdir_y(900, direction + 180);
        snd_play_x(snd_knight_cut2, 1, 1.3);
    }
    if (timer == 2)
    {
        slash = instance_create(x, y, obj_tracking_sword_slash);
        slash.image_angle = image_angle;
        slash.direction = direction;
        slash.damage = damage;
        slash2 = instance_create(x, y, obj_tracking_sword_slash_extra_graze);
        slash2.image_angle = image_angle;
        slash2.direction = direction;
        var a = 200;
        var b = 18;
        var c = 1;
        b = 27;
        if (variant == 1)
        {
            for (i = 0; i < b; i++)
            {
                c = lerp(1, 5, i / b);
                if (lerp(x, targetx, i / b) < (obj_growtangle.x + a) && lerp(x, targetx, i / b) > (obj_growtangle.x - a) && lerp(y, targety, i / b) > (obj_growtangle.y - a) && lerp(y, targety, i / b) < (obj_growtangle.y + a))
                {
                    inst = instance_create(lerp(x, targetx, (i / b) * c), lerp(y, targety, (i / b) * c), obj_tracking_sword2);
                    inst.damage = damage;
                    inst.target = target;
                }
            }
        }
    }
    if (timer == 5)
        instance_destroy();
}
