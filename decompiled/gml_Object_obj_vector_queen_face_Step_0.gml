if (state == 0)
{
    image_xscale += 0.2
    image_yscale += 0.2
    if (image_xscale >= 5)
    {
        state = 1
        alarm[0] = 60
    }
}
if (state == 1)
{
    sprite_index = spr_bqueen_giant_head_laughing_wireframe
    image_speed = 0.5
}
