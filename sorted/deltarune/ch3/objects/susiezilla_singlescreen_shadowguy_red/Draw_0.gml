var shakeamt = 0;
if (drawshake == 4)
    shakeamt = 4;
if (drawshake == 3)
    shakeamt = -4;
if (drawshake == 2)
    shakeamt = 2;
if (drawshake == 1)
    shakeamt = -2;
var bobbl = 0;
if (state != states.dead)
    bobbl = sin(bobble * 0.1) * 3;
if (state == states.dead && hitstop < 0 && !gameover)
{
    speed *= 0.925;
    if ((abs(speed) < 6 || y > (cameray() + 420)) && state_timer < 9999)
    {
        sprite_index = s_hurt;
        image_index = 0;
        image_speed = 0.5;
        scr_lerpvar("ropeheight", ropeheight, ropeheight + 32, 8, 1, "out");
        scr_script_delayed(scr_lerpvar, 8, "ropeheight", ropeheight + 32, -720, 24, 1, "in");
        scr_script_delayed(instance_destroy, 60);
        state_timer = 9999;
    }
}
drawshake--;
draw_set_alpha(0.5);
draw_set_color(c_black);
if (fakeheight < -3)
    draw_sprite_ext(spr_susiezilla_shadow, 0, x, y, min(0.25 + abs(fakeheight / 40), 1), 1, 0, image_blend, (0.25 * abs(fakeheight / 28)) + 0.25);
draw_set_color(c_white);
draw_set_alpha(1);
draw_set_color(#5F3417);
if (ropeheight != -1)
    draw_line_width(x, 0, x, ((y + ropeheight) - 48) + bobbl, 4);
if (facing == 1)
    draw_sprite_ext(sprite_index, image_index, round(x) + shakeamt, round(y) + fakeheight + ropeheight + bobbl, image_xscale, image_yscale, image_angle, c_red, image_alpha);
else
    draw_sprite_ext(sprite_index, image_index, (round(x) - 6) + shakeamt, round(y) + fakeheight + ropeheight + bobbl, -image_xscale, image_yscale, image_angle, c_red, image_alpha);
if (flash)
{
    d3d_set_fog(true, c_white, 0, 0);
    if (facing == 1)
        draw_sprite_ext(sprite_index, image_index, round(x) + shakeamt, round(y) + fakeheight + ropeheight + bobbl, image_xscale, image_yscale, image_angle, c_red, flash / 10);
    else
        draw_sprite_ext(sprite_index, image_index, (round(x) - 6) + shakeamt, round(y) + fakeheight + ropeheight + bobbl, -image_xscale, image_yscale, image_angle, c_red, flash / 10);
    d3d_set_fog(false, c_white, 0, 0);
}
draw_set_color(c_white);
draw_set_alpha(1);
