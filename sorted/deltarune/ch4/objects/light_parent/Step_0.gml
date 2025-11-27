if (init == 0)
{
    if (sprite_index == spr_lightsource)
        sprite_index = spr_light320;
    if (width == -1)
        image_xscale = size / 320;
    else
        image_xscale = width / 320;
    if (height == -1)
        image_yscale = size / 320;
    else
        image_yscale = height / 320;
    init = 1;
}
