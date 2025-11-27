var shakeamt = 0;
if (drawshake == 8)
    shakeamt = 8;
if (drawshake == 7)
    shakeamt = -8;
if (drawshake == 6)
    shakeamt = 6;
if (drawshake == 5)
    shakeamt = -6;
if (drawshake == 4)
    shakeamt = 4;
if (drawshake == 3)
    shakeamt = -4;
if (drawshake == 2)
    shakeamt = 2;
if (drawshake == 1)
    shakeamt = -2;
if (speed > 1)
    image_angle = lerp(image_angle, round(-round(x) / 12) * 12, 0.5);
draw_set_color(c_white);
draw_set_alpha(1);
if (fakeheight < -3)
    draw_sprite_ext(spr_susiezilla_shadow, 0, x, y + (sprite_height / 2), min(0.25 + abs(fakeheight / 40), 0.5), 1, 0, image_blend, min((0.25 * abs(fakeheight / 28)) + 0.25, 0.5));
draw_sprite_ext(sprite_index, image_index, round(x) + shakeamt, round(y) + fakeheight, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
