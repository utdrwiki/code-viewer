if (turn_off)
    exit;
gpu_set_blendenable(false);
gpu_set_colorwriteenable(false, false, false, true);
draw_set_alpha(0);
draw_triangle_color(light_x_pos, 1020, light_x_pos - 80, light_height, light_x_pos + 80, light_height, c_white, 0, 0, false);
d_ellipse(light_x_pos - 80, light_height - 20 - 5, light_x_pos + 80, light_height + 30, false);
draw_set_alpha(1);
gpu_set_blendenable(true);
gpu_set_colorwriteenable(true, true, true, true);
gpu_set_blendmode_ext(bm_src_alpha, bm_inv_dest_alpha);
gpu_set_alphatestenable(true);
draw_set_color(c_black);
ossafe_fill_rectangle(light_xx, cameray(), light_xx + room_width, room_height, false);
draw_set_color(c_white);
gpu_set_alphatestenable(false);
gpu_set_blendmode(bm_normal);
