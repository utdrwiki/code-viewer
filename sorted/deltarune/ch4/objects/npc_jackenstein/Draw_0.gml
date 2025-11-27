anim_index += anim_speed;
draw_sprite_ext(current_sprite_index, anim_index, x, y, image_xscale, 2, 0, c_white, base_alpha);
if (darkened)
{
    gpu_set_blendenable(false);
    gpu_set_colorwriteenable(false, false, false, true);
    draw_sprite_ext(current_sprite_index, anim_index, x, y, 2, 2, 0, c_white, 1);
    if (state == 2)
    {
        draw_set_alpha(0);
        ossafe_fill_rectangle(x + 20, (y + (sprite_get_height(current_sprite_index) * 2)) - 20, (x + (sprite_get_width(current_sprite_index) * 2)) - 20, y + (sprite_get_height(current_sprite_index) * 2), 0);
        draw_set_alpha(1);
    }
    gpu_set_blendenable(true);
    gpu_set_colorwriteenable(true, true, true, true);
    gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_dest_alpha);
    gpu_set_alphatestenable(true);
    draw_sprite_ext(current_sprite_index, anim_index, x + 2, y + 2, 2, 2, 0, c_black, base_alpha);
    gpu_set_alphatestenable(false);
    gpu_set_blendmode(bm_normal);
    if (state == 0)
    {
        if (is_laughing)
            eyes_anim += 0.2;
        if (current_eyes_sprite == 824)
            eyes_anim += 0.16666666666666666;
        draw_sprite_ext(current_eyes_sprite, eyes_anim, x, y, 2, 2, 0, c_white, eyes_alpha);
    }
}
if (state == 5)
{
    draw_set_color(c_white);
    draw_set_alpha(beam_alpha);
    d_circle(x + 25, y + 50, 15 + (sin(beam_siner) * 2), false);
    d_circle(x + 50, y + 45, 15 + (sin(beam_siner) * 2), false);
    draw_set_alpha(1);
    for (var i = 0; i < 6; i++)
    {
        scr_draw_beam(x + 25, y + 48, 800, beam_width, beam_rotation + (60 * i), c_white, 1, false);
        scr_draw_beam(x + 50, y + 44, 800, beam_width, beam_rotation + 25 + (60 * i), c_white, 1, false);
    }
    draw_set_alpha(1);
}
if (state == 7 || state == 8)
{
    if (heal_marker != -4)
        heal_marker.image_index = anim_index;
}
if (destroyoverlay == true)
{
    with (obj_darkness_overlay)
        instance_destroy();
    destroyoverlay = false;
}
