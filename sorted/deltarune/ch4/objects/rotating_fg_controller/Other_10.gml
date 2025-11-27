if (obj_mainchara.y >= 220 && obj_mainchara.y < 1500 && obj_rotating_tower_controller.yoffset <= 820 && (obj_rotating_tower_controller.tower_angle < 18 || obj_rotating_tower_controller.tower_angle > 340))
{
}
tunnel_offset_x++;
if (up_h())
    tunnel_offset_y += 2;
if (down_h())
    tunnel_offset_y -= 2;
if (!surface_exists(surf_tunnel))
    surf_tunnel = surface_create(320, 680);
surface_set_target(surf_tunnel);
draw_sprite_tiled_ext(spr_rotating_tower_fg_stone2, 0, tunnel_offset_x, tunnel_offset_y - 60, 1, 1.6, merge_color(c_white, c_gray, 0.5), 1);
draw_set_blend_mode(bm_subtract);
draw_sprite_ext(spr_whitepixel, image_index, 146, 0, 200, 700, 0, image_blend, 1);
draw_set_blend_mode(bm_normal);
surface_reset_target();
shader_set(shd_tunnel_inverse2);
shader_set_uniform_f(uni_distort_amount, 10);
draw_surface(surf_tunnel, 232, cameray() + 30);
shader_reset();
var offset = 20;
var scale = 0.5;
