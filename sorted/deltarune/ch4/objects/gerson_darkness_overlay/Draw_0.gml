if (scalecon == 1 && scale > 2.2)
    scale -= 0.03;
if (scalecon == 2 && scale < 8)
    scale += 0.2;
if (scalecon == 3 && scale > 2.2)
    scale -= 0.2;
var _shadowpower_scale = 0;
if (i_ex(obj_spearblocker))
    _shadowpower_scale = lerp(0, -1, obj_spearblocker.shadowpower / 1);
if (!surface_exists(_surface))
    _surface = surface_create(room_width, room_height);
surface_set_target(_surface);
draw_clear_alpha(c_white, 0);
var aa = 0;
draw_set_color(c_black);
ossafe_fill_rectangle(camerax() - 10, cameray() - 10, camerax() + camerawidth() + 10, cameray() + cameraheight() + 10, false);
draw_set_color(c_white);
draw_set_blend_mode(bm_subtract);
if (i_ex(obj_heart))
    draw_sprite_ext(spr_light_vfx, image_index, obj_heart.x + 10, obj_heart.y + 10, scale + _shadowpower_scale, scale + _shadowpower_scale, 0, image_blend, 1);
else
    draw_sprite_ext(spr_light_vfx, image_index, camerax() + 310, cameray() + 230, scale + _shadowpower_scale, scale + _shadowpower_scale, 0, image_blend, 1);
for (var i = 0; i < instance_number(obj_gerson_darkness_overlay_light); i++)
{
    light[i] = instance_find(obj_gerson_darkness_overlay_light, i);
    draw_sprite_ext(spr_light_vfx, 0, light[i].x, light[i].y, light[i].image_xscale, light[i].image_yscale, 0, c_white, light[i].image_alpha);
}
draw_set_blend_mode(bm_normal);
surface_reset_target();
draw_surface_ext(_surface, 0, 0, 1, 1, 0, c_white, image_alpha);
