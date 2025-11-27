scr_board_populatevars();
scr_gameshow_populatevars();
if (active)
{
    if (blocker == 0)
    {
        blocker = 1;
        with (instance_create(288, 800, obj_board_solid))
        {
            scr_size(2, 1);
            setxy_board();
        }
    }
    if (suwalk == 0)
    {
        suwalktimer++;
        if (suwalktimer == 1)
            ralsei.follow = false;
        if (suwalktimer == 15)
        {
            scr_pathfind_to_point("susie", board_tilex(6.5), 184, 0);
            with (obj_mainchara_board)
            {
                if (name == "susie")
                    sleepy = true;
            }
        }
        if (suwalktimer == 30)
            scr_pathfind_to_point("ralsei", board_tilex(4.5), 184, 0);
    }
    if (con == 0 && obj_board_camera.con == 0)
    {
        kris.cantleave = true;
        con = 1;
        contimer = 0;
        tenna.bounce = 1;
        var tetalk = stringsetloc("Just down that hole!!!", "obj_board_event_intro2_slash_Step_0_gml_17_0");
        scr_couchtalk(tetalk, "tenna", 2, 80);
    }
    if (con == 1)
    {
        contimer++;
        if (contimer == 80)
        {
            var sutalk = stringsetloc("A hole, huh? That's original.", "obj_board_event_intro2_slash_Step_0_gml_31_0");
            scr_couchtalk(sutalk, "susie", 2, 80);
        }
    }
    if (jumpcon == 0)
    {
        var trig = 0;
        with (kris)
        {
            if (place_meeting(x, y, obj_board_trigger))
                trig = 1;
        }
        if (trig == 1)
        {
            with (obj_mainchara_board)
            {
                if (name == "susie")
                    sleepy = false;
            }
            con = 99;
            jumpcon = 1;
            kris.canfreemove = false;
            timer = 0;
        }
    }
    if (jumpcon == 1)
    {
        if (scr_board_checklocation("ralsei", board_tilex(4.5), 184, 4) && scr_board_checklocation("susie", board_tilex(6.5), 184, 4))
        {
            timer++;
            if (timer == 15)
            {
                timer = 0;
                jumpcon = 2;
                snd_play_x(snd_jump, 0.8, 1);
                snd_play_x(snd_jump, 0.5, 1.2);
                with (obj_mainchara_board)
                    scr_jump_to_point(304, board_tiley(5.5), 12, 30);
            }
        }
    }
    if (jumpcon == 2)
    {
        timer++;
        if (timer == 10)
            transition = instance_create(0, 0, obj_board_transition);
        if (timer > 15)
        {
            if (transition.con == 3)
                room_goto(room_board_1);
        }
    }
}
else
{
    suwalk = 0;
    suwalktimer = 0;
}
