if (global.turntimer < 0 || !i_ex(obj_heart))
{
    instance_destroy();
    exit;
}
xx = scr_orbitx(x + 9, y + 9, x, y, image_angle);
yy = scr_orbity(x + 9, y + 9, x, y, image_angle);
if (image_xscale != 1 || image_yscale != 1)
    draw_sprite_ext_centerscale(sprite_index, obj_heart.image_index, x, y, image_xscale, image_yscale, image_angle, 16777215, image_alpha);
else
    draw_sprite_ext(sprite_index, obj_heart.image_index, xx, yy, image_xscale, image_yscale, image_angle, c_white, image_alpha);
if (flashtimer > 0)
{
    flashtimer--;
    var _alpha = scr_wrap(flashtimer / 10, 0, 1);
    d3d_set_fog(true, c_white, 0, 1);
    if (image_xscale != 1 || image_yscale != 1)
        draw_sprite_ext_centerscale(sprite_index, obj_heart.image_index, x, y, image_xscale, image_yscale, image_angle, 16777215, _alpha);
    else
        draw_sprite_ext(sprite_index, obj_heart.image_index, xx, yy, image_xscale, image_yscale, image_angle, c_white, _alpha);
    d3d_set_fog(false, c_black, 0, 0);
}
