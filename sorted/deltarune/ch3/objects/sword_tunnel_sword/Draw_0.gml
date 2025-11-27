if (telegraph == 0 && telegraphalpha > 0)
    telegraphalpha -= 0.1;
if (telegraph == 1 && telegraphalpha < 0.5)
    telegraphalpha += 0.05;
if (telegraphalpha > 0)
    draw_sprite_ext(spr_lasergun_laser_telegraph, 0, x, y, 999, 0.4, image_angle, c_red, telegraphalpha);
if (con > 0)
{
    var _timer = timer;
    if (_timer > 10)
        _timer = 10;
    if (image_blend == c_red)
        image_blend = merge_color(c_red, c_white, _timer / 10);
}
for (i = 0; i < 10; i++)
    draw_sprite_ext(sprite_index, image_index, lerp(xprevious, x, i / 10), lerp(yprevious, y, i / 10), image_xscale, image_yscale, image_angle, image_blend, i / 10);
draw_self();
