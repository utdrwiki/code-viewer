if (room == room_dw_3d_tower_test)
    exit;
if (obj_rotating_tower_controller_new.use_background_map)
    exit;
if (!surface_exists(surf_tunnel))
    surf_tunnel = surface_create(camerawidth(), 680);
surface_set_target(surf_tunnel);
draw_sprite_tiled_ext(spr_bookshelves_bgnew1, 0, tunnel_offset_x, tunnel_offset_y, 1.3, 1.3, c_white, 1);
surface_reset_target();
shader_set(shd_tunnel);
shader_set_uniform_f(uni_distort_amount, 3);
draw_surface(surf_tunnel, camerax(), cameray());
shader_reset();
