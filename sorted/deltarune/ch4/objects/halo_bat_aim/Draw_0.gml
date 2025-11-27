siner += 1;
if (i_ex(obj_heart))
{
    var eyeangle = point_direction(x, y, obj_heart.x + 10, obj_heart.y + 10);
    targetEyeX = lengthdir_x(6, eyeangle);
    targetEyeY = lengthdir_y(6, eyeangle);
}
eyex = lerp(eyex, targetEyeX, 0.2);
eyey = lerp(eyey, targetEyeY, 0.2);
draw_sprite_ext(spr_halo_bat_sword, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_sprite_ext(spr_halo_bat_topBit, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_sprite_ext(spr_halo_bat_leftWing_animated, siner * 0.25, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_sprite_ext(spr_halo_bat_rightWing_animated, siner * 0.25, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_sprite_ext(spr_halo_bat_black, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_sprite_ext(spr_halo_bat_eyeWhite, 0, x + round(eyex * 0.2), y + round(eyey * 0.2), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_sprite_ext(spr_halo_bat_eyePupil, 0, x + round(eyex), y + round(eyey), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_sprite_ext(spr_halo_bat_halo, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
if (greenflash > 0)
{
    flashsiner += flashspeed;
    d3d_set_fog(true, c_lime, 0, 1);
    draw_sprite_ext(spr_halo_bat_sword, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, sin(flashsiner / 3));
    draw_sprite_ext(spr_halo_bat_topBit, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, sin(flashsiner / 3));
    draw_sprite_ext(spr_halo_bat_leftWing_animated, siner * 0.25, x, y, image_xscale, image_yscale, image_angle, image_blend, sin(flashsiner / 3));
    draw_sprite_ext(spr_halo_bat_rightWing_animated, siner * 0.25, x, y, image_xscale, image_yscale, image_angle, image_blend, sin(flashsiner / 3));
    draw_sprite_ext(spr_halo_bat_black, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, sin(flashsiner / 3));
    draw_sprite_ext(spr_halo_bat_eyeWhite, 0, x + round(eyex * 0.2), y + round(eyey * 0.2), image_xscale, image_yscale, image_angle, image_blend, sin(flashsiner / 3));
    draw_sprite_ext(spr_halo_bat_eyePupil, 0, x + round(eyex), y + round(eyey), image_xscale, image_yscale, image_angle, image_blend, sin(flashsiner / 3));
    draw_sprite_ext(spr_halo_bat_halo, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, sin(flashsiner / 3));
    d3d_set_fog(false, c_black, 0, 0);
    if (flashsiner > 4 && sin(flashsiner / 3) < 0)
    {
        greenflash = 0;
        flashsiner = 0;
    }
}
