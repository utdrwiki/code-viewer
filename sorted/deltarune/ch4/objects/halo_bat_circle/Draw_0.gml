siner += 1;
if (i_ex(obj_heart))
{
    var eyeangle = point_direction(x, y, obj_heart.x + 10, obj_heart.y + 10);
    targetEyeX = lengthdir_x(6, eyeangle);
    targetEyeY = lengthdir_y(6, eyeangle);
}
eyex = lerp(eyex, targetEyeX, 0.2);
eyey = lerp(eyey, targetEyeY, 0.2);
var bat_sword_yoffset, bat_sword_yscale, bat_top_yoffset, bat_top_yxscale;
if (con == 0)
{
    bat_sword_yoffset = lerp(0, -10, animtimer / 10);
    bat_top_yoffset = lerp(0, 10, animtimer / 10);
    bat_sword_yscale = lerp(2, 0.5, animtimer / 10);
    bat_top_yxscale = lerp(2, 0.5, animtimer / 10);
}
if (con == 1)
{
    bat_sword_yoffset = -10;
    bat_top_yoffset = 10;
    bat_sword_yscale = 0.5;
    bat_top_yxscale = 0.5;
}
if (con == 2)
{
    bat_sword_yoffset = lerp(-10, 0, animtimer / 10);
    bat_top_yoffset = lerp(10, 0, animtimer / 10);
    bat_sword_yscale = lerp(0.5, 2, animtimer / 10);
    bat_top_yxscale = lerp(0.5, 2, animtimer / 10);
}
draw_sprite_ext(spr_halo_bat_sword, 0, x, y + bat_sword_yoffset, image_xscale, bat_sword_yscale, image_angle, image_blend, image_alpha);
draw_sprite_ext(spr_halo_bat_topBit, 0, x, y + bat_top_yoffset, image_xscale, bat_top_yxscale, image_angle, image_blend, image_alpha);
draw_sprite_ext(spr_halo_bat_leftWing_animated, siner * 0.25, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_sprite_ext(spr_halo_bat_rightWing_animated, siner * 0.25, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_sprite_ext(spr_halo_bat_black, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_sprite_ext(spr_halo_bat_eyeWhite, 0, x + round(eyex * 0.2), y + round(eyey * 0.2), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_sprite_ext(spr_halo_bat_eyePupil, 0, x + round(eyex), y + round(eyey), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_sprite_ext(spr_halo_bat_halo, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
d3d_set_fog(true, c_black, 0, 1);
draw_sprite_ext(spr_halo_bat_leftWing_animated_ext, siner * 0.25, x, y, image_xscale, image_yscale, image_angle, image_blend, 0.4);
draw_sprite_ext(spr_halo_bat_rightWing_animated_ext, siner * 0.25, x, y, image_xscale, image_yscale, image_angle, image_blend, 0.4);
draw_sprite_ext(spr_halo_bat_halo, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, 0.4);
draw_sprite_ext(spr_halo_bat_eyeWhite, 0, x + round(eyex * 0.2), y + round(eyey * 0.2), image_xscale, image_yscale, image_angle, image_blend, 0.4);
draw_sprite_ext(spr_halo_bat_eyePupil, 0, x + round(eyex), y + round(eyey), image_xscale, image_yscale, image_angle, image_blend, 0.4);
d3d_set_fog(false, c_black, 0, 0);
if (flash_alpha > 0)
{
    d3d_set_fog(true, c_white, 0, 1);
    draw_sprite_ext(spr_halo_bat_halo, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, flash_alpha);
    draw_sprite_ext(spr_halo_bat_eyeWhite, 0, x + round(eyex * 0.2), y + round(eyey * 0.2), image_xscale, image_yscale, image_angle, image_blend, flash_alpha);
    draw_sprite_ext(spr_halo_bat_eyePupil, 0, x + round(eyex), y + round(eyey), image_xscale, image_yscale, image_angle, image_blend, flash_alpha);
    d3d_set_fog(false, c_white, 0, 0);
    flash_alpha -= 0.2;
}
