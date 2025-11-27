var watertile = 2186;
if (room == room_dw_b3bs_rouxls_lanina)
    watertile = 3460;
animindex += 0.125;
image_blend = #4CFF00;
draw_self();
chromakey_mask_begin(65356, 5);
draw_self();
image_blend = c_white;
chromakey_mask_end();
chromakey_on();
draw_sprite_tiled_ext(watertile, animindex, x, y, 2, 2, c_white, 1);
chromakey_off();
