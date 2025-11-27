var shakeamt = 0;
if (drawshake == 4)
    shakeamt = 4;
if (drawshake == 3)
    shakeamt = -4;
if (drawshake == 2)
    shakeamt = 2;
if (drawshake == 1)
    shakeamt = -2;
drawshake--;
draw_set_alpha(0.5);
draw_set_color(c_black);
draw_sprite_ext(spr_susiezilla_shadow, 0, x + (shake * polarity), y, 4, 1, 0, image_blend, (0.25 * abs(fakeheight / 28)) + 0.25);
draw_set_color(c_white);
draw_set_alpha(1);
draw_sprite_ext(sprite_index, image_index, round(x) + shakeamt + (shake * polarity), round(y) + fakeheight + ropeheight, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
if (flash)
{
    d3d_set_fog(true, c_yellow, 0, 1);
    draw_sprite_ext(sprite_index, image_index, round(x) + shakeamt + (shake * polarity), round(y) + fakeheight + ropeheight, image_xscale, image_yscale, image_angle, image_blend, flash / 10);
    d3d_set_fog(false, c_white, 0, 0);
}
flash = scr_approach(flash, 0, 1);
draw_set_color(c_white);
draw_set_alpha(1);
if (state == states.charge)
{
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_font(fnt_comicsans);
    draw_set_color(c_maroon);
    draw_text_transformed(x, (y - 200) + (offset_index[hurt_index] * 7), string_format((state_timer / max_charge) * 100, 3, 1) + "%", 3, 3, ra);
    draw_set_color(c_red);
    draw_text_transformed(x + 2 + rxo, (y - 200) + 2 + ryo + (offset_index[hurt_index] * 7), string_format((state_timer / max_charge) * 100, 3, 1) + "%", 3, 3, ra);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_color(c_white);
}
if (state == states.fire)
    draw_sprite_ext(spr_susiezilla_laser_source, global.time, x + 116, (y - 44) + (laser_offset * 2), image_xscale, laser_wobble, 0, c_white, 1);
draw_sprite_ext(spr_susiezilla_censor_bar, hurt_index, round(x) + shakeamt + (!irandom(10) ? choose(-1, 1) : 0) + (shake * polarity), round(y) + fakeheight + ropeheight + (!irandom(10) ? choose(-1, 1) : 0), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
