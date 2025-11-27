gpu_set_blendenable(true);
gpu_set_colorwriteenable(false, false, false, true);
draw_set_alpha(overlay_alpha);
ossafe_fill_rectangle(0, 0, room_width + 20, room_height + 20, false);
draw_set_alpha(1);
if (heart_target != -4)
{
    heart_siner++;
    draw_sprite_ext(heart_target.sprite_index, 0, heart_target.x, heart_target.y, heart_target.image_xscale, heart_target.image_yscale, heart_target.image_angle, c_white, 1);
    d_circle(heart_target.x + 3.5, heart_target.y + 2.5, heart_radius + 0.8 + (sin(heart_siner / 20) * 0.6), false);
}
gpu_set_blendenable(true);
gpu_set_colorwriteenable(true, true, true, true);
gpu_set_blendmode_ext(bm_src_alpha, bm_dest_alpha);
draw_set_alpha(0);
draw_set_color(c_black);
ossafe_fill_rectangle(-10, -10, room_width + 10, room_height + 10);
ossafe_fill_rectangle(-10, -10, room_width + 10, room_height + 10);
draw_set_color(c_white);
draw_set_alpha(1);
gpu_set_blendmode(bm_normal);
