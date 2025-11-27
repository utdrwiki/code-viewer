if (i_ex(obj_tenna_enemy))
    exit;
var jump = abs(x - xprevious) * 0.125;
var jumpoff = -abs(sin(timer * 0.5) * jump * 2) + 4;
anim_timer += image_speed;
if (anim_timer >= 2)
    anim_timer -= 2;
var py1 = floor(anim_timer) * 4;
var time_format = string_format(time, 2, 0);
draw_set_font(fnt_comicsans);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_sprite_ext(sprite_index, image_index, round(x), y + jumpoff, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_sprite_ext(spr_susiezilla_shadowman_time_paper, image_index, round((x - 6) + py1), (y - 44) + jumpoff, image_xscale, flip_scale * 2, image_angle, image_blend, image_alpha);
if (!flip)
    draw_text_transformed_color(round((x - 6) + py1 + 2), (y - 44) + jumpoff, string_char_at(string(time_format), digit), 2, 2, 0, c_black, c_black, c_black, c_black, 1);
draw_sprite_ext(spr_susiezilla_hudguy_time_counter_overlay, anim_timer, round(x), y + jumpoff, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
