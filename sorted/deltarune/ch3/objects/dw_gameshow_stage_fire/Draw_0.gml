if (flamecon == 1)
{
    wave_siner++;
    flamesiner++;
    draw_set_alpha(flamealph);
    for (i = 0; i < wave_maxa; i += thickness)
    {
        draw_sprite_part(spr_gameshow_stage_fire, 0, 0, i * thickness, 400, thickness + 2, -10 + (sin((wave_siner + (i * 8)) / 30) * 12), (i * thickness) + flameya + (sin(flamesiner / 16) * 3));
        draw_sprite_part(spr_gameshow_stage_fire, 0, 0, i * thickness, 400, thickness + 2, 255 + (sin((wave_siner + (i * 8)) / 30) * 12), (i * thickness) + flameya + (sin(flamesiner / 16) * 3));
        draw_sprite_part(spr_gameshow_stage_fire, 0, 0, i * thickness, 400, thickness + 2, 520 + (sin((wave_siner + (i * 8)) / 30) * 12), (i * thickness) + flameya + (sin(flamesiner / 16) * 3));
    }
    draw_set_alpha(1);
}
