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
    maketimer = 0;
    if (con == 0 && obj_board_camera.con == 0)
    {
        if (ra.follow == 0)
            ra.follow = 1;
        var letsstart = 0;
        with (kr)
        {
            if (place_meeting(x, y, obj_board_trigger))
            {
                var trig = instance_place(x, y, obj_board_trigger);
                if (trig.extflag == "push2")
                    letsstart = 1;
            }
        }
        if (letsstart == 1)
        {
            global.interact = 1;
            with (obj_board_trigger)
            {
                if (extflag == "push2")
                    instance_destroy();
            }
            with (su)
                setxy(other.kr.x, other.kr.y);
            with (ra)
            {
                setxy(other.kr.x, other.kr.y);
                scr_board_caterpillar_interpolate();
            }
            hazard[0] = instance_create_board(5, 0, obj_board_solid);
            hazard[1] = instance_create_board(6, 0, obj_board_solid);
            hazard[2] = instance_create_board(0, 3, obj_board_solid);
            hazard[3] = instance_create_board(0, 4, obj_board_solid);
            hazard[4] = instance_create_board(5, 7, obj_board_solid);
            hazard[5] = instance_create_board(6, 7, obj_board_solid);
            hazard[6] = instance_create_board(11, 3, obj_board_solid);
            hazard[7] = instance_create_board(11, 4, obj_board_solid);
            for (var i = 0; i < 8; i++)
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
            scr_tennabubble("OH... #IT'S THIS#PUZZLE AGAIN.", 564, 100, -1, 1, -1, 72);
            con = 2;
            scr_pathfind_to_point("ralsei", 5, 2);
            scr_pathfind_to_point("susie", 7, 2);
        }
    }
    if (con == 2 && !i_ex(obj_tennatalkbubble))
    {
        scr_tennabubble("JUST SOLVE IT#AND LET'S#MOVE ON.", 564, 100, -1, 1, -1, 72);
        bubbletimer = 0;
        con = 3;
    }
    if (con == 3 && !i_ex(obj_tennatalkbubble))
    {
        bubbletimer++;
        if (bubbletimer == 180)
        {
            scr_tennabubble("WHAT A#WASTE OF#TIME.", 564, 100, -1, 1, -1, 72);
            con = 4;
        }
    }
    if (con > 1 && con < 100 && instance_number(obj_board_event_push2_blocktrigger) == 1)
    {
        con = 400;
        timer = 0;
    }
    if (con == 400)
    {
        timer++;
        if (timer >= 10)
        {
            scr_couchtalk("I think I might have an idea#how to help solve this puzzle.", "ralsei");
            con = -99999999;
            scr_script_delayed(scr_var, 15, "con", 401);
        }
    }
    if (con == 401)
    {
        scr_pathfind_end("ralsei");
        scr_pathfind_to_point("ralsei", 6, 3);
        timer = 0;
        con++;
    }
    if (con == 402)
    {
        with (ra)
        {
            if (x == board_tilex(6) && y == board_tiley(3))
            {
                goStoole = 1;
                other.con = 403;
            }
        }
    }
    if (con > 1 && con < 999)
    {
        if (!i_ex(obj_board_event_push2_blocktrigger))
        {
            global.interact = 1;
            safe_delete(obj_tennatalkbubble);
            timer = 0;
            con = 999;
        }
    }
    if (con == 999)
    {
        timer++;
        if (timer >= 16)
        {
            scr_shakescreen();
            for (var i = 0; i < 8; i++)
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
                if (extflag == "push2")
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
            solved = 1;
            scr_tennabubble("WHAT THE HECK KINDA#PUZZLE WAS THAT?!", 480, 408, 90, 1, -1, 64);
            ra.unstoole = 1;
            with (ra)
                scr_script_delayed(scr_var, 3, "unstoole", 1);
            with (ra)
                scr_script_delayed(scr_var, 4, "follow", 1);
            global.interact = 0;
            visited = 1;
            con++;
        }
    }
    if (solved)
    {
        if (visited == 0)
        {
            con++;
            visited = 1;
            ra.follow = true;
            scr_pathfind_to_point("susie", 2, 6);
        }
    }
}
else
{
    if (solved == 1 && made == 0)
    {
        maketimer++;
        if (maketimer > 30)
        {
            made = 1;
            chaseenemy = instance_create(x + 160, y + 96, obj_chaseenemy_board_spawner);
        }
    }
    if (solved && visited)
        visited = 0;
}
