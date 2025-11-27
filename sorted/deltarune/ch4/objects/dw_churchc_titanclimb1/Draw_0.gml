if (!surface_exists(cloudsurface))
    cloudsurface = surface_create(320, 240);
shader_set(shd_steam);
shader_set_uniform_f(u_iTime, current_time / 40);
shader_set_uniform_f(u_iPosOffset, (2 * obj_rotating_tower_controller_new.tower_angle) / 360, cameray() / -480);
shader_set_uniform_f(u_iTexCoordStretch, 1.25, 0.9375);
shader_set_uniform_f(u_uvs, s_uvs[0], s_uvs[1], s_uvs[2] - s_uvs[0], s_uvs[3] - s_uvs[1]);
surface_set_target(cloudsurface);
draw_clear_alpha(c_black, 0);
draw_sprite_ext(spr_perlin_noise_looping, 0, 0, 0, 1.25, 0.9375, 0, c_black, 0.75);
shader_reset();
surface_reset_target();
