siner++;
var ymod = sin(siner / 30) * 8;
if (sprite_index == spr_roaringknight_noarm)
    draw_sprite_ext(spr_roaringknight_armpoint, armpoint_index, x + 116, y + 62 + ymod, image_xscale, image_yscale, armpoint, image_blend, image_alpha);
draw_sprite_ext(sprite_index, image_index, x, y + ymod, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
if ((siner % 4) == 0 && image_alpha != 0)
{
    fade = scr_afterimage();
    fade.image_alpha = 0.6;
    fade.depth = obj_knight_enemy.depth + 1;
    fade.fadeSpeed = 0.04;
    fade.hspeed = 4;
    fade.vspeed = random_range(-knightafterimagerange, knightafterimagerange);
}
