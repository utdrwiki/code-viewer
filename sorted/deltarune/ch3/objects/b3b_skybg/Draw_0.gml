if (!follow)
{
    draw_sprite_ext(spr_pxwhite, 0, x, y, 384, 64, 0, #2B5088, 1);
    draw_sprite_ext(spr_pxwhite, 0, x, y + 64, 384, 64, 0, #31356A, 1);
    draw_sprite_ext(spr_enemy_lanino_compiled, 0, x, y, 2, 2, 0, c_white, 1);
}
else
{
    draw_sprite_ext(spr_pxwhite, 0, board_tilex(0), board_tiley(0), 384, 64, 0, #2B5088, 1);
    draw_sprite_ext(spr_pxwhite, 0, board_tilex(0), board_tiley(2), 384, 64, 0, #31356A, 1);
    draw_sprite_ext(spr_enemy_lanino_compiled, 0, board_tilex(0), board_tiley(0), 2, 2, 0, c_white, 1);
}
