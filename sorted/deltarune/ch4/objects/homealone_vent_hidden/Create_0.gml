event_inherited();
fadeout = false;
if (room == room_lw_noellehouse_noelle)
{
    vent_cover_marker = scr_marker(245, 62, spr_noellehouse_vent_closed_noelle_cover);
    vent_cover_marker.depth = 4999;
    vent_panel_marker = scr_marker(vent_cover_marker.x, vent_cover_marker.y - 2, spr_pixel_white);
    vent_panel_marker.depth = vent_cover_marker.depth + 10;
    vent_panel_marker.image_xscale = 7;
    vent_panel_marker.image_yscale = 0.8;
    vent_panel_marker.image_blend = #CEE7FF;
}
if (room == room_lw_noellehouse_dess)
{
    vent_cover_marker = scr_marker(46, 54, spr_noellehouse_vent_closed_dess);
    vent_cover_marker.depth = 4999;
    if (global.plot >= 66)
    {
        with (vent_cover_marker)
            depth = 80000;
    }
    vent_panel_marker = scr_marker(20, 46, spr_noellehouse_dess_vent_wall_cover);
    vent_panel_marker.depth = vent_cover_marker.depth;
}
if (room == room_lw_noellehouse_main)
{
}
