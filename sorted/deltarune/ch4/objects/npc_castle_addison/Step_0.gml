if (balloon_move)
{
    balloon_siner += 0.3;
    balloon_flip_timer++;
    for (var i = 0; i < array_length_1d(balloon); i++)
        balloon[i].y = balloon[i].ystart + (sin(balloon_siner / 3) * 4);
    if ((balloon_flip_timer % 120) == 1)
    {
        with (balloon[0])
            scr_flip("x");
    }
    if ((balloon_flip_timer % 90) == 1)
    {
        with (balloon[1])
            scr_flip("x");
    }
}
