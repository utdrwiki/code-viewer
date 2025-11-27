if (!is_open)
{
    draw_self();
}
else if (is_inside)
{
    draw_self();
    scr_draw_set_mask(true);
    draw_sprite_ext(sprite_index, 1, x, y, image_xscale, image_yscale, 0, c_white, 1);
    scr_draw_in_mask_begin();
    draw_sprite_ext(pippins_sprite, pippins_anim, pippins_x, pippins_y, 2, 2, 0, c_white, 1);
    scr_draw_in_mask_end();
    draw_sprite_ext(spr_treasurebox_cover, 0, x, y, image_xscale, image_yscale, 0, c_white, 1);
}
else
{
    draw_self();
    draw_sprite_ext(pippins_sprite, pippins_anim, pippins_x, pippins_y, 2, 2, 0, c_white, 1);
}
