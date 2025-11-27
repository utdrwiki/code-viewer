ossafe_fill_rectangle_color(0, 40, room_width, 147, wall_dark, wall_dark, wall_light, wall_light);
timer++;
xadj -= (1 * tile_speed);
if (xadj < -80)
    xadj = 0;
yadj += (1 * tile_speed);
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
draw_set_color(#F4B688);
ossafe_fill_rectangle(0, 160, room_width, room_height);
draw_set_color(c_white);
gpu_set_blendenable(false);
gpu_set_colorwriteenable(false, false, false, true);
draw_set_alpha(0);
ossafe_fill_rectangle(0, 0, room_width, 159);
draw_set_alpha(1);
gpu_set_blendenable(true);
gpu_set_colorwriteenable(true, true, true, true);
gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_dest_alpha);
gpu_set_alphatestenable(true);
var base_x = camerax() / 2;
draw_sprite_ext(spr_pixel_white, 0, base_x + 60, 440, 150, 50, 45, grad_a, 1);
draw_sprite_ext(spr_pixel_white, 0, base_x + 660, 480, 120, 50, 45, grad_a, 1);
draw_sprite_ext(spr_pixel_white, 0, base_x + 164, 450, 150, 14, 45, grad_b, 1);
gpu_set_alphatestenable(false);
gpu_set_blendmode(bm_normal);
draw_sprite_ext(spr_pixel_white, 0, base_x + 55, 440, 102, 2, 45, blend_a, 0.5);
draw_sprite_ext(spr_pixel_white, 0, base_x + 337, 440, 102, 2, 45, blend_a, 0.5);
draw_sprite_ext(spr_pixel_white, 0, base_x + 654, 480, 115, 2, 45, blend_a, 0.5);
draw_sprite_ext(spr_pixel_white, 0, base_x + 171, 440, 100, 1, 45, blend_b, 0.5);
draw_sprite_ext(spr_pixel_white, 0, base_x + 251, 440, 100, 1, 45, blend_b, 0.5);
