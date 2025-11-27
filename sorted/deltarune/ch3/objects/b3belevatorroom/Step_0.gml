scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
    if (con == 0 && obj_board_camera.con == 0)
    {
        kris.controlled = 0;
        susie.controlled = 1;
        ralsei.follow = 0;
        con = 1;
    }
    if (con == 1)
    {
        timer++;
        if (timer == 5)
            scr_play_recording("kris", "0L0L0L0L0L0L0L0L0L0L0L0LL0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0U0U0U0U0U0U0U0U0U0U");
        if (timer == 30)
        {
            scr_play_recording("ralsei", "0L0L0L0L0L0L0L0L0L0L0L0LL0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0U0U");
            timer = 0;
            con++;
        }
    }
    if (con == 2)
    {
        if (scr_board_checklocation("kris", 308, 156, 12))
        {
            timer++;
            if (timer == 15)
            {
                global.interact = 1;
                scr_speaker("no_name");
                msgsetloc(0, "THE \\cYMOONCLOUD KEY CARD\\cW WAS USED./%", "obj_b3belevatorroom_slash_Step_0_gml_43_0");
                bw_make();
                con++;
            }
        }
    }
    if (con == 3)
    {
        var proceed = false;
        timer = 0;
        if (i_ex(obj_board_writer))
        {
            if (obj_board_writer.halt == true)
                proceed = true;
        }
        if (!bw_ex())
            proceed = true;
        if (proceed)
        {
            con = 4;
            tenna.bounce = 1;
            var tetalk = stringsetloc("What the heck?", "obj_b3belevatorroom_slash_Step_0_gml_65_0");
            scr_couchtalk(tetalk, "tenna", 2, 80);
        }
    }
    if (con == 4 && !bw_ex())
    {
        timer++;
        if (timer == 1)
        {
            scr_board_gridreset();
            global.interact = 0;
            safe_delete(blocker);
            blackmarker = scr_board_marker(1442, 1632, spr_pxwhite, 0, 999999, 60);
            with (blackmarker)
                setxy_board(x, y);
            blackmarker.image_blend = c_black;
            snd_play(snd_board_door_close);
        }
        if (timer == 45)
            scr_play_recording("kris", "0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U");
        if (timer == 45)
        {
            scr_play_recording("ralsei", "0L0L0L0L0L0L0L0L0L0L0L0L0L0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U");
            con++;
            timer = 0;
        }
    }
    if (con == 5)
    {
        if (scr_board_checklocation("kris", 308, board_tiley(0), 10))
        {
            timer++;
            if (timer == 6)
            {
                with (obj_mainchara_board)
                    controlled = 0;
                kris.controlled = 1;
                global.interact = 1;
                obj_board_camera.shift = "up";
                tenna.bounce = 1;
                var tetalk = stringsetloc("The contestants, WOW! They have the ELEVATOR KEY CARD!", "obj_b3belevatorroom_slash_Step_0_gml_108_0");
                scr_couchtalk(tetalk, "tenna", 2, 80);
            }
        }
    }
}
else
{
}
