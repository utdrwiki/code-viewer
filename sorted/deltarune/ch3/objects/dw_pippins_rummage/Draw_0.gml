if (!is_init)
    exit;
if (!hold_coin)
    draw_self();
pippins_anim += pippins_anim_speed;
if (is_inside)
{
    scr_draw_set_mask(true);
    draw_sprite_ext(sprite_index, 1, x, y, 4, 4, 0, c_white, 1);
    scr_draw_in_mask_begin();
    draw_sprite_ext(pippins_sprite, pippins_anim, pippins_x, pippins_y, 2, 2, 0, c_white, 1);
    scr_draw_in_mask_end();
    draw_sprite_ext(spr_treasurebox_cover, 0, x, y, image_xscale, image_yscale, 0, c_white, 1);
}
else
{
    draw_sprite_ext(pippins_sprite, pippins_anim, pippins_x, pippins_y, 2, 2, 0, c_white, 1);
}
if (hold_coin)
    draw_sprite_ext(spr_dw_point_large, 0, pippins_x + 24, pippins_y - 28, 2, 2, 0, c_white, 1);
