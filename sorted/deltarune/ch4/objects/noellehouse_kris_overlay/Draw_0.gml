if (!overlay_active)
    exit;
pulse_timer--;
if (pulse_timer <= 0)
{
    pulse_timer = pulse_time;
    pulse_dark();
}
gpu_set_blendenable(true);
gpu_set_colorwriteenable(false, false, false, true);
draw_set_alpha(overlay_alpha);
ossafe_fill_rectangle(0, 0, room_width + 20, room_height + 20, false);
draw_set_alpha(1);
if (target != -4)
{
    heart_siner++;
    d_circle(target.x + 9 + (sin(heart_siner / 40) * 0.4), target.y + 16 + (cos(heart_siner / 40) * 0.4), heart_radius + 3.2 + (sin(heart_siner / 20) * 0.6), false);
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
gpu_set_blendenable(true);
gpu_set_colorwriteenable(false, false, false, true);
draw_set_alpha(overlay_alpha);
ossafe_fill_rectangle(0, 0, room_width + 20, room_height + 20, false);
draw_set_alpha(1);
if (target != -4)
{
    heart_siner++;
    d_circle(target.x + 9 + (sin(heart_siner / 30) * 0.4), target.y + 18 + (cos(heart_siner / 30) * 0.4), heart_radius + 4 + (sin(heart_siner / 30) * 0.6), false);
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
