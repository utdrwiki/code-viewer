if (enter_door)
{
    gerson_shadow = clamp(gerson_shadow + 0.2, 0, 1);
    var shadow = gerson_shadow;
    color_blend = merge_color(c_white, make_color_hsv(0, 0, 0), shadow);
    if (gerson_shadow >= 1)
        enter_door = false;
}
anim_index += anim_speed;
draw_sprite_ext(current_sprite_index, anim_index, x, y, image_xscale, 2, 0, color_blend, 1);
if (darkened)
{
    gpu_set_blendenable(false);
    gpu_set_colorwriteenable(false, false, false, true);
    draw_sprite_ext(current_sprite_index, anim_index, x, y, image_xscale, 2, 0, c_white, 0.5);
    draw_set_alpha(0);
    if (facing_right)
        ossafe_fill_rectangle(x * image_xscale, (y + (sprite_get_height(current_sprite_index) * 2)) - 2, x + (sprite_get_width(current_sprite_index) * 2), y + (sprite_get_height(current_sprite_index) * 2) + 20, 0);
    else
        ossafe_fill_rectangle(x, (y + (sprite_get_height(current_sprite_index) * 2)) - 2, x + (sprite_get_width(current_sprite_index) * 2), y + (sprite_get_height(current_sprite_index) * 2) + 20, 0);
    draw_set_alpha(1);
    gpu_set_blendenable(true);
    gpu_set_colorwriteenable(true, true, true, true);
    gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_dest_alpha);
    gpu_set_alphatestenable(true);
    draw_sprite_ext(current_sprite_index, anim_index, x, y + 4, image_xscale, 2, 0, c_black, 1);
    gpu_set_alphatestenable(false);
    gpu_set_blendmode(bm_normal);
}
