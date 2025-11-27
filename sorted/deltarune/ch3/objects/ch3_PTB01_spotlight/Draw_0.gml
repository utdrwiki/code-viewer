if (!tenna_active)
    exit;
if (tenna_base_x < 0)
    tenna_base_x = camerax() + 480;
if (small_base_x < 0)
    small_base_x = camerax() + 210;
draw_set_alpha(0.2);
draw_set_color(c_black);
ossafe_fill_rectangle(camerax(), cameray(), camerax() + view_wport[0], cameray() + view_hport[0], false);
draw_set_color(c_white);
draw_set_alpha(1);
gpu_set_blendenable(false);
gpu_set_colorwriteenable(false, false, false, true);
draw_set_alpha(0);
draw_triangle_color(tenna_base_x, y - 620, tenna_base_x - tenna_base_x_offset, y + 315, tenna_base_x + tenna_base_x_offset, y + 315, c_white, 0, 0, false);
draw_ellipse(tenna_base_x - tenna_base_x_offset, y + 300, tenna_base_x + tenna_base_x_offset, y + 330, false);
draw_set_alpha(1);
if (ralsei_active)
{
    draw_set_alpha(0);
    draw_triangle_color(small_base_x, y - 610, small_base_x - 40, y + 315, small_base_x + 40, y + 315, c_white, 0, 0, false);
    draw_ellipse(small_base_x - 40, y + 300, small_base_x + 40, y + 330, false);
    draw_set_alpha(1);
}
gpu_set_blendenable(true);
gpu_set_colorwriteenable(true, true, true, true);
gpu_set_blendmode_ext(bm_src_alpha, bm_inv_dest_alpha);
draw_set_color(c_black);
ossafe_fill_rectangle(camerax(), cameray(), camerax() + view_wport[0], cameray() + view_hport[0], false);
draw_set_color(c_white);
gpu_set_blendmode(bm_normal);
gpu_set_blendmode(bm_add);
draw_set_alpha(0.5);
draw_triangle_color(tenna_base_x, y - 620, tenna_base_x - tenna_base_x_offset, y + 315, tenna_base_x + tenna_base_x_offset, y + 315, c_white, 0, 0, false);
draw_set_alpha(0.25);
draw_ellipse(tenna_base_x - tenna_base_x_offset, y + 300, tenna_base_x + tenna_base_x_offset, y + 330, false);
draw_set_alpha(1);
if (ralsei_active)
{
    draw_set_alpha(0.5);
    draw_triangle_color(small_base_x, y - 610, small_base_x - 40, y + 315, small_base_x + 40, y + 315, c_white, 0, 0, false);
    draw_set_alpha(0.25);
    draw_ellipse(small_base_x - 40, y + 300, small_base_x + 40, y + 330, false);
    draw_set_alpha(1);
}
gpu_set_blendmode(bm_normal);
