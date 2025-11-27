draw_self();
if (type != 1)
{
    rot += 60;
    draw_sprite_ext(spr_mike_clap, 0, x + max(0, lengthdir_y(4, rot)), y + max(0, lengthdir_y(4, rot)), image_xscale, image_yscale, 1, image_blend, 1);
    draw_sprite_ext(spr_mike_clap, 0, x - max(0, lengthdir_y(4, rot)), y - max(0, lengthdir_y(4, rot)), image_xscale, image_yscale, 1, image_blend, 1);
}
else
{
    draw_sprite(spr_mike_shush, 0, x, y + 4 + (cos(xstart + (current_time / 300)) * 4));
}
