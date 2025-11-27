if (init == 0)
{
    with (obj_mainchara_board)
    {
        if (name == "kris")
            other.kr = id;
        if (name == "susie")
            other.su = id;
        if (name == "ralsei")
            other.ra = id;
    }
    if (kr != 0)
        init = 1;
}
if (active == 1)
{
    if (con == 0 && obj_board_camera.con == 0)
    {
        var letsstart = 0;
        with (kr)
        {
            if (place_meeting(x, y, obj_board_trigger))
            {
                var trig = instance_place(x, y, obj_board_trigger);
                if (trig.extflag == "push1")
                    letsstart = 1;
            }
        }
        if (letsstart == 1)
        {
            global.interact = 1;
            with (obj_board_trigger)
            {
                if (extflag == "push1")
                    instance_destroy();
            }
            hazard[0] = instance_create_board(9, 5, obj_board_solid);
            hazard[1] = instance_create_board(5, 7, obj_board_solid);
            hazard[2] = instance_create_board(6, 7, obj_board_solid);
            for (var i = 0; i < array_length(hazard); i++)
            {
                with (hazard[i])
                {
                    sprite_index = spr_board_rouxlsblock;
                    visible = true;
                    scr_darksize();
                    scr_depth_board();
                    var puff = instance_create(x, y, obj_board_smokepuff);
                    puff.depth = depth - 100;
                }
            }
            scr_shakescreen();
            snd_play_pitch(snd_impact_bc, 0.6);
            snd_play_pitch(snd_impact_bc, 1.2);
            timer = 0;
            con = 1;
        }
    }
    if (con == 1)
    {
        timer++;
        if (timer == 5)
        {
            global.interact = 0;
            scr_tennabubble("WELL HEY THERE#BOYS AND GIRLS,#IT'S TIME FOR#A BRAND NEW#PUZZLE!!!", 560, 100, -1, 1, -1, 70, 12);
            con = 2;
        }
    }
    if (con == 2 && !i_ex(obj_tennatalkbubble))
    {
        scr_tennabubble("THIS PUZZLE WAS#PUT TOGETHER BY A#SELF-PROCLAIMED,#WORLD RENOWNED#PUZZLE MASTER!", 550, 100, -1, 1, -1, 70, 18);
        bubbletimer = 0;
        con = 3;
    }
    if (con == 3 && !i_ex(obj_tennatalkbubble))
    {
        bubbletimer++;
        if (bubbletimer == 180)
        {
            scr_tennabubble("IF YOU'RE#STUCK, I CAN#GIVE YOU A#HINT FOR#ONLY 1000#POINTS!!", 574, 110, -1, 1, -1, 80, 20);
            con = 4;
        }
    }
    if (con > 1 && con < 100)
    {
        if (!i_ex(obj_board_event_push1_blocktrigger))
        {
            global.interact = 1;
            safe_delete(obj_tennatalkbubble);
            timer = 0;
            con = 100;
        }
    }
    if (con == 100)
    {
        timer++;
        if (timer >= 16)
        {
            scr_shakescreen();
            for (var i = 0; i < array_length(hazard); i++)
            {
                with (hazard[i])
                {
                    var puff = instance_create(x, y, obj_board_smokepuff);
                    puff.depth = depth - 100;
                    instance_destroy();
                }
            }
            with (obj_pushableblock_board)
            {
                if (extflag == "push1")
                {
                    mynpc = instance_create(x, y, obj_board_npc);
                    mynpc.sprite_index = sprite_index;
                    scr_darksize(mynpc);
                    mynpc.extflag = "ROUXLSBLOCK";
                    instance_destroy();
                }
            }
            snd_play_pitch(snd_impact_bc, 1.2);
            snd_play_pitch(snd_impact_bc, 0.6);
            scr_tennabubble("WHAT THE HECK KINDA#PUZZLE WAS THAT?!", 480, 408, 90, 1, -1, 64);
            global.interact = 0;
            con = 101;
        }
    }
}
