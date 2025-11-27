timer++;
draw_sprite_ext(spr_tenna_laugh_pose_segmented_leftarm, 0, x + ((sin(timer / rate) * 4) + 6), y + (cos(timer / rate) * 4), 2, 2, 0, c_white, 1);
draw_sprite_ext(spr_tenna_laugh_pose_segmented_body, 0, x, y, 2, 2 + (sin(timer / rate) * 0.1), 0, c_white, 1);
draw_sprite_ext(spr_tenna_laugh_pose_segmented_rightarm, 0, x - (sin(timer / rate) * 4), y - (-cos(timer / rate) * 4), 2, 2, 0, c_white, 1);
