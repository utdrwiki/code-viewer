draw_sprite_ext(sprite_index, 1, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
gpu_set_blendmode(bm_add);
draw_sprite_ext(spr_coolspark, 0, x, y, sparksize + 0.5 + ((global.time % 2) * 0.4 * coolsize), sparksize + 0.5 + ((global.time % 2) * 0.4 * coolsize), (global.time * 10) + individuality, image_blend, image_alpha);
draw_sprite_ext(spr_coolspark, 1, x, y, sparksize + 0.4 + ((global.time % 2) * 0.4), sparksize + 0.4 + ((global.time % 2) * 0.4), (global.time * 10) + individuality, image_blend, image_alpha);
gpu_set_blendmode(bm_normal);
