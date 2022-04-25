scr_destroyoutside_ch1 = function() //gml_Script_scr_destroyoutside_ch1
{
    if (global.mnfight != 2)
        instance_destroy()
    if (x < (__view_get((0 << 0), 0) - sprite_width))
        instance_destroy()
    if (x > ((__view_get((0 << 0), 0) + 640) + sprite_width))
        instance_destroy()
    if (y < (__view_get((1 << 0), 0) - sprite_height))
        instance_destroy()
    if (y > ((__view_get((1 << 0), 0) + 480) + sprite_height))
        instance_destroy()
    return;
}

