if (i_ex(obj_tenna_enemy))
    exit;
var jump = abs(x - xprevious) * 0.125;
var jumpoff = -abs(sin(timer * 0.5) * jump * 2) + 4;
var ratio = 1;
if (tracker != -4)
{
    with (tracker)
        ratio = hp / maxhp;
}
draw_sprite_ext(sprite_index, image_index, floor(x), floor(y + jumpoff), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
var col = make_color_hsv(97.75 * ratio, 255 * (0.56 + (0.34 * (1 - ratio))), 219.29999999999998);
var bar_length = 65 * ratio;
draw_sprite_part_ext(spr_susiezilla_singlescreen_hpbar_bar, image_index, 8, 0, bar_length, 59, floor(x) - 26, floor((y - 118) + jumpoff), -image_xscale, image_yscale, col, image_alpha);
