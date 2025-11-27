if (con == 0)
{
    image_speed = timer / 65 / 4;
    image_speed = clamp(image_speed, 0, 0.5);
    timer++;
    if (timer == 1)
    {
        friction = 0.8;
        hspeed = -5;
        makedust = true;
    }
    if (timer == 15)
    {
        hspeed = -7;
        makedust = true;
    }
    if (timer == 40)
    {
        hspeed = -9;
        makedust = true;
    }
    if (timer == 65)
    {
        vspeed = 5;
        makedust = true;
    }
    if (timer == 85)
    {
        vspeed = 7;
        makedust = true;
    }
}
if (makedust == true)
{
    makedust = false;
    snd_play(snd_wing);
    dust = instance_create(x + 43, y + 59, obj_afterimage);
    dust.sprite_index = spr_dust1;
    dust.image_speed = 0.25;
    dust.fadeSpeed = 0.25;
    dust.hspeed = 1;
    dust.vspeed = -2;
    dust.gravity = 1;
}
