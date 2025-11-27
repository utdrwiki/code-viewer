if (!init || actor_target == -4)
    exit;
draw_sprite_ext(spr_dw_tv_gachaball_transparent, 2, ball_bottom_pos_x, ball_bottom_pos_y, 1.55, 1.55, ball_angle, c_white, ball_alpha);
draw_sprite_ext(actor_target.sprite_index, actor_target.image_index, actor_target.x, actor_target.y, 2, 2, 0, actor_target.image_blend, 1);
draw_sprite_ext(spr_dw_tv_gachaball_transparent, 3, ball_bottom_pos_x, ball_bottom_pos_y, 1.55, 1.55, ball_angle, c_white, ball_alpha);
draw_sprite_ext(spr_dw_tv_gachaball_transparent, 1, ball_top_pos_x, ball_top_pos_y, 1.55, 1.55, ball_angle, c_white, ball_alpha);
