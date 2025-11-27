gpu_set_blendenable(true);
gpu_set_colorwriteenable(false, false, false, true);
draw_set_alpha(overlay_alpha);
ossafe_fill_rectangle(0, 0, room_width + 20, room_height + 20, false);
draw_set_alpha(1);
if (heart_target != -4)
{
    if (glow_active)
        heart_siner++;
    if (heart_mode)
    {
        if (glow_active)
            draw_sprite_ext(heart_target.sprite_index, 0, heart_target.x, heart_target.y, heart_target.image_xscale, heart_target.image_yscale, heart_target.image_angle, c_white, 1);
        scr_draw_circle_lowres(heart_target.x + 3 + radius_offset, heart_target.y + 2.5, heart_radius + 0.8 + (sin(heart_siner / 20) * 0.6), false, false);
    }
    else if (fall_mode)
    {
        draw_sprite_ext(heart_target.sprite_index, 0, heart_target.x, heart_target.y, heart_target.image_xscale, heart_target.image_yscale, heart_target.image_angle, c_white, 1);
    }
    else if (angel_mode)
    {
        scr_draw_circle_lowres(heart_target.x + 3, heart_target.y - 1, heart_radius + 0.8 + (sin(heart_siner / 20) * 0.6), false);
    }
}
if (noelle_light_target != -4)
    draw_sprite_ext(noelle_light_target.sprite_index, 0, noelle_light_target.x, noelle_light_target.y, noelle_light_target.image_xscale, noelle_light_target.image_yscale, noelle_light_target.image_angle, c_white, 1);
if (susie_light_target != -4)
    draw_sprite_ext(susie_light_target.sprite_index, 0, susie_light_target.x, susie_light_target.y, susie_light_target.image_xscale, susie_light_target.image_yscale, susie_light_target.image_angle, c_white, 1);
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
if (tree_target != -4)
{
    tree_overlay.x = tree_target.x;
    tree_overlay.y = tree_target.y;
    tree_overlay.image_index = tree_target.image_index;
    tree_overlay.image_alpha = overlay_alpha;
}
if (angel_target != -4)
{
    angel_overlay.x = angel_target.x;
    angel_overlay.y = angel_target.y;
    angel_overlay.image_index = angel_target.image_index;
    angel_overlay.image_angle = angel_target.image_angle;
    angel_overlay.image_blend = merge_color(c_white, c_black, overlay_alpha + 0.1);
}
if (room == room_lw_noellehouse_dess)
{
    draw_set_color(c_black);
    ossafe_fill_rectangle(0, 0, view_wport[0], 45, false);
    ossafe_fill_rectangle(0, cameray(), 19, view_hport[0], false);
    draw_set_color(c_white);
    gpu_set_blendenable(false);
    gpu_set_colorwriteenable(false, false, false, true);
    draw_set_alpha(0);
    ossafe_fill_rectangle(camerax() + 20, 46, 260, 219, false);
    ossafe_fill_rectangle(125, 220, 164, cameray() + view_hport[0], false);
    draw_set_alpha(1);
    gpu_set_blendenable(true);
    gpu_set_colorwriteenable(true, true, true, true);
    gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_dest_alpha);
    gpu_set_alphatestenable(true);
    draw_set_color(c_black);
    ossafe_fill_rectangle(camerax(), cameray(), camerax() + view_wport[0], cameray() + view_hport[0], false);
    draw_set_color(c_white);
    d3d_set_fog(false, c_black, 0, 0);
    gpu_set_alphatestenable(false);
    gpu_set_blendmode(bm_normal);
    draw_set_color(c_black);
    ossafe_fill_rectangle(camerax(), 220, 124, view_hport[0] + 10);
    ossafe_fill_rectangle(165, 220, view_wport[0] + 10, view_hport[0] + 10);
    ossafe_fill_rectangle(262, -10, view_wport[0] + 10, view_hport[0] + 10);
    ossafe_fill_rectangle(260, 0, view_wport[0] + 10, 45, false);
    draw_set_color(c_white);
}
