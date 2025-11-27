star_anim += star_anim_speed;
bg_speed -= bg_speed_max;
bg_speed_y += bg_speed_y_max;
if (bg_speed < -640)
    bg_speed += 640;
if (bg_speed_y > -480)
    bg_speed_y -= 480;
if (!surface_exists(frame_surf))
    frame_surf = surface_create(camerawidth(), cameraheight());
surface_set_target(frame_surf);
draw_clear_alpha(c_black, 0);
draw_set_blend_mode(bm_normal);
draw_sprite_tiled_ext(spr_dw_tv_starbgtile, star_anim, bg_speed, bg_speed_y, 2, 2, c_white, 1);
draw_set_blend_mode(bm_subtract);
draw_set_alpha(1);
draw_set_color(c_black);
ossafe_fill_rectangle(128, 64, 512, 320);
draw_set_blend_mode(bm_normal);
surface_reset_target();
draw_surface(frame_surf, camerax(), cameray());
draw_sprite_ext(spr_quizroom_bg_foreground, 0, camerax(), cameray(), 2, 2, 0, c_white, 1);
