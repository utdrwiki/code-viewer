function scr_get_room_by_id(arg0)
{
    var room_id = arg0;
    var rooms = scr_get_room_list();
    if (room_id < 10000)
        room_id += (global.chapter * 10000);
    var room_index = -1;
    for (var i = 0; i < array_length_1d(rooms); i++)
    {
        if (rooms[i].room_id == room_id)
        {
            room_index = rooms[i].room_index;
            break;
        }
    }
    if (room_index == -1)
    {
    }
    return room_index;
}

function scr_get_id_by_room_index(arg0)
{
    var room_index = arg0;
    var rooms = scr_get_room_list();
    var room_id = -1;
    for (var i = 0; i < array_length_1d(rooms); i++)
    {
        if (rooms[i].room_index == room_index)
        {
            room_id = rooms[i].room_id;
            break;
        }
    }
    if (room_id == -1)
    {
    }
    return room_id;
}

function scr_room(arg0, arg1) constructor
{
    room_index = arg0;
    room_id = arg1;
}

function scr_get_room_list()
{
    var idsarr = [new scr_room(room_dw_tv_cutscene1g, 30094), new scr_room(room_dw_rhythm, 30095), new scr_room(room_dw_couch_overworld_intro, 30097), new scr_room(room_dw_couch_overworld_01, 30098), new scr_room(room_dw_couch_overworld_02, 30099), new scr_room(room_dw_couch_overworld_03, 30100), new scr_room(room_dw_couch_overworld_04, 30101), new scr_room(room_dw_couch_overworld_05, 30102), new scr_room(room_dw_nondescript_room, 30103), new scr_room(room_dw_nondescript_field, 30104), new scr_room(room_dw_nondescript_hallway, 30105), new scr_room(room_dw_nondescript_classroom, 30106), new scr_room(room_dw_backstage, 30107), new scr_room(room_dw_snow_zone, 30108), new scr_room(room_town_krisyard_dark, 30109), new scr_room(room_board_1, 30111), new scr_room(room_board_dungeon_2, 30114), new scr_room(room_board_dungeon_3, 30115), new scr_room(room_board_preshadowmantle, 30116), new scr_room(room_shadowmantle, 30117), new scr_room(room_board_prepostshadowmantle, 30118), new scr_room(room_board_postshadowmantle, 30119), new scr_room(room_dw_ch3_man, 30120), new scr_room(room_susiezilla, 30123), new scr_room(room_board_intro, 30124), new scr_room(room_torhouse_sepia, 30126), new scr_room(room_ch3_gameshowroom, 30130), new scr_room(room_shootout, 30131), new scr_room(room_board_preshadowmantle_repeat, 30133), new scr_room(room_dw_green_room, 30134), new scr_room(room_board_1_sword, 30135), new scr_room(room_board_sword_intro, 30136), new scr_room(room_board_1_sword_trees, 30137), new scr_room(room_dw_changing_room, 30138), new scr_room(room_dw_console_room, 30139), new scr_room(room_board_2, 30140), new scr_room(room_dw_tv_closet, 30141), new scr_room(room_board_3, 30143), new scr_room(room_dw_b3bs_interstitial, 30146), new scr_room(room_board_2_sword, 30147), new scr_room(room_board_empty, 30149), new scr_room(room_dw_b3bs_rouxls_lanina, 30150), new scr_room(room_dw_b3bs_rouxls_boss, 30152), new scr_room(room_dw_b3bs_cheaterpippins, 30153), new scr_room(room_dw_b3bs_idcardpuzzle, 30154), new scr_room(room_dw_b3bs_intro, 30155), new scr_room(room_dw_b3bs_zapper_a, 30156), new scr_room(room_dw_b3bs_rabbick_a, 30157), new scr_room(room_dw_b3bs_lancerget, 30158), new scr_room(room_dw_b3bs_cooltrashy, 30159), new scr_room(room_dw_b3bs_zapper_c, 30160), new scr_room(room_dw_b3bs_rabbick_b, 30161), new scr_room(room_dw_b3bs_sadshadowguys, 30162), new scr_room(room_dw_b3bs_zapper_b, 30163), new scr_room(room_dw_susiezilla, 30165), new scr_room(room_dw_inbetween, 30166), new scr_room(room_dw_teevie_preview, 30167), new scr_room(room_dw_chef, 30168), new scr_room(room_dw_puzzlecloset_1, 30169), new scr_room(room_dw_puzzlecloset_2, 30170), new scr_room(room_dw_chef_empty, 30173), new scr_room(room_dw_susiezilla_empty, 30174), new scr_room(room_dw_rhythm_empty, 30175), new scr_room(room_board_3b, 30176), new scr_room(room_dw_b3bs_jail1, 30178), new scr_room(room_dw_b3bs_shop, 30179), new scr_room(room_dw_b3bs_mysterypuzzle, 30180), new scr_room(room_dw_b3bs_watercooler, 30181), new scr_room(room_dw_b3bs_jail2, 30182), new scr_room(room_dw_b3bs_zapper_d, 30183), new scr_room(room_dw_b3bs_extrapuzzle, 30184), new scr_room(room_dw_b3bs_bibliox, 30185), new scr_room(room_board_3_sword, 30187), new scr_room(room_dw_couch_points, 30188), new scr_room(room_dw_couch_overworld_intro_left, 30189), new scr_room(room_dw_couch_video, 30190), new scr_room(room_dw_snow_zone_battle, 30191), new scr_room(room_dw_puzzlecloset_0, 30193), new scr_room(room_board_gsa02_b0, 30194), new scr_room(room_dw_tv_curtain, 30195), new scr_room(room_dw_teevie_intro, 30196), new scr_room(room_dw_teevie_large_01, 30197), new scr_room(room_dw_teevie_large_02, 30198), new scr_room(room_dw_teevie_cowboy_zone_01_intro, 30199), new scr_room(room_dw_teevie_cowboy_zone_01_after, 30200), new scr_room(room_dw_teevie_watercooler, 30201), new scr_room(room_dw_teevie_susiezilla, 30202), new scr_room(room_dw_teevie_cowboy_zone_02_intro, 30203), new scr_room(room_dw_teevie_cowboy_zone_02_after, 30204), new scr_room(room_dw_teevie_shadow_guys, 30205), new scr_room(room_dw_teevie_stealth_c, 30206), new scr_room(room_dw_teevie_stealth, 30207), new scr_room(room_dw_teevie_failure_cage, 30208), new scr_room(room_dw_teevie_rhythm, 30209), new scr_room(room_dw_teevie_maze_points, 30210), new scr_room(room_dw_teevie_maze_chef, 30211), new scr_room(room_dw_teevie_maze_final, 30212), new scr_room(room_dw_teevie_maze, 30213), new scr_room(room_dw_teevie_chef, 30214), new scr_room(room_dw_teevie_cutscene_final, 30215), new scr_room(room_dw_teevie_ribbick, 30216), new scr_room(room_dw_teevie_preview_south, 30217), new scr_room(room_dw_b3bs_camerareminder, 30218), new scr_room(room_dw_puzzlecloset_3, 30219), new scr_room(room_dw_teevie_sams, 30220), new scr_room(room_dw_teevie_bonus_zone, 30221), new scr_room(room_dw_teevie_audiencepits, 30222), new scr_room(room_dw_teevie_lightmaze, 30224), new scr_room(room_dw_teevie_maze_quiz, 30225), new scr_room(room_dw_ranking_hub, 30226), new scr_room(room_dw_ranking_a, 30227), new scr_room(room_dw_ranking_b, 30228), new scr_room(room_dw_ranking_c, 30229), new scr_room(room_dw_ranking_z, 30230), new scr_room(room_dw_ranking_z_hallway, 30231), new scr_room(room_dw_teevie_ribbicks_a, 30232), new scr_room(room_dw_teevie_ribbicks_b, 30233), new scr_room(room_dw_teevie_susiebridge, 30234), new scr_room(room_dw_teevie_shuttahmaze, 30235), new scr_room(room_dw_teevie_stealth_d, 30236), new scr_room(room_dw_teevie_dust, 30237), new scr_room(room_dw_teevie_dust_south, 30238), new scr_room(room_ch3_gacharoom_unknown, 30239), new scr_room(room_dw_ranking_t, 30240), new scr_room(room_dw_puzzlecloset_1a, 30241), new scr_room(room_dw_rhythm_countdown, 30242), new scr_room(room_dw_snow_zone_east_door, 30243), new scr_room(room_dw_inbetweenhall, 30244), new scr_room(PLACE_DOGCHECK2, 20001), new scr_room(ROOM_INITIALIZE, 20011), new scr_room(PLACE_CONTACT, 20027), new scr_room(room_krisroom, 20028), new scr_room(room_krishallway, 20029), new scr_room(room_torroom, 20030), new scr_room(room_torhouse, 20031), new scr_room(room_torbathroom, 20032), new scr_room(room_town_krisyard, 20033), new scr_room(room_town_northwest, 20034), new scr_room(room_town_north, 20035), new scr_room(room_beach, 20036), new scr_room(room_town_mid, 20037), new scr_room(room_town_apartments, 20038), new scr_room(room_town_south, 20039), new scr_room(room_town_school, 20040), new scr_room(room_town_church, 20041), new scr_room(room_graveyard, 20042), new scr_room(room_town_shelter, 20043), new scr_room(room_hospital_lobby, 20044), new scr_room(room_hospital_hallway, 20045), new scr_room(room_hospital_rudy, 20046), new scr_room(room_hospital_room2, 20047), new scr_room(room_diner, 20048), new scr_room(room_townhall, 20049), new scr_room(room_flowershop_1f, 20050), new scr_room(room_flowershop_2f, 20051), new scr_room(room_library, 20052), new scr_room(room_alphysalley, 20053), new scr_room(room_lw_computer_lab, 20054), new scr_room(room_lw_library_upstairs, 20055), new scr_room(room_lw_police, 20056), new scr_room(room_lw_conbini, 20057), new scr_room(room_lw_icee_pizza, 20058), new scr_room(room_torielclass, 20059), new scr_room(room_schoollobby, 20060), new scr_room(room_alphysclass, 20061), new scr_room(room_schooldoor, 20062), new scr_room(room_insidecloset, 20063), new scr_room(room_school_unusedroom, 20064), new scr_room(room_castle_tutorial, 20066), new scr_room(room_dw_castle_east_door, 20068), new scr_room(room_dw_castle_west_cliff, 20069), new scr_room(room_dw_castle_area_1, 20070), new scr_room(room_dw_ralsei_castle_front, 20073), new scr_room(room_dw_castle_restaurant, 20074), new scr_room(room_dw_castle_cafe, 20075), new scr_room(room_dw_castle_dojo, 20076), new scr_room(room_dw_ralsei_castle_1f, 20077), new scr_room(room_dw_ralsei_castle_2f, 20078), new scr_room(room_dw_castle_dungeon, 20079), new scr_room(room_dw_castle_rooms_kris, 20081), new scr_room(room_dw_castle_rooms_susie, 20082), new scr_room(PLACE_DOG, 20233), new scr_room(room_legend, 20234), new scr_room(room_legend_neo, 20235), new scr_room(room_shop1, 20236), new scr_room(room_gameover, 20240), new scr_room(PLACE_LOGO, 20241), new scr_room(PLACE_FAILURE, 20242), new scr_room(PLACE_NAMING_JIKKEN, 20243), new scr_room(PLACE_MENU, 20244), new scr_room(room_ed, 20245), new scr_room(room_empty, 20246), new scr_room(room_cc_lancer, 20269), new scr_room(room_cc_clover, 20270), new scr_room(room_cc_fountain, 20271)];
    return idsarr;
}
