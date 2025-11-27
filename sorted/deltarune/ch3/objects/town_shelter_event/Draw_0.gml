if (global.chapter == 3 && global.plot >= 340)
{
    pal_swap_set(bg_towntiles_palette, 1, false);
    draw_self();
    if (panel_fall)
    {
        if (panel_alpha == 1)
            draw_sprite_ext(spr_shelter_panel_terminal, 0, 177, 1127, 1, 1, 0, c_white, 1);
        panel_fall_timer++;
        if (panel_fall_timer == 4)
        {
            panel_alpha = 1;
            snd_play(snd_noise);
            scr_lerpvar("panel_rot", -45, 0, 12, -2, "out");
        }
        if (panel_fall_timer == 20)
        {
            snd_play(snd_wing);
            scr_lerpvar("panel_y", panel_y, panel_y + 17, 6, 4, "in");
        }
        draw_sprite_ext(panel_sprite, 0, panel_x, panel_y, 1, 1, panel_rot, c_white, panel_alpha);
        draw_sprite_ext(spr_shelter_grass, 0, 186, 1161, 1, 1, 0, c_white, panel_alpha);
    }
    pal_swap_reset();
}
else
{
    draw_self();
}
