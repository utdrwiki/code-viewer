if (gigahammer)
{
    if (y > (obj_growtangle.y + 20) && !true_drop)
    {
        with (obj_growtangle)
        {
            y += (other.y - other.yprevious);
            y = min(y, __view_get(e__VW.YView, 0) + 220);
            with (obj_heart)
                y += (obj_growtangle.y - obj_growtangle.yprevious);
        }
    }
    if (!true_drop && y > (__view_get(e__VW.YView, 0) + 220))
    {
        true_drop = true;
        vspeed = -16;
        snd_play(snd_impact);
        snd_play_pitch(snd_metal_hit_reverb, 1);
        scr_shakescreen();
    }
    if (true_drop && y > (__view_get(e__VW.YView, 0) + 720))
    {
        scr_shakescreen();
        snd_play_pitch(snd_glassbreak, 0.5);
        snd_play_pitch(snd_explosion_firework, 0.75);
        instance_destroy();
    }
    if (image_alpha < 0.8)
        active = 0;
}

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
