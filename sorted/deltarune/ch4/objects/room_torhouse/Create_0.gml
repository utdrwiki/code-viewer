if (global.chapter == 4)
{
    if (global.plot >= 20)
    {
        layer_set_visible("Compatibility_Tiles_Depth_10000", 0);
        var couch_marker = scr_marker(185, 153, bg_torhouse_fg_ch4);
        couch_marker.depth = 10000;
    }
    tv_marker = scr_marker(472, 85, spr_torhouse_tv_cover);
    tv_marker.depth = 98670;
    tv_broken = scr_marker(478, 86, spr_tv_broken_no_stand);
    tv_broken.depth = tv_marker.depth - 10;
    if (scr_tenna_alt_plot())
    {
        tv_broken.sprite_index = spr_tv_broken_no_stand_more;
    }
    else if (scr_flag_get(779) >= 2 || scr_flag_get(780) == 1 || global.plot >= 100)
    {
        with (tv_broken)
            instance_destroy();
    }
    if (global.plot < 300)
    {
        toriel_convo = false;
        toriel_con = 0;
        toriel_speaking = false;
        if (scr_flag_get(654) == 1)
        {
            var window_marker_a = scr_marker(237, 54, spr_torhouse_windows_small);
            with (window_marker_a)
                scr_depth();
            var window_marker_b = scr_marker(315, 54, spr_torhouse_windows_small);
            with (window_marker_b)
                scr_depth();
            var window_marker_c = scr_marker(443, 68, spr_torhouse_windows_big);
            with (window_marker_c)
                scr_depth();
        }
    }
}
