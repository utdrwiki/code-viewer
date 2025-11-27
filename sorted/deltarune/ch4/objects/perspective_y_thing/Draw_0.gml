_angle += 2;
_surface_yscale = (obj_rotating_tower_controller.yoffset + (_surface_y - 40)) / 350;
y = ystart + obj_rotating_tower_controller.yoffset;
if (!surface_exists(_surface))
    _surface = surface_create(room_width, room_height);
surface_set_target(_surface);
draw_clear_alpha(c_white, 0);
var aa = 0;
repeat (8)
{
    draw_sprite_ext(sprite_index, image_index, 305, 103, 1, -0.55, _angle + (aa * 45), image_blend, 0.75);
    aa++;
}
draw_set_blend_mode(bm_subtract);
draw_sprite_ext(spr_yperspectivething_mask, image_index, 245, 105, 1, -0.55, 0, image_blend, 1);
draw_set_blend_mode(bm_normal);
surface_reset_target();
draw_surface_ext(_surface, _surface_x, _surface_y + y, _surface_xscale, _surface_yscale, 0, c_white, 1);
