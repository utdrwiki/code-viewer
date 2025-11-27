if (global.turntimer < 1)
{
    instance_destroy();
    exit;
}
if (con == 0)
{
    timer++;
    if (timer == 2)
    {
        anim = instance_create(obj_heart.x + 40, obj_heart.y - 10, obj_animation);
        anim.sprite_index = spr_gerson_swing;
        anim.image_speed = 0.5;
        anim.image_index = 0;
        anim.image_xscale = 2;
        anim.image_yscale = 2;
    }
    if (timer == 9)
    {
        with (obj_heart)
        {
            color = c_black;
            sprite_index = spr_heart;
            inst = instance_create(obj_heart.x, obj_heart.y, obj_gerson_fakeheart);
            inst.directionhit = 180;
            inst.speed = 15.6;
        }
        instance_create(x, y, obj_shake);
        snd_play(snd_screenshake);
    }
    if (timer > 11)
    {
        var xx;
        if (i_ex(obj_gerson_fakeheart))
            xx = obj_gerson_fakeheart.x;
        else
            xx = obj_heart.x;
        x1 = xx - 30;
        if (x1 < (camerax() + 50))
            x1 = camerax() + 50;
    }
    if (timer == 35)
    {
        timer = 0;
        con = 1;
        xxprev = obj_gerson_fakeheart.x;
    }
}
if (con == 1)
{
    timer++;
    if ((timer % 20) == 0 && obj_heart.x < (x2 - 80))
    {
        gers = instance_create(obj_heart.x + 20, y1 + 20, obj_gerson_swing_down_new);
        if (gers.x > (camerax() + 260))
            gers.x = camerax() + 260;
    }
    var xx;
    if (i_ex(obj_gerson_fakeheart))
        xx = obj_gerson_fakeheart.x;
    else
        xx = obj_heart.x;
    if (xxprev < xx)
        y1 += 2;
    if (xxprev < xx)
        xxprev = xx;
    if (y1 > (cameray() + 250))
        y1 = cameray() + 250;
    x1 = xx - 30;
    if (x1 < (camerax() + 50))
        x1 = camerax() + 50;
    if (obj_heart.x > (x2 - 50) && timer > 30)
    {
        timer = 0;
        con = 2;
    }
}
if (con == 2)
{
    obj_growtangle.x = obj_growtangle.xstart;
    obj_growtangle.image_alpha = 0;
    x1 = lerp(x1, obj_growtangle.x - (obj_growtangle.sprite_width / 2), 0.2);
    x2 = lerp(x2, obj_growtangle.x + (obj_growtangle.sprite_width / 2), 0.2);
    y1 = lerp(y1, obj_growtangle.y - (obj_growtangle.sprite_height / 2), 0.2);
    y2 = lerp(y2, obj_growtangle.y + (obj_growtangle.sprite_height / 2), 0.2);
    timer++;
    if (timer == 2)
    {
        snd_play(snd_smallswing);
        instance_create(x, y, obj_spearblocker);
    }
    if (timer == 20)
    {
        obj_growtangle.image_alpha = 1;
        instance_destroy();
    }
}
var colo = draw_get_color();
draw_set_colour(col);
d_line_width(x1, y1 - 1, x1, y2 + 2, 4);
d_line_width(x1, y1 + 1, x2, y1 + 1, 4);
d_line_width(x2, y1 - 1, x2, y2 + 2, 4);
d_line_width(x1, y2, x2, y2, 4);
draw_set_colour(colo);
