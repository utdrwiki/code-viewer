if (scr_debug())
{
    if (keyboard_check_pressed(ord("O")) && keyboard_check(vk_control))
        wither = 1;
}
if (room != room_board_1_sword)
{
    if (init == 0)
    {
        sparkle = scr_board_marker((x + (sprite_width / 2)) - 8, (y - 8) + 2, spr_board_b1oasis_spray, 0.1, 100000, 2);
        with (sparkle)
            scr_depth_board();
        init = 1;
    }
    buffer--;
    if (myinteract == 3)
    {
        if (watercount > 0 && wither == 0)
        {
            global.msc = 20000;
            scr_text(global.msc);
            scr_speaker("no_name");
            global.choicemsg[0] = stringsetloc("DRINK", "obj_board_oasis_slash_Step_0_gml_23_0");
            global.choicemsg[1] = stringsetloc("DON'T#DRINK", "obj_board_oasis_slash_Step_0_gml_24_0");
            global.choicemsg[2] = stringset("");
            global.choicemsg[3] = stringset("");
            msgsetloc(0, "THE OASIS IS SPARKLING./", "obj_board_oasis_slash_Step_0_gml_27_0");
            msgnextloc("DRINK IT?/", "obj_board_oasis_slash_Step_0_gml_28_0");
            msgnextloc(" \\C2", "obj_board_oasis_slash_Step_0_gml_29_0");
            if (read > 1)
                msgset(0, "\\C2");
            myinteract = 4;
            var b = bw_make();
            b.stay = 4;
            b.side = 0;
        }
        else
        {
            msgsetloc(0, "THERE IS NOTHING LEFT./%", "obj_board_oasis_slash_Step_0_gml_37_0");
            myinteract = 5;
            var b = bw_make();
            b.side = 0;
        }
    }
    if (myinteract == 4 && !i_ex(obj_choicer_neo) && !i_ex(obj_board_writer))
    {
        myinteract = 5;
        if (global.choice == 0)
        {
            watercount--;
            if (watercount > 0)
            {
                scr_speaker("no_name");
                msgsetloc(0, "IT TASTES LIKE MINT AND SAND./", "obj_board_oasis_slash_Step_0_gml_54_0");
                msgnextloc("YOUR WOUNDS WERE HEALT./%", "obj_board_oasis_slash_Step_0_gml_55_0");
                snd_play(snd_power);
                with (obj_mainchara_board)
                    myhealth += 4;
                if (read == 1)
                {
                    var b = bw_make();
                    b.skip = true;
                    b.side = 0;
                }
                else
                {
                    myinteract = 9;
                }
            }
            else
            {
                global.flag[1079] = 1;
                scr_speaker("no_name");
                msgsetloc(0, "YOU SUCKED UP ALL THE OASIS WITH A STRAW./", "obj_board_oasis_slash_Step_0_gml_63_0");
                msgnextloc("TASTES LIKE SANDY REGRET./", "obj_board_oasis_slash_Step_0_gml_64_0");
                msgnextloc("THE ENVIRONMENT DETERIORATES./%", "obj_board_oasis_slash_Step_0_gml_65_0");
                snd_play(snd_power);
                snd_play_pitch(snd_howl, 0.5);
                audio_pause_sound(global.currentsong[1]);
                wither = 1;
                var b = bw_make();
                b.skip = true;
                b.side = 0;
                battle = 1;
            }
        }
        if (global.choice == 1)
        {
            if (read == 1)
                read = 0;
            msgsetloc(0, "%%", "obj_board_oasis_slash_Step_0_gml_78_0");
            safe_delete(obj_board_writer);
            safe_delete(obj_board_writer_stay);
        }
    }
    if (myinteract == 5 && !bw_ex())
    {
        myinteract = 9;
        if (battle == 1)
        {
            myinteract = -1;
            battle = 0;
            with (obj_board_event_ninfight)
                force = 1;
        }
    }
    if (myinteract == 9)
    {
        myinteract = 0;
        buffer = 3;
        global.interact = 0;
    }
    if (wither == 1)
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
        wither = 2;
    }
    if (wither >= 1)
        safe_delete(sparkle);
    if (wither == 2)
    {
        scr_board_marker(x, y, spr_board_oasis_drained, 0, 999999);
        wither = 3;
        setxy(room_width * 2, room_height * 2);
    }
}
