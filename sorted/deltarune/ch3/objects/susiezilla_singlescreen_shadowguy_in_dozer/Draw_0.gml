var shakeamt = 0;
var xoff = 0;
var yoff = 0;
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
if (fakeheight < -3)
    draw_sprite_ext(spr_susiezilla_shadow, 0, x, y, min(0.25 + abs(fakeheight / 40), 1), 1, 0, image_blend, (0.25 * abs(fakeheight / 28)) + 0.25);
draw_set_color(c_white);
draw_set_alpha(1);
if (state == states.dead)
{
    xoff = -16 * facing;
    yoff = -24;
}
draw_set_color(#5F3417);
draw_line_width(x - (16 * facing), 0, x - (16 * facing), (y - 16) + ropeheight, 4);
if (facing)
    draw_sprite_ext(sprite_index, image_index, round(x) + shakeamt + xoff, round(y) + fakeheight + ropeheight + yoff, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
else
    draw_sprite_ext(sprite_index, image_index, (round(x) - 6) + shakeamt + xoff, round(y) + fakeheight + ropeheight + yoff, -image_xscale, image_yscale, image_angle, image_blend, image_alpha);
if (flash)
{
    d3d_set_fog(true, c_white, 0, 0);
    if (facing)
        draw_sprite_ext(spr_susiezilla_dogdozer_shield, 0, round(x) + shakeamt + xoff, round(y) + fakeheight + ropeheight + yoff, image_xscale, image_yscale, image_angle, image_blend, flash / 10);
    else
        draw_sprite_ext(spr_susiezilla_dogdozer_shield, 0, (round(x) - 6) + shakeamt + xoff, round(y) + fakeheight + ropeheight + yoff, -image_xscale, image_yscale, image_angle, image_blend, flash / 10);
    d3d_set_fog(false, c_white, 0, 0);
}
flash = scr_approach(flash, 0, 1);
draw_set_color(c_white);
draw_set_alpha(1);
