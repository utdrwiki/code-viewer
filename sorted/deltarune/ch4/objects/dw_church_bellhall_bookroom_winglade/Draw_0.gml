flash = 0;
siner += 1;
animsiner++;
fsiner += 1;
eyetimer++;
if (eyetimer == 30)
{
    var eyeangle = random(360);
    targetEyeX = lengthdir_x(6, eyeangle);
    targetEyeY = lengthdir_y(6, eyeangle);
}
if (eyetimer == 90)
{
    eyetimer = (0 + irandom(8)) - irandom(8);
    targetEyeX = 0;
    targetEyeY = 0;
}
eyex = lerp(eyex, scr_even(targetEyeX), 0.2);
eyey = lerp(eyey, scr_even(targetEyeY), 0.2);
wingSpriteL = 5030;
wingSpriteR = 5351;
draw_sprite_ext(spr_halo_bat_sword, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_sprite_ext(spr_halo_bat_topBit, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_sprite_ext(wingSpriteL, siner * 0.25, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_sprite_ext(wingSpriteR, siner * 0.25, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_sprite_ext(spr_halo_bat_black, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_sprite_ext(spr_halo_bat_eyeWhite, 0, x + round(eyex * 0.2), y + round(eyey * 0.2), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_sprite_ext(spr_halo_bat_eyePupil, 0, x + round(eyex), y + round(eyey), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_sprite_ext(spr_halo_bat_halo, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
