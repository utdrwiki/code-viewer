function screenx()
{
    var __xx = (argument_count == 1) ? argument[0] : x;
    return __xx - camerax();
}

function screeny()
{
    var __yy = (argument_count == 1) ? argument[0] : y;
    return __yy - cameray();
}

function screenvec2()
{
    var __vec = (argument_count == 1) ? argument[0] : new Vector2(x, y);
    __vec.x -= camerax();
    __vec.y -= cameray();
    return __vec;
}

function draw_self_screenspace()
{
    draw_sprite_ext(sprite_index, image_index, screenx(), screeny(), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}

function draw_self_screenspace_offset(arg0, arg1)
{
    draw_sprite_ext(sprite_index, image_index, screenx() + arg0, screeny() + arg1, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
