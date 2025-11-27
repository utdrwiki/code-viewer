if (global.plot < 170)
{
    with (pippins_npc)
    {
        if (myinteract == 3)
        {
            var skip = 0;
            global.interact = 1;
            myinteract = 4;
            var trank = 0;
            if (global.flag[1173] == 5)
                trank = 1;
            scr_speaker("pippins");
            msgsetloc(0, "* Hey hey^1, looks like you rolled an S-Rank^1! (wink wink nudge nudge)/", "obj_room_changing_room_slash_Step_0_gml_20_0");
            msgnextloc("* Actually^1, I've heard there's an even higher rank for true TV Lovers./", "obj_room_changing_room_slash_Step_0_gml_21_0");
            var ender = "";
            if (!trank)
                ender = "%";
            msgnextsubloc("* ..^1. More like^1, TV Losers^1! Who wants to get THAT!? Nyuk huk huk.../~1", ender, "obj_room_changing_room_slash_Step_0_gml_24_0");
            if (trank)
                msgnextloc("* ..^1. huh? Why do you look so embarrassed...?/%", "obj_room_changing_room_slash_Step_0_gml_26_0");
            if (talked)
            {
                if (!trank)
                {
                    global.msc = 1256;
                    scr_text(global.msc);
                }
                else
                {
                    scr_speaker("pippins");
                    msgsetloc(0, "* ..^1. you have T-Rank^1, don't you. Heheh..^1. Well^1, don't sweat it./", "obj_room_changing_room_slash_Step_0_gml_38_0");
                    msgnextloc("* I know Tenna must have given it to you himself. Dang^1, he's corny...!/%", "obj_room_changing_room_slash_Step_0_gml_39_0");
                }
            }
            if (global.plot >= 160)
            {
                myinteract = 8;
                global.msc = -99;
                global.choice = -1;
                global.choicemsg[0] = stringsetloc("#Pay", "obj_room_changing_room_slash_Step_0_gml_54_0");
                global.choicemsg[1] = stringsetloc("#Don't", "obj_room_changing_room_slash_Step_0_gml_55_0");
                global.choicemsg[2] = stringset("");
                global.choicemsg[3] = stringset("");
                scr_speaker("pippins");
                msgsetloc(0, "* Hey, want a hint about RUDE BUSTER? It's only 1 POINT.../", "obj_room_changing_room_slash_Step_0_gml_59_0");
                msgnext("\\C2 ");
                if (talked)
                {
                    skip = true;
                    myinteract = 10;
                }
            }
            talked++;
            if (!skip)
                d_make();
        }
        if ((myinteract == 4 || myinteract == 8 || myinteract == 8.9 || myinteract == 11) && i_ex(obj_writer))
        {
            if (obj_writer.halt > 0)
            {
                image_speed = 0;
                image_index = 0;
            }
            if (obj_writer.halt == 0)
                image_speed = 0.125;
        }
        if (myinteract == 4 && !d_ex())
        {
            global.interact = 0;
            image_index = 0;
            myinteract = 0;
        }
        if (myinteract == 8 && global.choice != -1)
        {
            k_d(1);
            if (global.choice == 0)
            {
                if (global.flag[1044] < 1)
                    global.choice = 1;
            }
            if (global.choice == 0)
            {
                scr_speaker("pippins");
                msgsetloc(0, "* Thanks^1, don't mind if I do.../%", "obj_room_changing_room_slash_Step_0_gml_107_0_b");
                d_make();
                myinteract = 8.9;
            }
            if (global.choice == 1)
            {
                scr_speaker("pippins");
                msgsetloc(0, "* Fine^1, I'll tell you anyway./%", "obj_room_changing_room_slash_Step_0_gml_115_0");
                with (d_make())
                    stay = 2;
                myinteract = 10;
            }
        }
        if (myinteract == 8.9 && !d_ex())
        {
            with (instance_create(obj_mainchara.x + 17, obj_mainchara.y - 12, obj_board_pointsGetDisplay))
            {
                depth = 0;
                amount = -1;
                outofboard = true;
            }
            myinteract = 9;
        }
        if (myinteract == 9 && !i_ex(obj_board_pointsGetDisplay))
        {
            myinteract = -1;
            scr_delay_var("myinteract", 10, 15);
        }
        if (myinteract == 10 && !d_ex())
        {
            scr_speaker("pippins");
            msgsetloc(0, "* Right before Susie's RUDE BUSTER hits the enemy.../", "obj_room_changing_room_slash_Step_0_gml_143_0");
            msgnextsubloc("* Press ~1 to deal extra damage!/", scr_get_input_name(4), "obj_room_changing_room_slash_Step_0_gml_144_0");
            msgnextloc("* You'll know you did it right^1, 'cause the sound will change a little bit./", "obj_room_changing_room_slash_Step_0_gml_145_0");
            msgnextloc("* Pretty nifty^1, huh? Use it if you ever have to fight...!/%", "obj_room_changing_room_slash_Step_0_gml_146_0");
            d_make();
            myinteract = 11;
        }
        if (myinteract == 11 && !d_ex())
        {
            myinteract = 0;
            global.interact = 0;
        }
    }
}
if (ramb_move_start && !d_ex() && global.interact == 0)
    ramb_move = true;
