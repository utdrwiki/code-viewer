function scr_battle(arg0, arg1, arg2, arg3, arg4)
{
    global.specialbattle = arg1;
    global.encounterno = arg0;
    if (global.flag[9] != 2)
    {
        global.flag[9] = 1;
        var batmusic = "battle.ogg";
        if (global.chapter == 3)
        {
            if (global.encounterno == 111 && room == room_board_2)
                batmusic = "rudebuster_boss.ogg";
            if (room == room_dw_b3bs_watercooler || room == room_dw_teevie_watercooler || room == room_dw_b3bs_zapper_b || room == room_dw_ranking_c)
                batmusic = "battle_vapor.ogg";
            if (room == room_dw_teevie_chef)
                batmusic = "rouxls_battle.ogg";
        }
        global.batmusic[0] = snd_init(batmusic);
        mus_volume(global.batmusic[1], 1, 0);
    }
    instance_create(0, 0, obj_battleback);
    instance_create(0, 0, obj_encounterbasic);
    __enemymarker[0] = arg2;
    __enemymarker[1] = arg3;
    __enemymarker[2] = arg4;
    for (__ien = 0; __ien < 3; __ien++)
    {
        if (global.monstertype[__ien] != 0)
        {
            if (!i_ex(__enemymarker[__ien]))
            {
                __enemymarker[__ien] = scr_dark_marker(global.monstermakex[__ien] + 300, global.monstermakey[__ien], object_get_sprite(global.monsterinstancetype[__ien]));
                __enemymarker[__ien].depth = -__ien;
            }
            __enemymarker[__ien].__ien = __ien;
            with (__enemymarker[__ien])
            {
                if (global.monstertype[other.__ien] == 103)
                {
                    x = camerax() + 510;
                    y = cameray() + 288;
                    scr_move_to_point_over_time(camerax() + 526, cameray() + 260, 20);
                    sprite_index = spr_tenna_point_up;
                }
                else if (global.monstertype[other.__ien] == 104)
                {
                    with (obj_ch3_PTB02_roaringknight)
                        stopsiner2 = true;
                    scr_move_to_point_over_time(global.monstermakex[__ien], obj_ch3_PTB02_roaringknight.ystart + (cos(obj_ch3_PTB02_roaringknight.siner2 / 8) * 8), 20);
                }
                else
                {
                    scr_move_to_point_over_time(global.monstermakex[__ien], global.monstermakey[__ien], 20);
                }
                __doom = instance_create(x, y, obj_doom);
                __doom.target = id;
                __doom.alarm[0] = 25;
            }
        }
    }
}
