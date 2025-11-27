if (surface_effect == -1 || !surface_exists(surface_effect))
    surface_effect = surface_create(scr_get_box(0) - scr_get_box(2) - 8, scr_get_box(3) - scr_get_box(1) - 8);
var _shake_dist = max((shake / 10) - 4, (shake / 20) - 2, 0);
var _shake_tilt = sign(splash_x - x);
var _box_x = x + lengthdir_x(_shake_dist, shake_dir);
var _box_y = y + ((lengthdir_x(_shake_dist, shake_dir) / 3) * _shake_tilt);
draw_sprite_ext(sprite_index, 1, x + lengthdir_x(_shake_dist, shake_dir + 180), y + ((lengthdir_x(_shake_dist, shake_dir + 180) / 3) * _shake_tilt), image_xscale, image_yscale, image_angle, image_blend, 0.5 * image_alpha);
draw_sprite_ext(sprite_index, 1, _box_x, _box_y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_sprite_ext(sprite_index, image_index, x + lengthdir_x(_shake_dist, shake_dir + 180), y + ((lengthdir_x(_shake_dist, shake_dir + 180) / 3) * _shake_tilt), image_xscale, image_yscale, image_angle, image_blend, 0.5 * image_alpha);
draw_sprite_ext(sprite_index, image_index, _box_x, _box_y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
var _sx = -(_box_x - 70);
var _sy = -(_box_y - 70);
surface_set_target(surface_effect);
draw_clear_alpha(c_black, 0);
if (i_ex(obj_organ_vertical_pillar_manager))
    depth = obj_organ_vertical_pillar_manager.depth - 1;
with (obj_bulletparent)
{
    if (sprite_index == spr_organ_bar)
        draw_sprite_ext(sprite_index, image_index, x - (scr_get_box(2) + 4), y - (scr_get_box(1) + 4), image_xscale, image_yscale, image_angle, image_blend, image_alpha * 2.5);
}
with (obj_organ_enemy_vertical_pillar)
    draw_sprite_ext(sprite_index, image_index, x - (scr_get_box(2) + 4), y - (scr_get_box(1) + 4), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
with (obj_bullet_bellwave)
{
    if (!visible)
        draw_sprite_ext(sprite_index, -1, _sx + x, _sy + y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
surface_reset_target();
draw_surface(surface_effect, -_sx, -_sy);
with (obj_growtanglebellshake)
{
    if (splash_size > 0)
    {
        draw_set_color(c_white);
        d_circle(splash_x + lengthdir_x(2, shake_dir), splash_y + lengthdir_y(2, shake_dir), splash_size, 0);
    }
}
