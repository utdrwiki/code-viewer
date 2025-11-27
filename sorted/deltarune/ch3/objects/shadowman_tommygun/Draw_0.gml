var angle = gun_angle;
if (type == 0)
    angle = 0;
var _index = 0;
if (firefx > 0)
{
    _index = 1;
    firefx--;
}
if (sprite_index != spr_shadowman_idle_b && sprite_index != spr_shadowman_reload)
    draw_sprite_ext(spr_shadowman_gun, _index, x + 6 + lengthdir_x(gunshake, gun_angle), y + 63 + lengthdir_y(gunshake, gun_angle), image_xscale, image_yscale, gun_angle + 180, image_blend, image_alpha);
draw_sprite_ext(sprite_index, image_index, x + (gunshake / 3), y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
if (gunshake > 0)
    gunshake = 0;
