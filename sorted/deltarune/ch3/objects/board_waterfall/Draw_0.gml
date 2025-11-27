if (active == 1)
{
    if (wither == 1)
        instance_destroy();
    animtimer += 0.125;
    for (var i = 0; i < (image_xscale / 2); i++)
    {
        for (var j = 0; j < (image_yscale / 2); j++)
            draw_sprite_ext(sprite_index, animtimer, x + (i * 32), y + (j * 32), 2, 2, 0, c_white, 1);
    }
}
