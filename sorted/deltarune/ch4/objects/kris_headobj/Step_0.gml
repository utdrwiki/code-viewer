if (breakcon == 1)
{
    breaktimer = 0;
    scr_oflash();
    breakcon = 2;
}
if (breakcon == 2)
{
    breaktimer++;
    if (breaktimer >= 4)
    {
        snd_play(snd_sparkle_glock);
        image_alpha = 0;
        breakcon = 3;
        for (i = 0; i < 30; i++)
        {
            sparkle[i] = scr_marker(x + random_range(-15, 15), y + random_range(-15, 15), spr_sparestar_anim);
            sparkle[i].image_speed = 0.5;
            sparkle[i].hspeed = random_range(-3, 3);
            sparkle[i].friction = 0.05;
            sparkle[i].gravity = -0.1;
        }
    }
}
