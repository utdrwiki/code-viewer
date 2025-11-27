star_anim += star_anim_speed;
bg_speed -= bg_speed_max;
bg_speed_y += bg_speed_y_max;
if (bg_speed < -640)
    bg_speed += 640;
if (bg_speed_y > -480)
    bg_speed_y -= 480;
draw_set_alpha(1);
scr_draw_set_mask(true, true);
ossafe_fill_rectangle(x, y, (x + (image_xscale * 20)) - 1, (y + (image_yscale * 20)) - 1);
scr_draw_in_mask_begin();
scr_draw_sprite_tiled_area(spr_dw_tv_starbgtile, star_anim, camerax() + bg_speed, cameray() + bg_speed_y, camerax() + bg_speed, cameray() + bg_speed_y, camerax() + view_wport[0], cameray() + room_height, 2, 2, c_white, 1);
scr_draw_in_mask_end();
