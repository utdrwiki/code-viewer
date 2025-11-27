ossafe_fill_rectangle_color(0, 80, room_width, 240, wall_dark, wall_dark, wall_light, wall_light, 0);
timer++;
xadj -= 1;
if (xadj < -80)
    xadj = 0;
yadj += 1;
if (yadj > 88)
    yadj = 0;
for (var i = 0; i < 11; i++)
{
    var __x = (xadj + (i * 40)) - 80 - 120;
    var __y = -40 + yadj + (44 * i);
    var amt = __y / 220;
    amt = clamp(amt, 0, 1);
    var colorSet = merge_color(#66839D, #8CB497, amt);
    var alph = 1 - (__y / 500);
    draw_sprite_ext(spr_dw_green_room_bg_fx_wallrow, 0, __x, __y, 2, 2, 0, colorSet, alph);
    draw_sprite_ext(spr_dw_green_room_bg_fx_wallrow, 0, __x + 720, __y, 2, 2, 0, colorSet, alph);
    draw_sprite_ext(spr_dw_green_room_bg_fx_wallrow, 0, __x + 1440, __y, 2, 2, 0, colorSet, alph);
    draw_sprite_ext(spr_dw_green_room_bg_fx_wallrow, 0, __x + 40, __y, 2, 2, 0, colorSet, alph * 0.25);
    draw_sprite_ext(spr_dw_green_room_bg_fx_wallrow, 0, __x + 40 + 720, __y, 2, 2, 0, colorSet, alph * 0.25);
    draw_sprite_ext(spr_dw_green_room_bg_fx_wallrow, 0, __x + 40 + 1440, __y, 2, 2, 0, colorSet, alph * 0.25);
}
draw_set_color(c_black);
ossafe_fill_rectangle(0, 240, room_width, room_height, 0);
draw_set_color(c_white);
draw_set_color(#F4B688);
ossafe_fill_rectangle(0, 240, room_width, room_height, 0);
draw_set_color(c_white);
gpu_set_blendenable(false);
gpu_set_colorwriteenable(false, false, false, true);
draw_set_alpha(0);
ossafe_fill_rectangle(0, 0, room_width, 239, 0);
draw_set_alpha(1);
gpu_set_blendenable(true);
gpu_set_colorwriteenable(true, true, true, true);
gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_dest_alpha);
gpu_set_alphatestenable(true);
var base_x = camerax() / 2;
var base_y = (cameray() / 2) + 42;
var _angle = 40;
var _x_offset = -100;
var _y_offset = -140;
draw_sprite_ext(spr_pixel_white, 0, base_x + 60 + _x_offset, base_y + 540 + _y_offset, 150, 50, _angle, grad_a, 1);
draw_sprite_ext(spr_pixel_white, 0, base_x + 660 + _x_offset, base_y + 540 + _y_offset, 120, 50, _angle, grad_a, 1);
draw_sprite_ext(spr_pixel_white, 0, base_x + 164 + _x_offset, base_y + 550 + _y_offset, 150, 14, _angle, grad_b, 1);
gpu_set_alphatestenable(false);
gpu_set_blendmode(bm_normal);
draw_sprite_ext(spr_pixel_white, 0, base_x + 195 + _x_offset, base_y + 422 + _y_offset, 34, 2, _angle, blend_a, 0.5);
draw_sprite_ext(spr_pixel_white, 0, base_x + 237 + _x_offset, base_y + 646 + _y_offset, 122, 2, _angle, blend_a, 0.5);
draw_sprite_ext(spr_pixel_white, 0, base_x + 171 + _x_offset, base_y + 542 + _y_offset, 90, 1, _angle, blend_b, 0.5);
draw_sprite_ext(spr_pixel_white, 0, base_x + 251 + _x_offset, base_y + 548 + _y_offset, 86, 1, _angle, blend_b, 0.5);
draw_set_color(c_black);
ossafe_fill_rectangle(0, 0, room_width, 80, 0);
ossafe_fill_rectangle(0, 360, room_width, room_height, 0);
draw_set_color(c_white);
