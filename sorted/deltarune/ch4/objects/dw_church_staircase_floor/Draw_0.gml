anim_index += 0.2;
if (change_palette)
{
    palette_siner += 0.04;
    palette_index = clamp(palette_index + (sin(palette_siner) / 16), 0.2, 0.8);
}
pal_swap_set(spr_dw_church_staircase_palette, palette_index, false);
draw_sprite_ext(spr_dw_church_hall_door, anim_index, 200, 80, 2, 2, 0, c_white, 1);
for (var i = 0; i < 3; i++)
    draw_sprite_ext(spr_dw_church_flame, anim_index, 204 - (i * 6), 3922 + (i * 26), 2, 2, 0, c_white, 1);
for (var i = 0; i < 3; i++)
    draw_sprite_ext(spr_dw_church_flame, anim_index, 436 + (i * 6), 3922 + (i * 26), -2, 2, 0, c_white, 1);
scr_draw_sprite_tiled_area(spr_dw_church_hall_tile, anim_index, 160, 240, 160, 240, 320, 3840, 2, 2, c_white, 1);
pal_swap_reset();
