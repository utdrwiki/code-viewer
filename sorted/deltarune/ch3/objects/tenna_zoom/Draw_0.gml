var a = image_alpha - 1;
if (con == 3 && a < 1)
    a = 1;
if (sprite_exists(screenshot))
    a = 0;
draw_sprite_ext(spr_tenna_grasp_zoom_static, index, x, y, 2, 2, image_angle, image_blend, a);
draw_sprite_ext(spr_tenna_grasp_static, index, x, y, 2, 2, 0, c_white, image_alpha);
index += 0.5;
draw_set_alpha(1);
if (!surface_exists(_surface))
    _surface = surface_create(room_width, room_height);
if (sprite_exists(screenshot) && con != 1)
{
    surface_set_target(_surface);
    draw_clear_alpha(c_white, 0);
    gpu_set_blendenable(false);
    draw_sprite_ext(screenshot, 0, 0, 0, 1, 1, 0, c_white, 1);
    gpu_set_blendenable(true);
    draw_set_blend_mode(bm_subtract);
    draw_sprite_ext(spr_tenna_grasp_mask, 0, x, y, 2, 2, 0, c_white, 1);
    draw_set_blend_mode(bm_add);
    draw_set_blend_mode(bm_normal);
    surface_reset_target();
    if (!i_ex(obj_tenna_enemy) || obj_tenna_enemy.minigamefailcon == 0)
        draw_surface_ext(_surface, x - (anchor_x * surface_scale), (y - (anchor_y * surface_scale)) + yoffset, surface_scale, surface_scale, 0, c_white, 1);
    if (i_ex(obj_tenna_enemy))
    {
        with (markkris)
            draw_self();
        with (marksusie)
            draw_self();
        with (markralsei)
            draw_self();
    }
    draw_sprite_ext(spr_tenna_grasp_static, index, x, y, 2, 2, 0, c_white, image_alpha);
}
if ((con == 1 && i_ex(obj_tenna_enemy)) || (con == 2 && i_ex(obj_tenna_enemy)))
{
    if (xcon == 0)
    {
        if (whitex_alpha < 0.6)
            whitex_alpha += 0.1;
        if (obj_tenna_enemy.minigamefailcount >= 1)
        {
            redx_1_scale = lerp(redx_1_scale, 1, 0.4);
            if (redx_1_alpha < 1)
                redx_1_alpha += 0.4;
        }
        if (obj_tenna_enemy.minigamefailcount >= 2)
        {
            redx_2_scale = lerp(redx_2_scale, 1, 0.4);
            if (redx_2_alpha < 1)
                redx_2_alpha += 0.4;
        }
        if (obj_tenna_enemy.minigamefailcount >= 3)
        {
            redx_3_scale = lerp(redx_3_scale, 1, 0.6);
            if (redx_3_alpha < 1)
                redx_3_alpha += 0.4;
        }
    }
    else
    {
        if (redx_1_alpha > 0)
            redx_1_alpha -= 0.2;
        if (redx_2_alpha > 0)
            redx_2_alpha -= 0.2;
        if (redx_3_alpha > 0)
            redx_3_alpha -= 0.2;
        if (whitex_alpha > 0)
            whitex_alpha -= 0.2;
    }
}
