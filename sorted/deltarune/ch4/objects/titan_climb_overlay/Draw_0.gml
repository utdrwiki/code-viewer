siner++;
gpu_set_blendenable(false);
gpu_set_colorwriteenable(false, false, false, true);
draw_set_alpha(overlay_alpha);
ossafe_fill_rectangle(0, 0, room_width + 20, room_height + 20, false);
draw_set_alpha(1);
if (target != -4)
{
    draw_set_alpha(0);
    base_x_pos = scr_movetowards(base_x_pos, target.x + x_pos_offset, 10);
    d_circle(base_x_pos, target.y + 20, radius + sin(siner / 12), false);
    draw_set_alpha(1);
}
gpu_set_blendenable(true);
gpu_set_colorwriteenable(true, true, true, true);
gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_dest_alpha);
draw_set_alpha(0);
draw_set_color(c_black);
ossafe_fill_rectangle(-10, -10, room_width + 10, room_height + 10);
draw_set_color(c_white);
draw_set_alpha(1);
gpu_set_blendmode(bm_normal);
