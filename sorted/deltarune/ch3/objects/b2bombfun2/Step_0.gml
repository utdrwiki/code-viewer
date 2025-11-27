scr_board_populatevars();
scr_gameshow_populatevars();
if (mossblock == 0)
{
    with (obj_board_npc)
    {
        if (extflag == "b2bombfun2")
            other.mossblock = id;
    }
}
if (bombfun1visited == 1)
{
    safe_delete(blocker);
    mossblock.y -= 32;
    bombfun1visited = 2;
}
if (active == 1)
{
    if (bombfun1visited == 0)
    {
        with (obj_board_trigger)
        {
            if (extflag == "bombhint")
            {
                if (place_meeting(x, y, obj_mainchara_board))
                {
                    other.bombfun1visited = 0.1;
                    other.timer2 = 0;
                }
            }
        }
    }
    if (bombfun1visited == 0.1)
    {
        var tetalk = stringsetloc("A cracked wall! What could it mean!?", "obj_b2bombfun2_slash_Step_0_gml_36_0");
        scr_couchtalk(tetalk, "tenna", 2, 60);
        bombfun1visited = 0.5;
    }
    if (mosscon == 1)
    {
        if (i_ex(obj_board_writer))
        {
            if (i_ex(obj_writer))
            {
                if (obj_writer.msgno == 1)
                {
                    if (obj_writer.halt)
                        mosscon = 2;
                }
            }
        }
    }
    if (mosscon == 2)
    {
        mosstimer++;
        if (mosstimer == 1)
        {
            mossblock.x = room_width * 999;
            global.flag[1078] = 1;
            kris.myhealth = kris.maxhealth;
            snd_play(snd_power);
            with (obj_event_manager)
                trigger_event(UnknownEnum.Value_0, UnknownEnum.Value_11);
        }
        if (mosstimer == 25)
        {
            var talk = stringsetloc("That's what#it means.", "obj_b2bombfun2_slash_Step_0_gml_63_0");
            if (bombfun1visited == 0.5)
                scr_couchtalk(talk, "ralsei", 2, 90);
            else
                talk = stringsetloc("Damn. Good catch. THAT'S why Kris should be playing.", "obj_b2bombfun2_slash_Step_0_gml_70_0");
            scr_couchtalk(talk, "susie", 2, 90);
            mosscon++;
        }
    }
    if (con == 0 && obj_board_camera.con == 0)
    {
        var boardkris = -4;
        with (obj_mainchara_board)
        {
            if (name == "kris")
                boardkris = id;
        }
        var trig = false;
        with (obj_board_trigger)
        {
            if (extflag == "tennaback" && boardkris != -4)
            {
                if (place_meeting(x, y, boardkris))
                {
                    trig = true;
                    instance_destroy();
                }
            }
        }
        if (trig == true)
        {
            con = 1;
            timer = 0;
        }
    }
    if (con == 1 && bombfun1visited == 2)
    {
        timer++;
        if (timer == 1)
        {
            with (tenna)
                scr_lerpvar("x", camerax() + 784, 484, 15, -1, "out");
            snd_play(snd_slidewhistle);
            global.flag[1022] = 0;
            global.flag[1024] = 1;
        }
        if (timer == 16)
        {
            tenna.bounce = true;
            var tetalk = stringsetloc("I'm back! I apologize to the viewers!!!", "obj_b2bombfun2_slash_Step_0_gml_113_0");
            scr_couchtalk(tetalk, "tenna", 2, 90);
            global.flag[1024] = 0;
            timer = 0;
            con++;
        }
    }
    if (suwalk == 0 && obj_board_camera.con == 0)
    {
        suwalktimer++;
        if (suwalktimer == 1)
            ralsei.follow = true;
        if (suwalktimer == 15)
        {
            susie.sleepy = true;
            if (susie.x == 416)
            {
                if (i_ex(obj_quizchaser))
                    scr_pathfind_to_point("susie", 7, 1, 0);
                else
                    scr_pathfind_to_point("susie", 3, 2, 0);
            }
            else if (i_ex(obj_quizchaser))
            {
                scr_pathfind_to_point("susie", 8, 6, 0);
            }
            else
            {
                scr_pathfind_to_point("susie", 3, 3, 0);
            }
            suwalk = 1;
        }
    }
}
else
{
    suwalk = 0;
    suwalktimer = 0;
}

enum UnknownEnum
{
    Value_0,
    Value_11 = 11
}
