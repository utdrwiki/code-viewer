ossafe_fill_rectangle_color(160, 80, 479, 199, wall_dark, wall_dark, wall_light, wall_light, 0);
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
ossafe_fill_rectangle(0, 200, room_width, room_height, 0);
draw_set_color(c_white);
draw_set_color(#F4B688);
ossafe_fill_rectangle(160, 200, 479, room_height, 0);
draw_set_color(c_white);
gpu_set_blendenable(false);
gpu_set_colorwriteenable(false, false, false, true);
draw_set_alpha(0);
ossafe_fill_rectangle(0, 0, room_width, 199, 0);
draw_set_alpha(1);
gpu_set_blendenable(true);
gpu_set_colorwriteenable(true, true, true, true);
gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_dest_alpha);
gpu_set_alphatestenable(true);
var base_x = camerax() / 2;
var base_y = (cameray() / 2) + 72;
draw_sprite_ext(spr_pixel_white, 0, base_x + 60, base_y + 540, 150, 50, 45, grad_a, 1);
draw_sprite_ext(spr_pixel_white, 0, base_x + 660, base_y + 540, 120, 50, 45, grad_a, 1);
draw_sprite_ext(spr_pixel_white, 0, base_x + 164, base_y + 550, 150, 14, 45, grad_b, 1);
gpu_set_alphatestenable(false);
gpu_set_blendmode(bm_normal);
draw_sprite_ext(spr_pixel_white, 0, base_x + 195, base_y + 400, 100, 2, 45, blend_a, 0.5);
draw_sprite_ext(spr_pixel_white, 0, base_x + 237, base_y + 640, 100, 2, 45, blend_a, 0.5);
draw_sprite_ext(spr_pixel_white, 0, base_x + 654, base_y + 540, 100, 2, 45, blend_a, 0.5);
draw_sprite_ext(spr_pixel_white, 0, base_x + 171, base_y + 540, 100, 1, 45, blend_b, 0.5);
draw_sprite_ext(spr_pixel_white, 0, base_x + 251, base_y + 540, 100, 1, 45, blend_b, 0.5);
draw_set_color(c_black);
ossafe_fill_rectangle(0, 0, room_width, 80, 0);
ossafe_fill_rectangle(0, 0, 159, room_height, 0);
ossafe_fill_rectangle(480, 0, room_width, room_height, 0);
ossafe_fill_rectangle(0, 400, 279, room_height, 0);
ossafe_fill_rectangle(360, 400, room_width, room_height, 0);
draw_set_color(c_white);
