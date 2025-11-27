if (global.turntimer < 1)
    instance_destroy();
do_bounce = false;
if (y > top && y < bottom && !true_neverbounce)
    neverbounce = false;
image_angle = direction;
if (i_ex(obj_volumeup))
{
    image_yscale = scr_approach(image_yscale, image_yscale_goal, 0.3);
    if (image_yscale_goal < 1)
        image_xscale = 0.6;
}
else
{
    image_yscale = scr_approach(image_yscale, image_yscale_goal, 0.2);
    if (image_yscale_goal < 1)
        image_xscale = 0.6;
}
if (vspeed > 0 && !neverbounce)
{
    if (y >= bottom)
    {
        if (abs(x - obj_growtangle.x) < 165)
        {
            repeat (10)
            {
                if (y != bottom)
                {
                    y -= (vspeed * 0.1);
                    x -= (hspeed * 0.1);
                }
                if (y <= bottom)
                {
                    do_bounce = true;
                    image_index = 1;
                    blend = #EE145B;
                    break;
                }
            }
        }
        else
        {
            neverbounce = true;
        }
    }
}
if (vspeed < 0 && !neverbounce)
{
    if (y <= top)
    {
        if (abs(x - obj_growtangle.x) < 165)
        {
            repeat (10)
            {
                if (y != top)
                {
                    y -= (vspeed * 0.1);
                    x -= (hspeed * 0.1);
                }
                if (y >= top)
                {
                    do_bounce = true;
                    image_index = 2;
                    blend = #0072BC;
                    break;
                }
            }
        }
        else
        {
            neverbounce = true;
        }
    }
}
if (do_bounce)
{
    vspeed *= -1;
    if (do_bounce_image)
    {
        with (obj_regularbullet)
        {
            if (sprite_index == spr_zapper_laserball)
                depth++;
        }
        with (instance_create_depth(x, y, depth - 64, obj_regularbullet))
        {
            active = 0;
            sprite_index = spr_zapper_laserball;
            image_speed = 0;
            if (i_ex(obj_volumeup))
            {
                image_xscale = 1.125;
                image_yscale = 1.125;
                scr_lerpvar("image_xscale", 1.125, 0, 4);
                scr_lerpvar("image_yscale", 1.125, 0, 4);
            }
            else
            {
                image_xscale = 0.75;
                image_yscale = 0.75;
                scr_lerpvar("image_xscale", 0.75, 0, 4);
                scr_lerpvar("image_yscale", 0.75, 0, 4);
            }
            scr_script_delayed(instance_destroy, 4);
        }
        with (instance_create_depth(x, y, depth + 1, obj_regularbullet))
        {
            active = 0;
            sprite_index = spr_zapper_laserball;
            image_speed = 0;
            image_blend = other.blend;
            if (i_ex(obj_volumeup))
            {
                image_xscale = 1.35;
                image_yscale = 1.35;
                scr_lerpvar("image_xscale", 1.35, 0, 5);
                scr_lerpvar("image_yscale", 1.35, 0, 5);
            }
            else
            {
                image_xscale = 0.9;
                image_yscale = 0.9;
                scr_lerpvar("image_xscale", 0.9, 0, 5);
                scr_lerpvar("image_yscale", 0.9, 0, 5);
            }
            scr_script_delayed(instance_destroy, 5);
        }
    }
    if (first)
    {
        var reflect = snd_play(snd_bell);
        audio_sound_gain(reflect, 0.75, 0);
    }
}
with (scr_afterimage())
{
    image_blend = other.blend;
    fadeSpeed = 0.25;
}
if (x < (__view_get(e__VW.XView, 0) - 80))
    instance_destroy();
if (x > (__view_get(e__VW.XView, 0) + 760))
    instance_destroy();
if (y < (__view_get(e__VW.YView, 0) - 80))
    instance_destroy();
if (y > (__view_get(e__VW.YView, 0) + 580))
    instance_destroy();

enum e__VW
{
    XView,
    YView,
    WView,
    HView,
    Angle,
    HBorder,
    VBorder,
    HSpeed,
    VSpeed,
    Object,
    Visible,
    XPort,
    YPort,
    WPort,
    HPort,
    Camera,
    SurfaceID
}
