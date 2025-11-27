if (flamecon == 1)
{
    wave_siner++;
    flamesiner++;
    if (!surface_exists(mysurface))
        mysurface = surface_create(640, 160);
    surface_set_target(mysurface);
    draw_set_alpha(0.25);
    draw_set_alpha(flamealph);
    for (i = 0; i < wave_maxa; i += thickness)
        draw_sprite_part(spr_gameshow_stage_fire, 0, 0, i * thickness, 400, thickness + 2, -10 + (sin((wave_siner + (i * 8)) / 30) * 12), (i * thickness) + (sin(flamesiner / 16) * 3));
    draw_set_alpha(1);
    surface_reset_target();
    draw_surface_ext(mysurface, camerax(), cameray() + 80, 3, 3.5, 0, c_white, 1);
    draw_surface_ext(mysurface, camerax(), cameray(), 3, 3.5, 0, c_white, 1);
    draw_surface_ext(mysurface, camerax(), cameray() - 80, 3, 3.5, 0, c_white, 0.8);
}
