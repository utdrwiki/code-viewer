if (room == room_dw_3d_tower_test)
    exit;
if (room == room_dw_churchc_titanclimb1)
    exit;
if (obj_mainchara.y >= 220 && obj_mainchara.y < 1500 && obj_rotating_tower_controller.yoffset <= 820 && (obj_rotating_tower_controller.tower_angle < 18 || obj_rotating_tower_controller.tower_angle > 340))
    tunnel_offset_x = 0;
if (!surface_exists(surf_tunnel))
    surf_tunnel = surface_create(room_width, 680);
surface_set_target(surf_tunnel);
draw_sprite_tiled_ext(spr_rotating_tower_bg, 0, tunnel_offset_x, tunnel_offset_y, 1, 1, c_white, 1);
surface_reset_target();
shader_set(shd_tunnel);
shader_set_uniform_f(uni_distort_amount, 3);
draw_surface(surf_tunnel, 0, cameray());
shader_reset();
