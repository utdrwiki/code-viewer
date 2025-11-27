con = -1;
customcon = 0;
if (global.chapter >= 4)
{
    var terminal_marker = scr_marker(177, 1127, spr_shelter_panel_terminal);
    with (terminal_marker)
        depth = 88330;
    var panel_marker = instance_create(191, 1145, obj_marker_palette);
    panel_marker.sprite_index = spr_shelter_panel_rotated;
    panel_marker.depth = terminal_marker.depth - 10;
    var grass_marker = instance_create(186, 1161, obj_marker_palette);
    grass_marker.sprite_index = spr_shelter_grass;
    grass_marker.depth = panel_marker.depth - 10;
    if (global.plot >= 300)
    {
        panel_marker.current_palette = 2763;
        panel_marker.palette_index = 1;
        grass_marker.current_palette = 2763;
        grass_marker.palette_index = 1;
    }
}
