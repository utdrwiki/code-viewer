var dir = 0;
if (room == room_dw_teevie_shadow_guys || room == room_dw_b3bs_sadshadowguys)
    dir = 1;
if (dir == 0)
    draw_self_board();
else
    draw_sprite_ext(sprite_index, image_index, x + 32, y, -2, 2, 0, c_white, 1);
