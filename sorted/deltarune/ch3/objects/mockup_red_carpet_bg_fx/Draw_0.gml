draw_rectangle_color(0, 0, room_width, 140, wall_dark, wall_dark, wall_light, wall_light, 0);
draw_rectangle_color(0, 140, room_width, 170, wall_light, wall_light, wall_light, wall_light, 0);
draw_rectangle_color(0, 170, room_width, 200, wall_light, wall_light, c_black, c_black, 0);
timer++;
move_amt = 1;
xadj -= move_amt;
if (xadj < -80)
    xadj = 0;
yadj += move_amt;
if (yadj > 88)
    yadj = 0;
for (var i = 0; i < 11; i++)
{
    var __x = (camerax() + xadj + (i * 40)) - 80 - 120;
    var __y = -80 + yadj + (44 * i);
    var amt = __y / 220;
    amt = clamp(amt, 0, 1);
    var colorSet = merge_color(#66839D, #8CB497, amt);
    var alph = 1 - (__y / 500);
    draw_sprite_ext(spr_dw_green_room_bg_fx_wallrow, 0, __x, __y, 2, 2, 0, colorSet, alph * 0.05);
    draw_sprite_ext(spr_dw_green_room_bg_fx_wallrow, 0, __x + 720, __y, 2, 2, 0, colorSet, alph * 0.05);
    draw_sprite_ext(spr_dw_green_room_bg_fx_wallrow, 0, __x + 1440, __y, 2, 2, 0, colorSet, alph * 0.05);
    draw_sprite_ext(spr_dw_green_room_bg_fx_wallrow, 0, __x + 40, __y, 2, 2, 0, colorSet, alph * 0.025);
    draw_sprite_ext(spr_dw_green_room_bg_fx_wallrow, 0, __x + 40 + 720, __y, 2, 2, 0, colorSet, alph * 0.025);
    draw_sprite_ext(spr_dw_green_room_bg_fx_wallrow, 0, __x + 40 + 1440, __y, 2, 2, 0, colorSet, alph * 0.025);
}
draw_set_alpha(0);
draw_rectangle(0, 0, room_width, 159, 0);
draw_set_alpha(1);
