var xx = scr_even(camerax() / 40) - 80;
siner += siner_speed;
blend_mode = 13788985;
base_y_pos = 450;
if (drawcrowd)
{
    var count = 8;
    for (var i = 0; i < count; i++)
    {
        var my_blend_mode = blend_mode;
        if (i < 3)
            my_blend_mode = merge_color(#132246, my_blend_mode, i / 3);
        if (i > (count - 4))
            my_blend_mode = merge_color(#132246, my_blend_mode, (count - i - 1) / 4);
        draw_sprite_ext(spr_gameshow_crowd_a, siner + (i + 0.1), scr_even(xx + (i * 200) + (sin(siner) * 2)), scr_even(base_y_pos + ((sin(siner * 4) * 8) + (i * 2))), base_x_scale, base_y_scale, 0, my_blend_mode, 1);
    }
    count = 7;
    for (var i = 0; i < count; i++)
    {
        var my_blend_mode = blend_mode;
        if (i < 3)
            my_blend_mode = merge_color(#132246, my_blend_mode, i / 3);
        if (i > (count - 4))
            my_blend_mode = merge_color(#132246, my_blend_mode, (count - i - 1) / 4);
        draw_sprite_ext(spr_gameshow_crowd_a, siner + (i + 0.1), scr_even(xx + 120 + (i * 200) + (sin(siner) * 4)), scr_even(base_y_pos + 20 + ((sin(siner * 2) * 6) + (i * 2))), base_x_scale, base_y_scale, 0, my_blend_mode, 1);
    }
    count = 8;
    for (var i = 0; i < count; i++)
    {
        var my_blend_mode = blend_mode;
        if (i < 3)
            my_blend_mode = merge_color(#132246, my_blend_mode, i / 3);
        if (i > (count - 4))
            my_blend_mode = merge_color(#132246, my_blend_mode, (count - i - 1) / 4);
        var sprite = ((i % 2) == 1) ? 4280 : 4714;
        draw_sprite_ext(sprite, siner + (i + 0.1), scr_even(xx + 50 + (i * 180) + (sin(siner + (i * 10)) * 4)), scr_even((base_y_pos - 12) + (sin((siner + (i * 10 * 4)) / 10) * 8)), base_x_scale, base_y_scale, 0, my_blend_mode, 1);
    }
    count = 9;
    for (var i = 0; i < count; i++)
    {
        var my_blend_mode = blend_mode;
        if (i < 3)
            my_blend_mode = merge_color(#132246, my_blend_mode, i / 3);
        if (i > (count - 4))
            my_blend_mode = merge_color(#132246, my_blend_mode, (count - i - 1) / 4);
        var sprite = ((i % 2) == 1) ? 4714 : 4280;
        draw_sprite_ext(sprite, siner + (i + 0.4), scr_even(xx + (i * 160) + (sin(siner) * 1)), scr_even(base_y_pos + ((sin(siner * 2) * 4) + (i * 2))), base_x_scale, base_y_scale, 0, my_blend_mode, 1);
    }
}
