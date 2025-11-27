function scr_depth_ext(arg0 = 100000, arg1 = 10)
{
    depth = arg0 - ((y * arg1) + (sprite_height * arg1));
}

function scr_depth_ext_alt(arg0 = 100000, arg1 = 10)
{
    depth = arg0 - ((y * arg1) + ((sprite_height - sprite_yoffset) * arg1));
}

function scr_depth_relative(arg0 = 100000, arg1 = 0, arg2 = 10)
{
    var __yy = (y + sprite_height) - arg1;
    depth = arg0 - (__yy * arg2);
}