if (ramb_move)
{
    ramb_move_timer++;
    if (ramb_move_timer == 1)
    {
        global.interact = 1;
        snd_play(snd_wing);
        scr_lerp_var_instance(ramb_npc, "x", ramb_npc.x, 135, 40, 4, "in");
    }
    if (ramb_move_timer == 41 && !d_ex())
    {
        ramb_move_end = true;
        ramb_move = false;
        if (scr_flag_get(1029) == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* There you go^1! And^1, I'm sure you know^1, but..^1. secret to Tenna^1, right^1, luv?/%", "obj_room_changing_room_slash_Step_0_gml_29_0");
            var d = d_make();
            d.side = 1;
        }
        var flag_set = 1;
        if (global.plot >= 150)
        {
            if (scr_flag_get(1029) == 1)
                flag_set = 2;
            if (scr_flag_get(1266) == 0)
                scr_flag_set(1266, 1);
        }
        if (global.plot >= 205)
            flag_set = 3;
        scr_flag_set(1029, flag_set);
    }
}
if (ramb_move_end && !d_ex())
{
    ramb_move_end = false;
    ramb_is_moved = true;
    global.interact = 0;
    with (obj_mainchara)
    {
        fun = 0;
        sprite_index = dsprite;
    }
    with (obj_npc_ramb)
        talked = 0;
    with (door_blocker)
        instance_destroy();
}
if (!ramb_explain)
    exit;
if (global.interact == 0)
    global.interact = 1;
if (ramb_explain_con == 0 && !d_ex())
{
    ramb_explain_con = (obj_mainchara.x >= (ramb_npc.x - 20)) ? 1 : 3;
    with (obj_mainchara)
        fun = 1;
    scr_speaker("no_name");
    msgsetloc(0, "* Ah^1, Kris. Look at you^1, a dressing room big shot^1! Cheers^1, cheers./%", "obj_room_changing_room_slash_Step_0_gml_80_0");
    var d = d_make();
}
if (ramb_explain_con == 1 && !d_ex())
{
    ramb_explain_con = 2;
    scr_delay_var("ramb_explain_con", 3, 60);
    snd_play(snd_wing);
    scr_lerp_var_instance(ramb_npc, "x", ramb_npc.xstart, ramb_npc.xstart - 50, 20, 2, "out");
    with (obj_mainchara)
    {
        fun = 1;
        sprite_index = lsprite;
        image_index = 0;
    }
}
if (ramb_explain_con == 3 && !d_ex())
{
    ramb_explain_con = 4;
    scr_speaker("no_name");
    msgsetloc(0, "\\M2* So how do you fancy the game^1, then? Right-o. It ain't much^1, innit^1, luv./", "obj_room_changing_room_slash_Step_0_gml_81_0");
    msgnextloc("\\M4* Now^1, I KNEW you wouldn't like it^1, I KNEW. So listen up.../%", "obj_room_changing_room_slash_Step_0_gml_82_0");
    var d = d_make();
    d.stay = 3;
}
if (ramb_explain_con == 4 && !d_ex())
{
    ramb_explain_con = 5;
    ramb_move_start = true;
    scr_speaker("no_name");
    msgsetloc(0, "\\M2* Y'see^1, that game you been playin'? It's not^1, EXACTLY^1, the original./", "obj_room_changing_room_slash_Step_0_gml_167_0");
    msgnextloc("\\M4* Ol' Tenna's done a little somethin' here^1, a little somethin' there.../", "obj_room_changing_room_slash_Step_0_gml_105_0");
    msgnextloc("\\M5* And made the whole adventure some big ol' blasted line from A to B./", "obj_room_changing_room_slash_Step_0_gml_106_0");
    msgnextloc("\\M4* Primo. Boring. Stuff./", "obj_room_changing_room_slash_Step_0_gml_107_0");
    msgnextloc("\\M6* But if I know Kris^1, and boy do I know Kris..^1. that's not what YOU want^1, innit?/", "obj_room_changing_room_slash_Step_0_gml_108_0");
    msgnextloc("\\M5* Freedom. That's what YOU want^1, chum^1, freedom!/", "obj_room_changing_room_slash_Step_0_gml_109_0");
    msgnextloc("\\M7* Well^1, if I can go hush-hush for a minute here.../", "obj_room_changing_room_slash_Step_0_gml_110_0");
    msgnextloc("\\M6* Kris^1, luv. THAT'S what we got backstage./", "obj_room_changing_room_slash_Step_0_gml_111_0");
    msgnextloc("\\M5* The ORIGINAL game. Where YOU decide what to do./", "obj_room_changing_room_slash_Step_0_gml_114_0");
    msgnextloc("\\M0* All right^1, enough explaining^1, more gaming!/", "obj_room_changing_room_slash_Step_0_gml_120_0");
    msgnextloc("\\M7* I'll keep an eye out for Tenna^1, you go have some REAL fun^1, alright^1, luv?/%", "obj_room_changing_room_slash_Step_0_gml_177_0");
    var d = d_make();
    d.stay = 3;
}
if (ramb_explain_con == 5 && !d_ex())
{
    ramb_explain_con = 0;
    ramb_explain = false;
    global.interact = 0;
    global.facing = 0;
}
