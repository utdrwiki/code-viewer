var xx_offset = 0;
scr_draw_sprite_tiled_area(spr_dw_green_room_vines, 0, xx_offset, 81, xx_offset, 81, room_width, 110, 2, 2, c_white, 1);
shine_anim_a += 0.08;
for (var i = 0; i < 12; i++)
{
    var y_offset = ((i % 2) == 1) ? 4 : 10;
    draw_sprite_ext(spr_shine_white, shine_anim_a + i, (i * 55) + xx_offset, 80 + y_offset, 2, 2, 0, #E8FFC8, 1);
}
shine_anim_b += 0.08;
for (var i = 0; i < 10; i++)
{
    var y_offset = ((i % 2) == 0) ? 14 : 20;
    var x_offset = 3;
    draw_sprite_ext(spr_shine_white, shine_anim_b + 0.25 + i, (i * 65) + x_offset + xx_offset, 85 + y_offset, 2, 2, 0, #E8FFC8, 1);
}
