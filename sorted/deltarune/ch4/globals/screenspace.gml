function screenx(arg0 = x)
{
    return arg0 - camerax();
}

function screeny(arg0 = y)
{
    return arg0 - cameray();
}

function draw_self_screenspace()
{
    draw_sprite_ext(sprite_index, image_index, screenx(), screeny(), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}

function draw_self_screenspace_offset(arg0, arg1)
{
    draw_sprite_ext(sprite_index, image_index, screenx() + arg0, screeny() + arg1, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}

function draw_self_surfacespace(arg0, arg1)
{
    draw_sprite_ext(sprite_index, image_index, x - arg0, y - arg1, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}

function screenx_ext(arg0 = camerax(), arg1 = x)
{
    return arg1 - arg0;
}

function screeny_ext(arg0 = cameray(), arg1 = y)
{
    return arg1 - arg0;
}
