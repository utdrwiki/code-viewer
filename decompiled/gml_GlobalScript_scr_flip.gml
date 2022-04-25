scr_flip = function(argument0) //gml_Script_scr_flip
{
    if (argument0 == "h" || argument0 == "x")
    {
        x += ((sprite_get_width(sprite_index) - (sprite_get_xoffset(sprite_index) * 2)) * image_xscale)
        image_xscale = (-image_xscale)
    }
    else
    {
        y += ((sprite_get_height(sprite_index) - (sprite_get_yoffset(sprite_index) * 2)) * image_yscale)
        image_yscale = (-image_yscale)
    }
    return;
}

