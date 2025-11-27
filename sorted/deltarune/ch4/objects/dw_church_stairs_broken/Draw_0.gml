var _palette_index = 0;
with (obj_dw_church_stairs)
    _palette_index = palette_index;
pal_swap_set(spr_dw_church_staircase_palette, _palette_index, false);
draw_sprite_ext(spr_dw_church_stairs_breaking, image_index, x, y, 2, 2, 0, c_white, 1);
pal_swap_reset();
