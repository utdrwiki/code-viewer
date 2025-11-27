if (i_ex(obj_tenna_enemy))
    exit;
var jump = abs(x - xprevious) * 0.125;
var jumpoff = -abs(sin(timer * 0.5) * jump * 2) + 4;
var py1 = floor(image_index) * 4;
var py3 = -floor(image_index) * 4;
my_score = min(my_score, 999);
global.flag[1118] = my_score;
digits = string_length(string(my_score));
switch (digits)
{
    case 1:
        sprite_index = spr_susiezilla_hudguy_score1;
        break;
    case 2:
        sprite_index = spr_susiezilla_hudguy_score2;
        break;
    case 3:
        sprite_index = spr_susiezilla_hudguy_score3;
        break;
}
draw_set_font(fnt_comicsans);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_sprite_ext(spr_susiezilla_shadowman_score_paper, image_index, x + 52, ((y - 82) + jumpoff) - py1, image_xscale, flip1_scale * 2, image_angle, image_blend, image_alpha);
if (!flip1)
    draw_text_transformed_color(x + 52 + 1, ((y - 82) + jumpoff) - py1, string_char_at(string(my_score), 1), 2, 2, 0, c_black, c_black, c_black, c_black, 1);
if (digits >= 3)
{
    draw_sprite_ext(spr_susiezilla_shadowman_score_paper, image_index, x + 50, ((y - 24) + jumpoff) - (py3 * 0.5), image_xscale, flip3_scale * 2, image_angle, image_blend, image_alpha);
    if (!flip3)
        draw_text_transformed_color(x + 50 + 1, ((y - 24) + jumpoff) - (py3 * 0.5), string_char_at(string(my_score), 3), 2, 2, 0, c_black, c_black, c_black, c_black, 1);
}
draw_sprite_ext(sprite_index, image_index, x, y + jumpoff, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
if (digits >= 3)
    draw_sprite_ext(spr_susiezilla_hudguy_score_overlay3, image_index, x, y + jumpoff, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
if (digits >= 2)
{
    draw_sprite_ext(spr_susiezilla_shadowman_score_paper, image_index, x + 44 + (py1 * 0.5), ((y - 50) + jumpoff) - py1, image_xscale, flip2_scale * 2, image_angle, image_blend, image_alpha);
    if (!flip2)
        draw_text_transformed_color(x + 44 + (py1 * 0.5) + 1, ((y - 50) + jumpoff) - py1, string_char_at(string(my_score), 2), 2, 2, 0, c_black, c_black, c_black, c_black, 1);
    draw_sprite_ext(spr_susiezilla_hudguy_score_overlay2, image_index, x, y + jumpoff, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
draw_set_halign(fa_left);
draw_set_valign(fa_top);
