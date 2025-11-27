if (sprite_index == spr_gerson_chevron)
    image_angle = direction + 180;
draw_self();
if (sprite_index == spr_gerson_chevron)
{
    if (direction == 0)
    {
        draw_sprite_ext(sprite_index, image_index, x - 5 - (timer / 4), y, image_xscale, image_yscale, direction + 180, image_blend, image_alpha);
        draw_sprite_ext(sprite_index, image_index, x - 10 - (timer / 2), y, image_xscale, image_yscale, direction + 180, image_blend, image_alpha);
    }
    if (direction == 180)
    {
        draw_sprite_ext(sprite_index, image_index, x + 5 + (timer / 4), y, image_xscale, image_yscale, direction + 180, image_blend, image_alpha);
        draw_sprite_ext(sprite_index, image_index, x + 10 + (timer / 2), y, image_xscale, image_yscale, direction + 180, image_blend, image_alpha);
    }
}
