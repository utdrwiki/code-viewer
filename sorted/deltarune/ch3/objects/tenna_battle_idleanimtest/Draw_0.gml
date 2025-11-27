animsiner++;
image_xscale = 2;
image_yscale = 2;
var bx = sin(animsiner / 6) * 5;
var by = -abs(cos(animsiner / 4)) * 5;
var armx = sin(animsiner / 6) * 9;
var army = cos(animsiner / 6) * 6;
var headx = sin(animsiner / 6) * 8;
var heady = (sin(animsiner / 6) * 6) + 4;
var legx = sin((animsiner + 4) / 6) * 5;
var legy = cos(animsiner / 6) * 2;
sprite_index = spr_tenna_battle_full;
animsinerb++;
var image = animsiner / 6;
var loopimage = 1.5 + (sin(image) * 1.5);
var loopimage1 = 1 + (sin(image) * 1);
var tailimage = image;
armshake *= -1;
armshakesiner++;
var chargingup = 1;
var armshakevalue = clamp((sin((armshakesiner / 18) - 1) * 1.5) - 1, 0, 4);
var armshakey = armshakevalue * armshake;
var headimage = 2;
if (chargingup == 0)
{
    armshakey = 0;
    armshakevalue = 0;
}
draw_monster_body_part_ext(spr_tenna_battle_leg_l, image, x - legx, y + legy, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_monster_body_part_ext(spr_tenna_battle_leg_r, image, x + legx, y - (legy / 4), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_monster_body_part_ext(spr_tenna_battle_tails, tailimage, (x + (bx / 2)) - 4, y + by, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_monster_body_part_ext(spr_tenna_battle_arm_back, 3 - loopimage, ((x + bx) - (armx * 1.5)) + 12, (y + by) - army, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_monster_body_part_ext(spr_tenna_battle_torso, 0, x + bx, y + by, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_monster_body_part_ext(spr_tenna_battle_tie, 0, x + bx, y + by, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_monster_body_part_ext(spr_tenna_battle_face, headimage - (armshakevalue * 5), ((x + bx) - headx) + 2 + (armshakey / 2), (y + by + heady) - 2 - (armshakey / 2), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_monster_body_part_ext(spr_tenna_battle_arm_front, loopimage, ((x + bx) - armx) + armshakey, y + by + army + armshakey, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
