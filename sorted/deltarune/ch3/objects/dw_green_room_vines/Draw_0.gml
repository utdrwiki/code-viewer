scr_draw_sprite_tiled_area(spr_dw_green_room_vines, 0, 122, 40, 122, 40, 572, 70, 2, 2, c_white, 1);
scr_draw_sprite_tiled_area(spr_dw_green_room_vines, 0, 930, 40, 930, 40, 960, 70, 2, 2, c_white, 1);
scr_draw_sprite_tiled_area(spr_dw_green_room_vines, 0, 1084, 40, 1084, 40, 1100, 70, 2, 2, c_white, 1);
scr_draw_sprite_tiled_area(spr_dw_green_room_vines, 0, 1212, 40, 1212, 40, 1297, 70, 2, 2, c_white, 1);
if (!show_vines)
    exit;
shine_anim_a += 0.08;
for (var i = 0; i < 8; i++)
{
    var y_offset = ((i % 2) == 1) ? 4 : 10;
    draw_sprite_ext(spr_shine_white, shine_anim_a + i, 128 + (i * 53), 40 + y_offset, 2, 2, 0, #E8FFC8, 1);
}
shine_anim_b += 0.08;
for (var i = 0; i < 7; i++)
{
    var y_offset = ((i % 2) == 0) ? 14 : 20;
    var x_offset = ((i % 2) == 0) ? 4 : 8;
    draw_sprite_ext(spr_shine_white, shine_anim_b + 0.25 + i, 156 + (i * 60) + x_offset, 45 + y_offset, 2, 2, 0, #E8FFC8, 1);
}
draw_sprite_ext(spr_shine_white, shine_anim_a, 946, 50, 2, 2, 0, #E8FFC8, 1);
draw_sprite_ext(spr_shine_white, shine_anim_b + 0.25, 962, 60, 2, 2, 0, #E8FFC8, 1);
draw_sprite_ext(spr_shine_white, shine_anim_a, 1088, 40, 2, 2, 0, #E8FFC8, 1);
draw_sprite_ext(spr_shine_white, shine_anim_b + 0.25, 1108, 45, 2, 2, 0, #E8FFC8, 1);
for (var i = 0; i < 2; i++)
{
    var y_offset = ((i % 2) == 1) ? 4 : 10;
    draw_sprite_ext(spr_shine_white, shine_anim_a + i, 1221 + (i * 53), 40 + y_offset, 2, 2, 0, #E8FFC8, 1);
}
for (var i = 0; i < 2; i++)
{
    var y_offset = ((i % 2) == 0) ? 14 : 20;
    var x_offset = ((i % 2) == 0) ? 4 : 8;
    draw_sprite_ext(spr_shine_white, shine_anim_b + 0.25 + i, 1210 + (i * 65) + x_offset, 45 + y_offset, 2, 2, 0, #E8FFC8, 1);
}
