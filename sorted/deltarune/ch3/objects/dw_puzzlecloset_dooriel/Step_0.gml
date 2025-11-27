buffer--;
scr_depth();
depth += 1000;
if (myinteract == 3)
{
    global.msc = 1304;
    scr_text(global.msc);
    with (d_make())
        side = 0;
    myinteract = 4;
}
if (myinteract == 4 && !d_ex())
    myinteract = 10;
if (myinteract == 10)
{
    codeentry = instance_create(x, y, obj_codeentry);
    with (codeentry)
    {
        side = 0;
        numcount = 3;
        noquit = true;
        correctcode[0] = 2;
        correctcode[1] = 1;
        correctcode[2] = 3;
        if (room == room_dw_puzzlecloset_2)
        {
            numcount = 4;
            correctcode[0] = 1;
            correctcode[1] = 2;
            correctcode[2] = 2;
            correctcode[3] = 5;
        }
        if (room == room_dw_puzzlecloset_3)
        {
            numcount = 6;
            correctcode[0] = 0;
            correctcode[1] = 0;
            correctcode[2] = 0;
            correctcode[3] = 0;
            correctcode[4] = 0;
            correctcode[5] = 0;
        }
    }
    timer = 0;
    myinteract = 11;
}
if (myinteract == 11)
{
    if (codeentry.result != -1)
    {
        timer++;
        if (timer == 1)
        {
            if (codeentry.result == -2)
            {
                with (codeentry)
                    instance_destroy();
                timer = 0;
                myinteract = 30;
            }
        }
        if (timer == 30)
        {
            scr_speaker("no_name");
            if (codeentry.result == 0)
            {
                msgsetloc(0, "* (..^1. wrong combination!)/%", "obj_dw_puzzlecloset_dooriel_slash_Step_0_gml_50_0");
                myinteract = 30;
                if (room == room_dw_puzzlecloset_1)
                {
                    with (obj_dw_puzzlecloset_1_consolesequence)
                    {
                        if (con == -1)
                            con = 0;
                    }
                    if (global.flag[1133] == 0)
                    {
                        global.flag[1133] = 1;
                        screenon = 1;
                    }
                    if (!i_ex(obj_puzzlecloset_tvturnon))
                    {
                        if (codeentry.entrystring == "123" || codeentry.entrystring == "123" || codeentry.entrystring == "132" || codeentry.entrystring == "231" || codeentry.entrystring == "312" || codeentry.entrystring == "321")
                        {
                            global.flag[1262]++;
                            if (resultcheck == 0)
                                resultcheck = 1;
                            if (global.flag[1262] >= 2)
                                resultcheck = 5;
                        }
                    }
                }
                if (room == room_dw_puzzlecloset_2)
                {
                    if (codeentry.entrystring == "1252" || codeentry.entrystring == "1522" || codeentry.entrystring == "2125" || codeentry.entrystring == "2152" || codeentry.entrystring == "2215" || codeentry.entrystring == "2251" || codeentry.entrystring == "2512" || codeentry.entrystring == "2521" || codeentry.entrystring == "5122" || codeentry.entrystring == "5212" || codeentry.entrystring == "5221")
                    {
                        if (resultcheck == 0)
                            resultcheck = 1;
                    }
                }
            }
            else
            {
                msgsetloc(0, "* (You entered the numbers knowingly.)/%", "obj_dw_puzzlecloset_dooriel_slash_Step_0_gml_55_0");
                myinteract = 50;
            }
            with (codeentry)
                instance_destroy();
            with (d_make())
            {
                side = 0;
                if (other.resultcheck == 1)
                    stay = 10;
            }
            timer = 0;
        }
    }
}
if (myinteract == 30 && !d_ex())
    myinteract = 99;
if (myinteract == 50 && !d_ex())
{
    if (room == room_dw_puzzlecloset_1)
        global.flag[1094] = 1;
    if (room == room_dw_puzzlecloset_2)
        global.flag[1095] = 1;
    if (room == room_dw_puzzlecloset_3)
        global.flag[1231] = 1;
    with (scr_dark_marker(x, y, sprite_index))
    {
        image_blend = c_black;
        depth = 1000050;
    }
    timer = 0;
    ribbickleave = 1;
    open = 1;
    myinteract++;
}
if (myinteract == 99)
{
    if (screenon == 1)
    {
        screenon = 2;
        with (obj_b3bs_console)
        {
            global.flag[1133] = 1;
            with (tv2)
                turnon = 1;
            with (tv1)
                scr_delay_var("turnon", 1, 3);
            with (tv3)
                scr_delay_var("turnon", 1, 6);
            snd = snd_play_x(snd_tv_poweron, 0.2, 0.5);
            snd_volume(snd, 0, 15);
            snd = snd_play_x(snd_tv_poweron, 0.4, 2);
            snd_volume(snd, 0, 15);
        }
    }
    buffer = 3;
    myinteract = 0;
    if (resultcheck == 1 || (resultcheck == 5 && global.flag[1133] == 1 && instance_number(obj_board_grabbablegrass) <= 4 && obj_dw_puzzlecloset_1_solidarea.everpressed))
    {
        global.interact = 1;
        scr_speaker("ralsei");
        msgsetloc(0, "\\Ed* ..^1. hmm..^1. I feel like that was close^1, but.../%", "obj_dw_puzzlecloset_dooriel_slash_Step_0_gml_259_0");
        if (resultcheck == 5)
        {
            scr_speaker("ralsei");
            msgsetloc(0, "\\Ed* Hmm..^1. 1^1,2^1, and 3 seem like the right numbers^1, but.../", "obj_dw_puzzlecloset_dooriel_slash_Step_0_gml_207_0");
            msgnextloc("\\EE* (Is the order..^1. different somehow?...)/%", "obj_dw_puzzlecloset_dooriel_slash_Step_0_gml_208_0");
        }
        d_make();
        resultcheck = 2;
    }
    else
    {
        global.interact = 0;
    }
}
if (resultcheck == 2 && !d_ex())
{
    resultcheck = 3;
    global.interact = 0;
}
if (ribbickleave == 1)
{
    timer++;
    if (timer == 1)
    {
        with (obj_npc_room)
        {
            if (sprite_index == spr_ribbick_Idle)
            {
                other.ribbick = scr_dark_marker(x, y, sprite_index);
                other.ribbick.depth = depth;
                instance_destroy();
            }
        }
        if (!i_ex(ribbick))
        {
        }
    }
    if (timer == 15)
    {
        with (ribbick)
        {
            scr_lerpvar("image_alpha", 1, 0, 45, 2, "out");
            scr_lerpvar("x", x, x - 120, 45, 2, "in");
            scr_doom(id, 45);
        }
    }
}
