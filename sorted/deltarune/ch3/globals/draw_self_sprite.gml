function draw_self_sprite(arg0, arg1, arg2 = 0, arg3 = 0)
{
    draw_sprite_ext(arg0, arg1, x + arg2, y + arg3, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
