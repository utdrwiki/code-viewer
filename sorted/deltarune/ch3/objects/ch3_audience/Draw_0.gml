if (!audience_active)
    exit;
if (!audience_pause)
    siner += siner_speed;
for (var i = 0; i < 4; i++)
    draw_sprite_ext(spr_gameshow_crowd_a, siner + (i + 0.1), scr_even(camerax() + (i * 200) + (sin(siner) * 2)), scr_even(base_y_pos + ((sin(siner * 4) * 8) + (i * 2))), base_x_scale, base_y_scale, 0, blend_mode, 1);
for (var i = 0; i < 3; i++)
    draw_sprite_ext(spr_gameshow_crowd_a, siner + (i + 0.1), scr_even(camerax() + 120 + (i * 200) + (sin(siner) * 4)), scr_even(base_y_pos + 20 + ((sin(siner * 2) * 6) + (i * 2))), base_x_scale, base_y_scale, 0, blend_mode, 1);
for (var i = 0; i < 4; i++)
{
    var sprite = ((i % 2) == 1) ? 4280 : 4714;
    draw_sprite_ext(sprite, siner + (i + 0.1), scr_even(camerax() + 50 + (i * 180) + (sin(siner) * 1)), scr_even(base_y_pos - 12), base_x_scale, base_y_scale, 0, blend_mode, 1);
}
for (var i = 0; i < 5; i++)
{
    var sprite = ((i % 2) == 1) ? 4714 : 4280;
    draw_sprite_ext(sprite, siner + (i + 0.4), scr_even(camerax() + (i * 160) + (sin(siner) * 1)), scr_even(base_y_pos + ((sin(siner * 2) * 4) + (i * 2))), base_x_scale, base_y_scale, 0, blend_mode, 1);
}
