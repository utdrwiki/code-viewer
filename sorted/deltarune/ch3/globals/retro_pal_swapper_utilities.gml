function pal_swap_draw_palette(arg0, arg1, arg2, arg3)
{
    draw_sprite_part(arg0, 0, floor(arg1), 0, 1, sprite_get_height(arg0), arg2, arg3);
}

function pal_swap_get_color_count(arg0)
{
    return sprite_get_height(arg0);
}

function pal_swap_get_pal_count(arg0)
{
    return sprite_get_width(arg0);
}
