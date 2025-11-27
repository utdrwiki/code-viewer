if (i_ex(target))
{
    image_index = target.image_index;
    sprite_index = target.sprite_index;
    image_xscale = target.image_xscale;
    image_yscale = target.image_yscale;
    if (follow)
    {
        x = target.x;
        y = target.y;
    }
}
gpu_set_fog(true, current_color, 0, 1);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, image_blend, current_alpha);
gpu_set_fog(false, c_black, 0, 0);
