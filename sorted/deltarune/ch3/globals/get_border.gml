function scr_get_border(arg0)
{
    var _border_image = _border_image_temp;
    if (global.chapter == 3)
    {
        if (global.plot < 70)
            _border_image = border_dw_tv_black;
        if (global.plot >= 70)
            _border_image = border_dw_blue_stars;
        if (global.plot >= 120)
            _border_image = border_dw_green_room;
        if (global.plot >= 122)
        {
            if (arg0 == room_ch3_gameshowroom)
                _border_image = border_dw_tv_black;
        }
        if (global.plot >= 160)
            _border_image = border_dw_green_room;
        if (global.plot >= 230)
            _border_image = border_dw_red_smiles;
        if (global.plot >= 250)
            _border_image = border_dw_teevie;
        if (global.plot >= 280)
        {
            if (i_ex(obj_dw_ch3_tvsnow))
                _border_image = border_dw_blue_light;
        }
        if (global.plot >= 290)
            _border_image = border_dw_tv_black;
        if (global.plot >= 308)
            _border_image = border_dw_blue_stars;
        if (global.plot >= 310)
            _border_image = border_dw_tv_black;
        if (global.plot >= 340)
            _border_image = border_lw_town_night;
        var castle_town_rooms = [room_legend, 1535, PLACE_MENU, PLACE_LOGO];
        for (var i = 0; i < array_length(castle_town_rooms); i++)
        {
            if (arg0 != castle_town_rooms[i])
                continue;
            _border_image = border_dw_castletown;
            break;
        }
        if (arg0 == room_dw_couch_overworld_intro || arg0 == room_dw_couch_overworld_05)
            _border_image = border_dw_tv_black;
        if (arg0 == room_dw_tv_curtain || arg0 == room_dw_chef || arg0 == room_dw_rhythm || arg0 == room_dw_ranking_a || arg0 == room_dw_rhythm_countdown || arg0 == room_dw_susiezilla)
            _border_image = border_dw_blue_stars;
        if (arg0 == room_board_gsa02_b0 || arg0 == room_board_intro || arg0 == room_board_1 || arg0 == room_board_2)
            _border_image = border_dw_tv_meta;
        if (arg0 == room_dw_b3bs_interstitial || arg0 == room_dw_inbetween || arg0 == room_dw_ranking_hub)
        {
            _border_image = border_dw_green_room;
            if (global.plot >= 280)
                _border_image = border_dw_blue_light;
        }
        var sword_room = arg0 == room_board_sword_intro || arg0 == room_board_1_sword || arg0 == room_board_1_sword_trees || arg0 == room_board_2_sword || arg0 == room_board_3_sword;
        if (sword_room)
            _border_image = border_dw_tv_black;
        if (arg0 == room_dw_couch_video || arg0 == room_board_empty || arg0 == room_dw_snow_zone || arg0 == room_dw_teevie_dust || arg0 == room_dw_console_room || arg0 == room_dw_backstage || arg0 == room_dw_teevie_dust_south || arg0 == room_dw_b3bs_zapper_c)
            _border_image = border_dw_tv_black;
        if (arg0 == room_dw_puzzlecloset_0 || arg0 == room_dw_puzzlecloset_1 || arg0 == room_dw_puzzlecloset_1a || arg0 == room_dw_puzzlecloset_2 || arg0 == room_dw_puzzlecloset_3)
            _border_image = border_dw_tv_blue;
        if (arg0 == room_dw_teevie_intro || arg0 == room_dw_teevie_chef || arg0 == room_dw_b3bs_jail1 || arg0 == room_dw_teevie_rhythm)
            _border_image = border_dw_teevie;
        if (arg0 == room_dw_changing_room)
            _border_image = border_dw_green_sloppy;
        if (arg0 == room_dw_ranking_z_hallway || arg0 == room_dw_ranking_z)
            _border_image = border_dw_green_sloppy_z;
        if (arg0 == room_town_krisyard_dark)
            _border_image = border_lw_town_night;
    }
    return _border_image;
}
