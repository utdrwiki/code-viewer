siner += 1;
image_speed = 0;
image_index = 0;
draw_self();
gpu_set_blendmode(bm_add);
draw_sprite_ext(sprite_index, 1, x, y, image_xscale, image_yscale, 0, c_white, 0.2 + (sin(siner / 24) * 0.2));
gpu_set_blendmode(bm_normal);
