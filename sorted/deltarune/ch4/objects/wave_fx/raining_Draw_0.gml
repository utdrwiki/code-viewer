if (drawself)
    draw_self();
if (mode == 0)
{
    for (i = 0; i < obj_wave_fx.wave_max; i += 1)
        draw_sprite_part(sprite_index, 0, i, 0, 1, sprite_height, x + i + (sin((obj_wave_fx.wave_siner + i) / 30) * 2), y);
}
if (mode == 1)
{
    wave_max = sprite_height;
    for (i = 0; i < wave_max; i += obj_wave_fx.thickness)
        draw_sprite_part(sprite_index, 0, 0, i * obj_wave_fx.thickness, sprite_width, obj_wave_fx.thickness, x + i + (sin((obj_wave_fx.wave_siner + i) / 30) * 2), y);
}
