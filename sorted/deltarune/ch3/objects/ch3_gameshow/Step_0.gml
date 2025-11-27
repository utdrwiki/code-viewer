if (init == 0)
{
    var initiated = 0;
    with (obj_caterpillarchara)
    {
        if (name == "ralsei")
            other.ralsei = id;
        if (name == "susie")
            other.susie = id;
    }
    with (susie)
        setxy(140, 392);
    with (kris)
        setxy(248, 400);
    with (ralsei)
        setxy(342, 396);
    susie.follow = 0;
    ralsei.follow = 0;
    kris.fun = 1;
    susie.fun = 1;
    ralsei.fun = 1;
    susie.ignoredepth = true;
    ralsei.ignoredepth = true;
    kris.sprite_index = kris.usprite;
    susie.sprite_index = susie.usprite;
    ralsei.sprite_index = ralsei.usprite;
    kris.ystart = kris.y;
    susie.ystart = susie.y;
    ralsei.ystart = ralsei.y;
    with (obj_mainchara_board)
    {
        if (name == "kris")
            other.kris_board = id;
        if (name == "susie")
            other.susie_board = id;
        if (name == "ralsei")
            other.ralsei_board = id;
    }
    if (kris_board != 0 && susie_board != 0 && ralsei_board != 0)
    {
        kris_board.myhealth = 12;
        susie_board.myhealth = 12;
        ralsei_board.myhealth = 12;
        init = 1;
        initiated = 1;
    }
    else if (kris_board != 0)
    {
        kris_board.myhealth = 12;
        init = 1;
        initiated = 1;
    }
    if (!scr_swordroom())
    {
        kr_healthbar = instance_create(222, 32, obj_board_healthbar);
        su_healthbar = instance_create(128, 32, obj_board_healthbar);
        ra_healthbar = instance_create(316, 32, obj_board_healthbar);
        kr_healthbar.index = 0;
        su_healthbar.index = 1;
        ra_healthbar.index = 2;
        kr_healthbar.mycolor = hexcolor(#DBFC8F);
        su_healthbar.mycolor = hexcolor(#EC95FB);
        ra_healthbar.mycolor = hexcolor(#1DE6B5);
    }
    else
    {
        kr_healthbar = instance_create(270, 34, obj_board_healthbar);
        kr_healthbar.index = 0;
        kr_healthbar.mycolor = hexcolor(#DBFC8F);
    }
    scoreboard = instance_create(410, 32, obj_board_scoreboard);
    inventory = instance_create(80, 64, obj_board_inventory);
    if (room == room_board_dungeon_2 || room == room_board_dungeon_3)
    {
        with (obj_mainchara_board)
            sword = true;
    }
    if (room == room_board_intro)
    {
    }
    if (room == room_board_tests)
    {
        if (i_ex(ralsei_board))
            ralsei_board.follow = false;
    }
}
if (scr_debug() && init)
{
    if (keyboard_check_pressed(ord("I")))
    {
        invulnerable = 1 - invulnerable;
        if (invulnerable == 1)
            scr_debug_print("Invulnerable");
        else
            scr_debug_print("Not Invulnerable");
        snd_play_pitch(snd_item, 0.8 + (0.8 * invulnerable));
    }
    if (invulnerable)
    {
        with (obj_mainchara_board)
            myhealth++;
    }
    if (keyboard_check_pressed(vk_add))
        scr_board_score(100);
    if (keyboard_check_pressed(vk_subtract))
        scr_board_score(-100);
    if (keyboard_check_pressed(ord("M")))
        snd_free_all();
    if (keyboard_check_pressed(ord("Q")))
    {
        with (obj_board_inventory)
        {
            if (qcount < 2)
                qcount++;
        }
    }
    if (keyboard_check(ord("W")) && keyboard_check_pressed(ord("K")))
    {
        with (obj_board_inventory)
        {
            keycount = 4;
            sunmoonstone = 1;
            lancer = 1;
        }
    }
    if (keyboard_check_pressed(ord("K")))
    {
        inventory.keycount++;
        if (inventory.keycount > 4)
            inventory.keycount = 4;
    }
    if (room == room_board_1)
    {
        if (keyboard_check(vk_shift) && keyboard_check_pressed(ord("W")))
        {
            with (obj_board_tree_static)
                sprite_index = spr_board_tree_withered;
            with (obj_board_tree)
                wither = 1;
            with (obj_board_cactus)
                wither = 1;
            with (obj_board_smallpond)
                wither = 1;
            with (obj_board_waterfall)
                wither = 1;
            with (obj_board_lancermoat)
                wither = 1;
            with (obj_board_oasis)
                wither = 2;
        }
        if (keyboard_check(ord("W")) && keyboard_check_pressed(ord("V")))
        {
            with (obj_mainchara_board)
            {
                visible = true;
                canfreemove = true;
                with (obj_board_startransition)
                    instance_destroy();
                with (obj_script_delayed)
                    instance_destroy();
            }
            scr_pathfind_end("ralsei");
            scr_pathfind_end("susie");
            scr_board_instawarp(512, 1088, 800, 1280);
        }
        if (keyboard_check_pressed(vk_up) && keyboard_check(vk_shift))
        {
            if (global.flag[1020] == 0)
            {
                snd_play(snd_board_lift);
                global.flag[1020] = 1;
                scr_debug_print("Susie can now grab");
            }
            else
            {
                snd_play_pitch(snd_board_lift, 0.6);
                global.flag[1020] = 0;
                scr_debug_print("Susie can no longer grab");
            }
        }
    }
    if (room == room_board_2 && scr_debug())
    {
        if (keyboard_check(ord("W")) && keyboard_check_pressed(ord("T")))
        {
            global.flag[1022] = 1 - global.flag[1022];
            scr_resetgameshowcharacter("tenna", 4);
        }
        if (keyboard_check(ord("W")) && keyboard_check_pressed(ord("P")))
        {
            obj_board_inventory.ninfriendo = true;
            scr_board_instawarp(2432, 1600, 2656, 1792);
            obj_b2bossencounterroom.active = 1;
            obj_b2bossencounterroom.suwalktimer = 999;
            with (obj_mainchara_board)
            {
                if (name == "kris")
                    camera = true;
            }
        }
        if (keyboard_check(ord("W")) && keyboard_check_pressed(ord("B")))
        {
            var boat = instance_create(x, y, obj_board_boat);
            with (boat)
                setxy_board(1856, 3296);
        }
        if (keyboard_check(ord("W")) && keyboard_check_pressed(ord("E")))
        {
            scr_board_instawarp(2816, 3392, 2816, 3488);
            global.flag[1022] = 1;
        }
        if (keyboard_check(ord("W")) && keyboard_check_pressed(ord("V")))
        {
            with (obj_mainchara_board)
            {
                visible = true;
                canfreemove = true;
                with (obj_board_startransition)
                    instance_destroy();
                with (obj_script_delayed)
                    instance_destroy();
            }
            scr_board_instawarp(3200, 832, 3376, 1052);
            global.flag[1022] = 1;
            with (obj_b2tennaleave1)
                con = 5;
            scr_resetgameshowcharacter("all");
        }
        if (keyboard_check(ord("W")) && keyboard_check_pressed(ord("F")))
        {
            scr_board_instawarp(2816, 3392, 3104, 3520);
            obj_b2enemysquabble.con = 999;
            global.flag[1022] = 1;
            scr_resetgameshowcharacter("all");
        }
        if (keyboard_check_pressed(ord("N")))
            obj_board_inventory.ninfriendo = true;
        if (keyboard_check(vk_shift) && keyboard_check_pressed(ord("N")))
        {
            global.flag[1017] = 1 - global.flag[1017];
            var friendoname = "elnina (cloud)";
            if (global.flag[1017] == 1)
                friendoname = "lanino (moon)";
            debug_print("favored=" + friendoname);
        }
        if (keyboard_check_pressed(ord("K")))
            obj_board_inventory.lancer = true;
    }
}
if (room == room_board_3 && scr_debug())
{
    if (global.flag[1053] == 1 && obj_board_camera.con == 0)
    {
        global.flag[1053] = 0;
        scr_script_delayed(scr_board_instawarp, 1, 1280, 1600, 1632, 1712);
        safe_delete(obj_b3elevator);
    }
    if (keyboard_check(ord("W")) && keyboard_check_pressed(ord("R")))
        global.flag[1053] = 1;
    if (keyboard_check(ord("W")) && keyboard_check_pressed(ord("V")))
        scr_board_instawarp(512, 1088, 704, 1280);
    if (keyboard_check_pressed(ord("K")))
        obj_board_inventory.lancer++;
}
if (room == room_board_3b && scr_debug())
{
    if (keyboard_check(ord("W")) && keyboard_check_pressed(ord("V")))
        scr_board_instawarp(128, 1600, 288, 1728);
}
if (room == room_board_tests && scr_debug())
{
    if (keyboard_check_pressed(vk_up) && keyboard_check(vk_shift))
    {
        if (global.flag[1020] == 0)
        {
            snd_play(snd_board_lift);
            global.flag[1020] = 1;
            scr_debug_print("Susie can now grab");
        }
        else
        {
            snd_play_pitch(snd_board_lift, 0.6);
            global.flag[1020] = 0;
            scr_debug_print("Susie can no longer grab");
        }
    }
}
