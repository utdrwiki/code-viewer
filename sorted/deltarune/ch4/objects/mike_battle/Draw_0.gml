if (blush > 0)
    blush_alpha = scr_approach(blush_alpha, 1, 0.1);
else
    blush_alpha = scr_approach(blush_alpha, 0, 0.1);
if (sprite_index == spr_mike_small || sprite_index == spr_mike_s)
{
    anim[0] += 1;
    anim[10] += 50;
    if (talking)
    {
        talk_ind += 0.5;
        if (talk_ind > 3)
            talk_ind = 0;
        anim[5] = min(anim[5], 60);
        anim[1] += sin(anim[0] - 90) * 2;
        if (anim[0] > 150)
            anim[0] = 0;
    }
    else
    {
        talk_ind = 0;
        anim[1] = scr_approach(anim[1], 0, 1);
        anim[5] += 1;
    }
    anim[2] = cos(anim[10] / 200) * 2;
    anim[3] = sin(100 + (anim[10] / 400)) - cos(anim[10] / 200);
    if (anim[5] > 60)
    {
        anim[7] += sin(50 + (anim[5] * 100)) * 0.05;
        if (anim[5] > 120)
            anim[5] = 0;
    }
    else
    {
        anim[7] += (0 - anim[7]) * 0.1;
    }
    anim[8] = 22 + (-22 * (1 - anim[7]));
    draw_sprite_ext(spr_mike_small, 1, x, y - anim[8], image_xscale * xscale, (image_yscale * yscale) + anim[7], image_angle, image_blend, image_alpha);
    draw_sprite_ext(spr_mike_small, 2, x, (y - anim[8]) + anim[1], image_xscale * xscale, image_yscale * yscale, image_angle, image_blend, image_alpha);
    if (sad && !talking)
        draw_sprite_ext(spr_mike_small, 10, x, ((y + 2) - anim[8]) + anim[1], image_xscale * xscale, image_yscale * yscale, image_angle, image_blend, image_alpha);
    else
        draw_sprite_ext(spr_mike_small, 3 + clamp(talk_ind, 0, 3), x, (y - anim[8]) + anim[1], image_xscale * xscale, image_yscale * yscale, image_angle, image_blend, image_alpha);
    if (blush_alpha > 0)
    {
        draw_sprite_ext(spr_blush, 0, x - (8 * image_xscale), ((y - anim[8]) + anim[1]) - (10 * image_yscale), 1, 1, 0, c_white, blush_alpha);
        draw_sprite_ext(spr_blush, 0, x + (8 * image_xscale), ((y - anim[8]) + anim[1]) - (10 * image_yscale), 1, 1, 0, c_white, blush_alpha);
    }
    draw_sprite_ext(spr_mike_small, 7, x + anim[2], (y - anim[8]) + anim[3], image_xscale * xscale, image_yscale * yscale, image_angle, image_blend, image_alpha);
    draw_sprite_ext(spr_mike_small, 8, x + anim[3], (y - anim[8]) + anim[2], image_xscale * xscale, image_yscale * yscale, image_angle, image_blend, image_alpha);
    draw_sprite_ext(spr_mike_small, 9, x, y - anim[8], image_xscale * xscale, image_yscale * yscale, image_angle, image_blend, image_alpha);
}
else if (sprite_index == spr_mike_med || sprite_index == spr_mike_m || sprite_index == spr_mike_med_sad)
{
    var _sp = sprite_index;
    image_speed = 1;
    if (sprite_index == spr_mike_m)
    {
        _sp = 2133;
        image_speed = 0.25;
    }
    draw_sprite_ext(_sp, image_index, x, y, image_xscale * xscale, image_yscale * yscale, image_angle, image_blend, image_alpha);
    if (blush_alpha > 0)
    {
        var bx = 8;
        var bx2 = -20;
        var by = sin(image_index);
        if (image_index > 4)
            bx2 = -10;
        blush_x += ((bx2 - blush_x) * 0.25);
        draw_sprite_ext(spr_blush, 0, (x - (bx * image_xscale)) + (round(blush_x / 2) * 2), (((y + by) - anim[8]) + anim[1]) - (10 * image_yscale), 1, 1, 0, c_white, blush_alpha);
        draw_sprite_ext(spr_blush, 0, x + (bx * image_xscale) + (round(blush_x / 2) * 2), (((y + by) - anim[8]) + anim[1]) - (10 * image_yscale), 1, 1, 0, c_white, blush_alpha);
    }
}
else if (sprite_index == spr_mike_big || sprite_index == spr_mike_l)
{
    anim[0] += 1;
    anim[10] += 50;
    if (talking)
    {
        anim[5] = min(anim[5], 60);
        anim[1] -= sin((anim[0] - 120) / 4) * 2;
        if (anim[0] > 260)
            anim[0] = 0;
    }
    else
    {
        anim[1] = scr_approach(anim[1], 0, 1);
        anim[5] += 1;
    }
    anim[2] = cos(anim[10] / 200) * 2;
    anim[3] = sin(100 + (anim[10] / 400)) - cos(anim[10] / 200);
    if (anim[5] > 90)
    {
        anim[7] += sin(50 + (anim[5] * 75)) * 0.03;
        if (anim[5] > 150)
            anim[5] = 0;
    }
    else
    {
        anim[7] += (0 - anim[7]) * 0.1;
    }
    anim[8] = 43 + (-43 * (1 - anim[7]));
    draw_sprite_ext(spr_mike_big, 1, x + anim[2], (y - anim[8]) + anim[3], image_xscale * xscale, image_yscale * yscale, image_angle, image_blend, image_alpha);
    draw_sprite_ext(spr_mike_big, 2, x, y - anim[8], image_xscale * xscale, (image_yscale * yscale) + anim[7], image_angle, image_blend, image_alpha);
    draw_sprite_ext(spr_mike_big, 3, x, y - anim[8], image_xscale * xscale, (image_yscale * yscale) + anim[7], image_angle, image_blend, image_alpha);
    draw_sprite_ext(spr_mike_big, 6, x, y - anim[8], image_xscale * xscale, image_yscale * yscale, image_angle + anim[1], image_blend, image_alpha);
    draw_sprite_ext(spr_mike_big, 5, x, y - anim[8], image_xscale * xscale, image_yscale * yscale, image_angle + anim[1], image_blend, image_alpha);
    draw_sprite_ext(spr_mike_big, 4, x, y - anim[8], image_xscale * xscale, image_yscale * yscale, image_angle - anim[2], image_blend, image_alpha);
    if (blush_alpha > 0)
    {
        var bx = 6;
        var bx2 = -14 - anim[1];
        blush_x += ((bx2 - blush_x) * 0.25);
        draw_sprite_ext(spr_blush, 0, (x - (bx * image_xscale)) + (round(blush_x / 2) * 2), y - anim[8] - (20 * image_yscale), 1, 1, 0, c_white, blush_alpha);
        draw_sprite_ext(spr_blush, 0, x + (bx * image_xscale) + (round(blush_x / 2) * 2), y - anim[8] - (20 * image_yscale), 1, 1, 0, c_white, blush_alpha);
    }
}
else if (sprite_index == spr_shadowman_reload)
{
    draw_sprite_ext(sprite_index, image_index, x - (sprite_width / 2), (y - (sprite_height / 2)) + 10, 2, 2, 0, c_white, 1);
}
else
{
    draw_sprite_ext(sprite_index, image_index, x - (sprite_width / 2), y - (sprite_height / 2), 2, 2, 0, c_white, 1);
}
