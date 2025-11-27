function scr_get_border(arg0)
{
    var _border_image = _border_image_temp;
    if (global.chapter == 4)
    {
        if (global.plot > 105)
            _border_image = border_dw_church_a;
        if (global.plot >= 225)
            _border_image = border_dw_church_b;
        if (global.plot >= 240)
            _border_image = border_dw_church_c;
        if (global.plot >= 300)
            _border_image = border_lw_town_night;
        var castle_town_rooms = [room_legend, 1399, PLACE_MENU, PLACE_LOGO, room_dw_castle_area_1, room_dw_castle_rooms_kris_susie, room_castle_tutorial, room_dw_castle_east_door, room_dw_castle_west_cliff, room_dw_ralsei_castle_front, room_dw_castle_restaurant, room_dw_castle_cafe, room_dw_castle_dojo, room_dw_ralsei_castle_1f, room_dw_ralsei_castle_2f, room_dw_ralsei_castle_3f, room_dw_castle_dungeon, room_dw_castle_rooms_kris, room_dw_castle_rooms_susie, room_dw_castle_rooms_ralsei, room_dw_castle_rooms_queen, room_dw_castle_rooms_tenna, room_dw_castle_tv_rhythm, room_dw_castle_tv_zone_1, room_dw_castle_tv_zone_2, room_dw_castle_tv_zone_3, room_dw_castle_tv_zone_battle, room_dw_castle_tv_zone_minigame, room_dw_castle_tv, room_dw_castle_town, room_dw_rhythm, room_dw_rhythm_countdown, room_dw_rhythm_empty];
        for (var i = 0; i < array_length(castle_town_rooms); i++)
        {
            if (arg0 != castle_town_rooms[i])
                continue;
            _border_image = border_dw_castletown;
            break;
        }
        if (arg0 == room_torhouse || arg0 == room_krisroom || arg0 == room_town_mid || arg0 == room_lw_noellehouse_kitchen)
        {
            if (global.plot < 290)
                _border_image = border_lw_town;
        }
        var church_a_rooms = [room_dw_church_savepoint, room_dw_church_intro1, room_dw_church_ripplepuzzle_postgers, room_dw_church_gersonstudy, room_dw_church_nwconnect, room_dw_church_pianopuzzle, room_dw_church_knightclimb_post];
        for (var i = 0; i < array_length(church_a_rooms); i++)
        {
            if (arg0 != church_a_rooms[i])
                continue;
            _border_image = border_dw_church_a;
            break;
        }
        var church_b_rooms = [room_dw_churchb_ripple1, room_dw_churchb_ripplepost, room_dw_churchb_gersonstudy, room_dw_churchb_staircaseintro, room_dw_churchb_savepoint, room_dw_churchb_darkclimb];
        for (var i = 0; i < array_length(church_b_rooms); i++)
        {
            if (arg0 != church_b_rooms[i])
                continue;
            _border_image = border_dw_church_b;
            break;
        }
        var church_c_rooms = [room_dw_churchc_superprophecies, room_dw_churchc_savepoint, room_dw_churchc_prepretitan, room_dw_churchc_finalclimb];
        for (var i = 0; i < array_length(church_c_rooms); i++)
        {
            if (arg0 != church_c_rooms[i])
                continue;
            _border_image = border_dw_church_c;
            break;
        }
        if (arg0 == room_dw_churchc_titanclimb1 || arg0 == room_dw_churchc_titanclimb1_post || arg0 == room_dw_churchc_titanclimb2 || arg0 == room_dw_churchc_titanclimb2_post)
            _border_image = border_dw_titan_base;
        if (arg0 == room_town_church)
        {
            if (global.plot >= 290)
                _border_image = border_lw_town_night;
        }
    }
    return _border_image;
}
