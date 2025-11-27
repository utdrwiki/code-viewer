if (susie == 0)
{
    with (obj_mainchara_board)
    {
        if (name == "susie")
            other.susie = id;
    }
}
if (ralsei == 0)
{
    with (obj_mainchara_board)
    {
        if (name == "ralsei")
            other.ralsei = id;
    }
}
if (pyramid == 0)
{
    with (obj_pushableblock_board)
    {
        if (extflag == "rockSecretBlockTrig")
            other.pyramid = id;
    }
}
var mytrigger = "rocksecret";
if (active == 1)
{
    if (abandoncon == 1)
    {
        abandoncon++;
        with (obj_actor_tenna)
            bounce = 1;
        var tetalk = stringsetloc("You didn't want to see it. That's cool.", "obj_b1pushpyramid_slash_Step_0_gml_20_0");
        scr_couchtalk(tetalk, "tenna", 2, 61);
    }
    if (abandoncon == 2)
    {
        abandontimer++;
        if (abandontimer == 60)
        {
            with (obj_actor_tenna)
                bounce = 1;
            var tetalk = stringsetloc("That's fine. Okay. Yeah.", "obj_b1pushpyramid_slash_Step_0_gml_29_0");
            scr_couchtalk(tetalk, "tenna", 2, 61);
            abandontimer = 0;
            abandoncon++;
        }
    }
    if (abandoncon == 3)
    {
        abandontimer++;
        if (abandontimer == 60)
        {
            with (obj_actor_tenna)
                bounce = 1;
            var tetalk = stringsetloc("You'll just never be able to see it again.", "obj_b1pushpyramid_slash_Step_0_gml_41_0");
            scr_couchtalk(tetalk, "tenna", 2, 61);
            abandontimer = 0;
            abandoncon++;
        }
    }
    if (susiewalkcon == 0 && obj_board_camera.con == 0)
    {
        susietime++;
        if (susietime == 1)
            ralsei.follow = true;
        if (susietime >= 10)
        {
            if (!i_ex(obj_quizchaser) && !i_ex(obj_chaseenemy_board))
            {
                susiewalkcon = 1;
                susietime = 0;
            }
        }
    }
    if (susiewalkcon == 1)
    {
        with (obj_mainchara_board)
        {
            if (name == "susie")
                sleepy = true;
        }
        var weedcount = 0;
        with (obj_board_grabbablegrass)
        {
            if (active)
                weedcount++;
        }
        if (global.flag[1020] == 0)
            weedcount = 0;
        if (weedcount != 0)
        {
            susiewalkcon = 10;
        }
        else
        {
            susiewalkcon = 2;
            scr_pathfind_to_point("susie", 5.5, 4, 0);
            suwalktimer = 0;
        }
    }
    if (susiewalkcon == 2)
    {
        if (scr_board_checklocation("susie", board_tilex(5.5), board_tiley(4), 2))
            suwalktimer++;
        if (suwalktimer == 2)
            scr_play_recording("susie", choose("0W0W0W0W0W0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0W0W0W0W0W0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0W0R0W0W0D0W0W0W0W0W0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0W0W0L0L0L0L0L0L0W0W0W0W0W0W0U0U0U0U0U0U0U0U0W0W0W0W0W0W0D0D0D0D0D0D0D0W0W0W0W0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0W0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0W0W0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0W0W0W0W0L0L0L0L0L0L0D0D0D0D0D0D0D0D0W0W0W0W0W0W0W0L0L0L0L0L0L0L0L0D0D0D0D0D0D0D0D0W0W0W0W0W0U0U0U0U0U0U0U0U0U0U0U0U0U0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0D0D0D0D0D0D0D0D0W0W0W0W0W0W", "0W0W0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0RU0R0R0R0R0R0R0R0R0R0R0D0D0W0W0W0W0W0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0D0D0W0W0W0W0W0W0W0W0W0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0W0W0U0U0U0U0U0U0U0U0U0W0D0W0W0W0W0W0W0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0RD0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0W0W0W0W0W0W0W0W0W0W0W0R0R0R0R0R0R0R0R0R0R0R0R0R0R0RU0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0LU0L0L0L0L0L0L0L0L0L0L0L0L0L0L0U0U0U0U0U0U0U0U0W0W0W0D0W0W0W0W0W0W0W0W0W0W0W0W", "0W0W0W0W0W0W0W0W0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0LU0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0D0D0D0D0D0D0D0D0D0D0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0U0U0U0U0U0U0U0U0U0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0D0D0D0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0W0D0D0D0D0D0D0D0D0W0W0W0W0W0W0W0W0W0W0W0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0W0W0W0W0W0W0W0W0W0W0W0D0D0D0D0D0D0D0D0D0D0RD0RD0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0U0U0U0U0U0U0U0U0U0LU0L0L0L0L0L0L0L0L0L0L0W0W0W0W0W0W0W0W0W0W0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0RD0D0D0D0D0D0D0D0D0D0D0D0D0D0D0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W"));
    }
    if (susiewalkcon == 10)
    {
        targ = instance_nearest(susie.x, susie.y, obj_board_grabbablegrass);
        if (i_ex(targ))
        {
            if (point_in_rectangle(targ.x, targ.y, board_tilex(0), board_tiley(0), board_tilex(11), board_tiley(7)))
            {
                scr_pathfind_to_point("susie", targ.x, targ.y, 2);
            }
            else
            {
                scr_pathfind_end("susie");
                targ = -4;
                debug_print("no target");
                susiewalkcon = 99;
                susie.sleepy = true;
                scr_play_susie_recording("0W");
            }
        }
        susietime = 0;
        susiewalkcon = 11;
    }
    if (susiewalkcon == 11)
    {
        if (i_ex(targ))
        {
            if (scr_board_checklocation("susie", targ.x, targ.y, 2))
            {
                scr_pathfind_end("susie");
                susietime = 0;
                susiewalkcon = 12;
            }
        }
    }
    if (susiewalkcon == 12)
    {
        susietime++;
        if (susietime == 5)
            scr_play_susie_recording("0101");
        if (susietime == 45)
            susiewalkcon = 0;
    }
    if (con == 0)
    {
        with (pyramid)
        {
            if (waspushed != 0)
            {
                other.ptime++;
                if (other.ptime == 3)
                {
                    var replacement = instance_create(x, y, obj_board_solid);
                    other.pyramid = replacement;
                    replacement.sprite_index = sprite_index;
                    scr_darksize(replacement);
                    replacement.depth = depth;
                    replacement.visible = true;
                    other.con++;
                    instance_destroy();
                }
            }
        }
    }
    if (con == 1)
    {
        snd_play_pitch(snd_link_secret, 1);
        snd_play(snd_board_door_close);
        puff = instance_create_board(10, 2, obj_board_smokepuff);
        puff.image_blend = #FFECBD;
        maildoor = instance_create_board(10, 2, obj_board_warptouch);
        maildoor.warpx = 2048;
        maildoor.warpy = 320;
        maildoor.playerX = 2224;
        maildoor.playerY = 528;
        maildoor.extflag = "mailroom";
        maildoor.sprite_index = spr_board_downstairs;
        maildoor.visible = true;
        maildoor.image_alpha = 1;
        maildoor.depth = 999990;
        scr_darksize(maildoor);
        global.flag[1115] = 1;
        with (obj_actor_tenna)
            bounce = 1;
        var tetalk = stringsetloc("Incredible!!! You've discovered the SECRET MAILROOM!!!", "obj_b1pushpyramid_slash_Step_0_gml_196_0");
        scr_couchtalk(tetalk, "tenna", 2, 160);
        con = 2;
    }
}
else
{
    susiewalkcon = 0;
    susietime = 0;
    susiewalkcon = 0;
    if (abandoncon > 0)
        abandoncon = -1;
}
