function surfacex(arg0, arg1 = -1)
{
    if (arg1 > -1)
        arg1 = clamp01(surface_get_target());
    arg0 = (argument_count == 1) ? argument[0] : y;
    if (arg1 == 0)
        return screenx();
    else
        return x;
}

function surfacey(arg0 = -1)
{
    var __yy = (argument_count == 1) ? argument[0] : y;
    return __yy - cameray();
}

function draw_self_surfacespace(arg0 = -1)
{
    draw_sprite_ext(sprite_index, image_index, screenx(), screeny(), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}

function draw_self_surfacespace_offset(arg0, arg1, arg2 = -1)
{
    draw_sprite_ext(sprite_index, image_index, screenx() + arg0, screeny() + arg1, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
