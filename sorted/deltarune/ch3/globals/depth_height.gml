function scr_depth_height(arg0)
{
    depth = 100000 - (((y - arg0) * 10) + ((sprite_height - sprite_yoffset) * 10));
}

function scr_depth_pivot()
{
    depth = 100000 - (y * 10);
}

function scr_depth_offset(arg0)
{
    depth = 100000 - (((y - sprite_yoffset) + (arg0 * image_yscale)) * 10);
}
