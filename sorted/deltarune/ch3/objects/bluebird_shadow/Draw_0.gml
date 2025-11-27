var yoff = parentid.yoffset;
if (yoff < -8 && yoff > -22)
    draw_sprite_ext(spr_board_shadow, 1, x, y, 2, 2, 0, c_white, 1);
if (yoff == -22)
    draw_sprite_ext(spr_board_shadow, 0, x, y, 2, 2, 0, c_white, 1);
