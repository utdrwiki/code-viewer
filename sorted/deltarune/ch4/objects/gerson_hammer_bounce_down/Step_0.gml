timer++;
if (y > (obj_growtangle.y + 120))
    image_alpha -= 0.3;
if (image_alpha < 0.8)
    active = 0;
if (y >= (scr_get_box(3) - 20) && !bounce)
{
    bounce = true;
    me_flash = scr_oflash();
    with (me_flash)
        target = other.id;
    snd_play_pitch(snd_metal_hit_reverb, 2);
    y = scr_get_box(3) - 20;
    vspeed = -20;
    hspeed = 0;
    gravity_direction = 270;
    gravity = 1.2;
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
