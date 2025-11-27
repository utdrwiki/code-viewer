scr_board_populatevars();
scr_gameshow_populatevars();
if (init == 0)
    init = 1;
if (inventory == 0)
    inventory = 1730;
if (con == 0)
    scr_depth_board();
if (active)
{
    if (con == 1)
    {
        global.interact = 1;
        if (inventory.qcount < 2)
        {
            con = 99;
            talked++;
            scr_speaker("no_name");
            msgsetloc(0, "WHIFF..^1. WHIFF..^1. MY NOSE KNOWS YOU DIDN'T DO THE OTHER QUIZZES./", "obj_board_event_b2sphinx_slash_Step_0_gml_31_0");
            msgnextloc("GO HIT THE BEACH AND SNIFF THEM OUT!/%", "obj_board_event_b2sphinx_slash_Step_0_gml_32_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "ACHOO^1! ACHOO^1! MY NOSE KNOWS YOU FOUND THE OTHER QUIZZES./", "obj_board_event_b2sphinx_slash_Step_0_gml_37_0");
            msgnextloc("NOW THERE'S JUST ONE LAST QUESTION.../", "obj_board_event_b2sphinx_slash_Step_0_gml_38_0");
            msgnextloc("DO YOU WANT THESE POINTS^1, OR NOT!?/%", "obj_board_event_b2sphinx_slash_Step_0_gml_39_0");
            con = 10;
        }
        if (global.flag[1022] == 1)
        {
            con = 99;
            scr_speaker("no_name");
            msgsetloc(0, ".../%", "obj_board_event_b2sphinx_slash_Step_0_gml_47_0");
        }
        var b = bw_make();
        b.side = 1;
    }
    if (con == 10 && !bw_ex())
    {
        quiz = instance_create(x, y, obj_quizsequence);
        quiz.depth = 900000;
        quiz.extflag = "sphinx2";
        scr_quizsetup(3, 0, 10);
        con = 11;
        timer = 0;
    }
    if (con == 11)
        global.interact = 1;
    if (con == 11 && !i_ex(quiz))
    {
        timer++;
        if (timer == 10)
        {
            scr_speaker("no_name");
            msgsetloc(0, "AND THAT'S THE FINAL QUIZ!/", "obj_board_event_b2sphinx_slash_Step_0_gml_72_0");
            msgnextloc("IN A WAY^1, WE WERE ALL WINNERS.../", "obj_board_event_b2sphinx_slash_Step_0_gml_73_0");
            msgnextloc("SO IF YOU DON'T MIND^1,/", "obj_board_event_b2sphinx_slash_Step_0_gml_74_0");
            msgnextloc("I'LL BE TAKING THAT ALL-EXPENSES-PAID TROPICAL VACATION!/%", "obj_board_event_b2sphinx_slash_Step_0_gml_75_0");
            var b = bw_make();
            b.side = 1;
            con = 12;
            timer = 0;
        }
    }
    if (con == 12)
    {
        if (!i_ex(glasses))
        {
            if (scr_getmsgno() == 3)
            {
                glasses = scr_board_marker(x + 36, y - 180, spr_board_sphinx_tenna_glasses, 0, depth - 1);
                with (glasses)
                    scr_lerpvar("y", y, other.y + 36, 30, 3, "out");
                obj_board_inventory.qcount = 0;
                snd_play_pitch(snd_item, 0.8);
            }
        }
        if (i_ex(glasses))
        {
            if (glasses.y >= (y + 36))
            {
                glasses.y = y + 36;
                con = 12.1;
            }
        }
    }
    if (con == 12.1 && !bw_ex())
    {
        timer++;
        var jumptime = 30;
        if (timer == 1)
        {
            safe_delete(glasses);
            sprite_index = spr_board_sphinx_tenna_floataway;
            nosedraw = false;
            scr_jump_to_point(x, y - 86, 12, jumptime);
        }
        if (timer == (1 + jumptime))
        {
            snd_play(snd_board_splash);
            floating = true;
            vspeed = -0.01;
            friction = -0.02;
        }
        if (timer == (1 + jumptime + 15))
        {
            con = 13;
            kris.facing = 0;
            global.interact = 0;
            scr_doom(id, 300);
        }
    }
    if (con == 13)
    {
        if (y < (board_tiley(0) - (sprite_height * 2)))
        {
            debug_message("sphinx offscreen");
            instance_destroy();
        }
    }
    if (con == 99 && !bw_ex())
    {
        con = 0;
        global.interact = 0;
    }
}
else
{
}
if (floating)
    siner++;
if (i_ex(mysolid))
{
    mysolid.x = x + 12;
    mysolid.y = y + 10;
}
