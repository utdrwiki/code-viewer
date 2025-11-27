timer++;
if (y > (obj_growtangle.y + 120))
    image_alpha -= 0.3;
if (image_alpha < 0.8)
    active = 0;
if (x <= (scr_get_box(2) + 15) && !bounce)
{
    bounce = true;
    me_flash = scr_oflash();
    with (me_flash)
        target = other.id;
    snd_play_pitch(snd_metal_hit_reverb, 3);
    x = scr_get_box(2) + 15;
    hspeed = 4;
    vspeed = -12;
    gravity_direction = 270;
    gravity = 0.6;
}
if (bounce)
{
    if ((timer % 2) == 0)
        image_angle -= 40;
}
else
{
    image_angle += 40;
}
if (!bounce)
{
    with (scr_afterimagefast())
        fadeSpeed *= 3;
}
