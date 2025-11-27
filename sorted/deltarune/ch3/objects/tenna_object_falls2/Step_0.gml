if (i_ex(obj_tenna_zoom) && obj_tenna_zoom.con >= 2)
    instance_destroy();
if ((y + speed) >= (ystart + 20) && con == 0)
{
    vspeed = 0;
    gravity = 0;
    snd_play(snd_screenshake);
    scr_shakescreen();
    con = 1;
}
if (con == 1)
{
    timer++;
    if (timer == 16)
        instance_destroy();
    if (image_alpha == 0)
        image_alpha = 1;
    else
        image_alpha = 0;
}
