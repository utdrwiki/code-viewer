var over = false;
with (obj_susiezilla_gamecontroller)
    over = gameover;
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
if (!over)
    drawshake--;
draw_set_color(#5F3417);
draw_line_width(x + 24 + 8, y + 14, x + 24 + 8 + (hspeed / 2), -5, 4);
if (!(invuln && (global.time % 4) < 2) || over)
{
    draw_set_color(c_white);
    if (facing == 0)
        draw_sprite_ext(sprite_index, image_index, x + shakeamt, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    else
        draw_sprite_ext(sprite_index, image_index, x + 72 + shakeamt, y, -2, 2, image_angle, image_blend, image_alpha);
}
draw_sprite_ext(spr_susiezilla_shadowSpot, 0, x + 12 + shakeamt, y + 84, 2, 2, 0, c_black, 0.5);
if (hitstop > 0)
{
    d3d_set_fog(true, c_yellow, 0, 1);
    if (facing == 0)
        draw_sprite_ext(sprite_index, image_index, x + shakeamt, y, 2, 2, image_angle, image_blend, 0.5);
    else
        draw_sprite_ext(sprite_index, image_index, x + 72 + shakeamt, y, -2, 2, image_angle, image_blend, 0.5);
    d3d_set_fog(false, c_black, 0, 0);
}
if (button1con == 1)
{
    if ((button1holdtime % 6) == 0)
        buttonflash = 1;
    else if (!over)
        buttonflash = lerp(buttonflash, 0, 0.125);
    d3d_set_fog(true, c_white, 0, 1);
    if (facing == 0)
        draw_sprite_ext(sprite_index, image_index, x + shakeamt, y, 2, 2, image_angle, image_blend, image_alpha * buttonflash * 0.5);
    else
        draw_sprite_ext(sprite_index, image_index, x + 72 + shakeamt, y, -2, 2, image_angle, image_blend, image_alpha * buttonflash * 0.5);
    d3d_set_fog(false, c_black, 0, 0);
}
else
{
    buttonflash = 0;
}
