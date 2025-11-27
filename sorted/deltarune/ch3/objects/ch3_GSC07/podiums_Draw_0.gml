if (con < 0 || podium_sprite == -4)
    exit;
gpu_set_blendenable(false);
gpu_set_colorwriteenable(false, false, false, true);
if (mode == 0)
{
    draw_sprite_ext(spr_dw_gameshow_podium, 0, 100, 280, 2, 2, 0, c_white, 1);
    draw_sprite_ext(spr_dw_gameshow_podium, 0, 184, 280, 2, 2, 0, c_white, 1);
    draw_sprite_ext(spr_dw_gameshow_podium, 0, 268, 280, 2, 2, 0, c_white, 1);
}
else if (mode == 1)
{
    draw_sprite_ext(spr_dw_gameshow_podium, 0, 100, 410, 2, 2, 0, c_white, 1);
    draw_sprite_ext(spr_dw_gameshow_podium, 0, 250, 410, 2, 2, 0, c_white, 1);
    draw_sprite_ext(spr_dw_gameshow_podium, 0, 400, 410, 2, 2, 0, c_white, 1);
}
draw_set_alpha(0);
ossafe_fill_rectangle(136, 206, 151, 293);
ossafe_fill_rectangle(220, 206, 235, 293);
draw_set_alpha(1);
gpu_set_blendenable(true);
gpu_set_colorwriteenable(true, true, true, true);
gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_dest_alpha);
gpu_set_alphatestenable(true);
pal_swap_set(spr_gameshow_palette, palette_index, false);
if (mode == 0)
{
    draw_sprite_part(podium_sprite, 0, 68, 206, 236, 88, 68, 206);
}
else if (mode == 1)
{
    draw_sprite_part(podium_sprite, 0, 152, 206, 68, 88, 68, 336);
    draw_sprite_part(podium_sprite, 0, 68, 206, 68, 88, 218, 336);
    draw_sprite_part(podium_sprite, 0, 236, 206, 68, 88, 368, 336);
}
pal_swap_reset();
gpu_set_alphatestenable(false);
gpu_set_blendmode(bm_normal);
