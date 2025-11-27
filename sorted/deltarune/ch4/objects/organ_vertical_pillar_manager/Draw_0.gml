var _shake_dist = 0;
var _shake_tilt = 0;
var _shake_offx = 0;
var _shake_offy = 0;
with (obj_growtanglebellshake)
{
    _shake_dist = max((shake / 10) - 4, (shake / 20) - 2, 0);
    _shake_tilt = sign(splash_x - x);
    _shake_offx = lengthdir_x(_shake_dist, shake_dir);
    _shake_offy = (lengthdir_x(_shake_dist, shake_dir) / 3) * _shake_tilt;
}
with (obj_bullet_pillar)
{
    draw_sprite_ext(sprite_index, image_index, xxprevious, yyprevious, image_xscale, image_yscale, image_angle, c_dkgray, image_alpha);
    draw_sprite_ext(sprite_index, image_index, xprevious, yprevious, image_xscale, image_yscale, image_angle, c_gray, image_alpha);
}
if (!surface_exists(bar_surface))
    bar_surface = surface_create(143, 143);
surface_set_target(bar_surface);
draw_clear_alpha(c_white, 0);
if (difficulty > 0)
{
    var col = 32768;
    var xoff = 0;
    var yoff = 2;
}
else
{
    var col = 8421504;
    var xoff = 2;
    var yoff = 0;
}
with (obj_organ_enemy_vertical_pillar)
{
    if (active)
    {
    }
    draw_sprite_ext(sprite_index, image_index, x - (scr_get_box(2) + 4), y - (scr_get_box(1) + 4), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
surface_reset_target();
draw_surface(bar_surface, scr_get_box(2) + 4 + _shake_offx, scr_get_box(1) + 4 + _shake_offy);
with (obj_bullet_pillar)
{
    draw_sprite_ext(sprite_index, image_index, x + _shake_offx, y + _shake_offy, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    xxprevious = xprevious;
    yyprevious = yprevious;
}
