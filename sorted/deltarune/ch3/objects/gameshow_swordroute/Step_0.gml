with (obj_mainchara)
    cutscene = 1;
if (lilkris == 0)
{
    with (obj_mainchara_board)
    {
        if (name == "kris")
            other.lilkris = id;
    }
}
if (scr_debug())
{
    if (keyboard_check_pressed(ord("K")))
        event_user(1);
    if (keyboard_check_pressed(ord("P")))
    {
        god = 1 - god;
        snd_play_pitch(snd_link_sfx_itemget, 1.2 - (god / 3));
        scr_debug_print("GOD MODE: " + string(god));
    }
    if (keyboard_check_pressed(ord("Q")))
        debugdraw = 1 - debugdraw;
    if (god)
        obj_mainchara_board.myhealth = obj_mainchara_board.maxhealth;
    if (room == room_board_dungeon_2)
    {
        if (keyboard_check(ord("W")) && keyboard_check_pressed(ord("V")))
        {
            safe_delete(obj_board_squaretransition);
            scr_board_instawarp(4352, 832, 4544, 960);
            var deer = instance_create(x, y, obj_board_enemy_deer);
            deer.follow = 1;
            safe_delete(obj_b2d_firstswitches);
        }
    }
    if (room == room_board_dungeon_3)
    {
        if (keyboard_check(ord("W")) && keyboard_check_pressed(ord("V")))
            scr_board_instawarp(2048, 832, 2048, 944);
    }
    if (room == room_board_1_sword)
    {
        if (keyboard_check(ord("W")) && keyboard_check_pressed(ord("V")))
        {
        }
    }
    if (room == room_board_1_sword_trees)
    {
        if (keyboard_check(ord("W")) && keyboard_check_pressed(ord("V")))
        {
            scr_board_instawarp(1280, 1088, 1472, 1216);
            lilkris.swordlv = 4;
        }
    }
    if (room == room_board_2_sword)
    {
        if (keyboard_check(ord("W")) && keyboard_check_pressed(ord("V")))
        {
            scr_board_instawarp(1280, 64, 1548, 212);
            with (obj_mainchara_board)
            {
                sword = true;
                swordlv = 2;
                xp = 0;
            }
        }
        if (keyboard_check(ord("W")) && keyboard_check_pressed(ord("B")))
        {
            with (obj_mainchara_board)
            {
                var _boat = instance_create(x, y, obj_board_boat);
                _boat.myinteract = 3;
                sword = true;
                swordlv = 2;
                xp = 0;
            }
        }
    }
}
