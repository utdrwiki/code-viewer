function scr_litemuseb(arg0, arg1)
{
    var is_weapon = get_weapon_by_lw_id(arg1) != -4;
    if (is_weapon && !scr_lweapon_can_equip(arg1))
    {
        scr_speaker("no_name");
        msgsetloc(0, "* For some reason you couldn't equip it./%", "scr_litemuseb_slash_scr_litemuseb_gml_10_0");
        scr_writetext(0, "x", 0, 0);
        exit;
    }
    switch (arg1)
    {
        case 0:
            global.msg[0] = stringsetloc("* You grasped at nothing./%%", "scr_litemuseb_slash_scr_litemuseb_gml_6_0");
            break;
        case 1:
            global.msg[0] = stringsetloc("* You drank the hot chocolate^1.&* It tasted wonderful^1.&* Your throat tightened.../%", "scr_litemuseb_slash_scr_litemuseb_gml_9_0");
            snd_play(snd_swallow);
            scr_writetext(0, "x", 0, 0);
            script_execute(scr_litemshift, arg0, 0);
            with (obj_event_manager)
                trigger_event(UnknownEnum.Value_0, UnknownEnum.Value_12);
            break;
        case 2:
            global.msg[0] = stringsetloc("* You equipped the Pencil./%", "scr_litemuseb_slash_scr_litemuseb_gml_18_0");
            scr_lweaponeq(arg0, arg1);
            snd_play(snd_item);
            scr_writetext(0, "x", 0, 0);
            break;
        case 3:
            global.msg[0] = stringsetloc("* You re-applied the bandage.", "scr_litemuseb_slash_scr_litemuseb_gml_26_0");
            script_execute(scr_lrecoitem, 1);
            script_execute(scr_litemshift, arg0, 0);
            break;
        case 4:
            global.msg[0] = stringsetloc("* You held out the flowers^1.&* A floral scent fills the air^1.&* Nothing happened./%", "scr_litemuseb_slash_scr_litemuseb_gml_34_0");
            scr_writetext(0, "x", 0, 0);
            break;
        case 5:
            global.msg[0] = stringsetloc("* You looked at the junk ball in admiration^1.&* Nothing happened./%", "scr_litemuseb_slash_scr_litemuseb_gml_42_0");
            scr_writetext(0, "x", 0, 0);
            break;
        case 6:
            global.msg[0] = stringsetloc("* You equipped the Halloween Pencil./%", "scr_litemuseb_slash_scr_litemuseb_gml_48_0");
            scr_lweaponeq(arg0, arg1);
            snd_play(snd_item);
            scr_writetext(0, "x", 0, 0);
            break;
        case 7:
            global.msg[0] = stringsetloc("* You equipped the Lucky Pencil./%", "scr_litemuseb_slash_scr_litemuseb_gml_56_0");
            scr_lweaponeq(arg0, arg1);
            snd_play(snd_item);
            scr_writetext(0, "x", 0, 0);
            break;
        case 8:
            global.msg[0] = stringsetloc("* You used the Egg./%", "scr_litemuseb_slash_scr_litemuseb_gml_63_0");
            snd_play(snd_egg);
            scr_writetext(0, "x", 0, 0);
            break;
        case 9:
            msgsetloc(0, "* You held the cards^1.&* They felt flimsy between your fingers./%", "scr_litemuseb_slash_scr_litemuseb_gml_69_0");
            scr_writetext(0, "x", 0, 0);
            break;
        case 10:
            var consume_item = 0;
            var have_susie = scr_havechar(2);
            var sans_npc = 0;
            if (i_ex(obj_marker))
            {
                with (obj_marker)
                {
                    if (sprite_index == spr_sans_d && abs(obj_mainchara.x - x) <= 20 && abs(obj_mainchara.y - y) <= 40)
                        sans_npc = 1;
                }
            }
            var alphys_npc = 0;
            if (i_ex(obj_npc_sign))
            {
                with (obj_npc_sign)
                {
                    if (sprite_index == spr_alphysd && abs(obj_mainchara.x - x) <= 20 && abs(obj_mainchara.y - y) <= 40)
                        alphys_npc = 1;
                }
            }
            if (sans_npc)
            {
                consume_item = 1;
                global.lgold += 5;
                global.flag[342] = 4;
                scr_speaker("sans");
                msgsetloc(0, "* what? a heart shaped box of chocolates?/", "scr_litemuseb_slash_scr_litemuseb_gml_107_0");
                msgnextloc("\\E3* oh^1, i get it./", "scr_litemuseb_slash_scr_litemuseb_gml_108_0");
                msgnextloc("\\E2* heh./", "scr_litemuseb_slash_scr_litemuseb_gml_109_0");
                msgnextloc("* wow./", "scr_litemuseb_slash_scr_litemuseb_gml_110_0");
                msgnextloc("\\E0* you're really.../", "scr_litemuseb_slash_scr_litemuseb_gml_111_0");
                msgnextloc("* hm./", "scr_litemuseb_slash_scr_litemuseb_gml_112_0");
                msgnextloc("\\E1* alright^1, alright./", "scr_litemuseb_slash_scr_litemuseb_gml_113_0");
                msgnextloc("\\E0* ..^1. okay./", "scr_litemuseb_slash_scr_litemuseb_gml_114_0");
                msgnextloc("\\E3* you wanna make a return on these^1, don't you?/", "scr_litemuseb_slash_scr_litemuseb_gml_115_0");
                msgnextloc("\\E5* okay^1, okay^1, no need to break my heart./", "scr_litemuseb_slash_scr_litemuseb_gml_116_0_b");
                msgnextloc("\\E0* here's five dollars./", "scr_litemuseb_slash_scr_litemuseb_gml_117_0_b");
                scr_anyface_next("no_name", 0);
                msgnextloc("* (You traded the chocolates for 5 dollars.)/%", "scr_litemuseb_slash_scr_litemuseb_gml_119_0");
            }
            else if (alphys_npc)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* (You could give Alphys the chocolate if you talk to her.)/%", "scr_litemuseb_slash_scr_litemuseb_gml_123_0");
            }
            else if (have_susie)
            {
                consume_item = 1;
                global.lhp = 19;
                global.flag[342] = 2;
                scr_speaker("susie");
                msgsetloc(0, "\\E7* Woah^1, Kris^1, where the hell'd you get that?/", "scr_litemuseb_slash_scr_litemuseb_gml_131_0");
                msgnextloc("\\E6* ..^1. someone gave it to you?/", "scr_litemuseb_slash_scr_litemuseb_gml_132_0");
                msgnextloc("\\EY* HAHAHA!^1! YEAH RIGHT!!^1! You stole it^1, didn't you!?/", "scr_litemuseb_slash_scr_litemuseb_gml_133_0");
                msgnextloc("\\E2* Well^1, c'mon!^1! Let's eat it and hide the evidence!!/", "scr_litemuseb_slash_scr_litemuseb_gml_134_0");
                scr_anyface_next("no_name", 0);
                msgnextloc("* (You and Susie shared the heart-shaped box of candies.)/", "scr_litemuseb_slash_scr_litemuseb_gml_136_0_b");
                msgnextloc("* (Both of you had a feeling in your chest...)/", "scr_litemuseb_slash_scr_litemuseb_gml_137_0_b");
                scr_anyface_next("susie", 12);
                msgnextloc("\\EC* Ow^1, my stomach.../", "scr_litemuseb_slash_scr_litemuseb_gml_139_0");
                scr_anyface_next("no_name", 0);
                msgnextloc("* (..^1. that you shouldn't have eaten all of it.)/%", "scr_litemuseb_slash_scr_litemuseb_gml_141_0");
            }
            else
            {
                consume_item = 1;
                global.lhp = 19;
                global.flag[342] = 1;
                scr_speaker("no_name");
                msgsetloc(0, "* (You unhesitatingly devoured the box of heart shaped candies.)/", "scr_litemuseb_slash_scr_litemuseb_gml_149_0");
                msgnextloc("* (Your guts are being destroyed.)/", "scr_litemuseb_slash_scr_litemuseb_gml_150_0");
                msgnextloc("* (You accept this destruction as part of life...)/%", "scr_litemuseb_slash_scr_litemuseb_gml_151_0");
                scr_writetext(0, "x", 0, 0);
            }
            d_make();
            if (consume_item)
                script_execute(scr_litemshift, arg0, 0);
            break;
        case 11:
            scr_speaker("no_name");
            msgsetloc(0, "* It doesn't seem very useful./%", "scr_itemuse_slash_scr_itemuse_gml_629_0");
            if (scr_flag_get(1623) == 0)
            {
                var holiday_rooms = [107, 48, 49, 50, 52, 53, 54];
                var is_holiday_room = false;
                for (var i = 0; i < array_length(holiday_rooms); i++)
                {
                    if (room == holiday_rooms[i])
                    {
                        is_holiday_room = true;
                        break;
                    }
                }
                if (is_holiday_room)
                {
                    scr_flag_set(1623, 1);
                    scr_speaker("no_name");
                    msgsetloc(0, "* You looked through the glass./", "scr_litemuseb_slash_scr_litemuseb_gml_209_0");
                    msgnextloc("* For some strange reason^1, for just a brief moment.../", "scr_litemuseb_slash_scr_litemuseb_gml_210_0");
                    msgnextloc("* You thought you saw Noelle close against you^1, whispering./", "scr_litemuseb_slash_scr_litemuseb_gml_211_0");
                    msgnextloc("* You put the glass to your ear.../", "scr_litemuseb_slash_scr_litemuseb_gml_212_0");
                    msgnextloc("* ..^1. of course^1, that didn't do anything.../%", "scr_litemuseb_slash_scr_litemuseb_gml_213_0");
                }
            }
            scr_writetext(0, "x", 0, 0);
            break;
        case 12:
            global.msg[0] = stringsetloc("* You equipped the Eraser./%", "scr_litemuseb_slash_scr_litemuseb_gml_221_0");
            scr_lweaponeq(arg0, arg1);
            snd_play(snd_item);
            scr_writetext(0, "x", 0, 0);
            break;
        case 13:
            global.msg[0] = stringsetloc("* You equipped the Mech. Pencil./%", "scr_litemuseb_slash_scr_litemuseb_gml_228_0");
            scr_lweaponeq(arg0, arg1);
            snd_play(snd_item);
            scr_writetext(0, "x", 0, 0);
            break;
        case 15:
            global.msg[0] = stringsetloc("* You equipped the Holiday Pencil./%", "scr_litemuseb_slash_scr_litemuseb_gml_235_0");
            scr_lweaponeq(arg0, arg1);
            snd_play(snd_item);
            scr_writetext(0, "x", 0, 0);
            break;
        case 16:
            global.msg[0] = stringsetloc("* You equipped the CactusNeedle./%", "scr_litemuseb_slash_scr_litemuseb_gml_242_0");
            scr_lweaponeq(arg0, arg1);
            snd_play(snd_item);
            scr_writetext(0, "x", 0, 0);
            break;
        case 17:
            global.msg[0] = stringsetloc("* You equipped the BlackShard./%", "scr_litemuseb_slash_scr_litemuseb_gml_249_0");
            scr_lweaponeq(arg0, arg1);
            snd_play(snd_item);
            scr_writetext(0, "x", 0, 0);
            break;
        case 18:
            global.msg[0] = stringsetloc("* You equipped the QuillPen./%", "scr_litemuseb_slash_scr_litemuseb_gml_256_0");
            scr_lweaponeq(arg0, arg1);
            snd_play(snd_item);
            scr_writetext(0, "x", 0, 0);
            break;
        case 201:
            tempsaid = 0;
            snd_play_x(snd_phone, 0.7, 1);
            global.msg[0] = stringsetloc("* Ring.../", "scr_litemuseb_slash_scr_litemuseb_gml_116_0");
            global.msg[1] = stringsetloc("* No one picked up./%", "scr_litemuseb_slash_scr_litemuseb_gml_117_0");
            if (global.chapter == 4)
            {
                if (global.plot >= 40)
                {
                    if (room == room_krisroom || room == room_krishallway || room == room_torbathroom)
                    {
                        tempsaid = 1;
                        global.flag[268] = 1;
                        scr_torface(1, 0);
                        global.msg[2] = stringsetloc("\\E0* Hello?&* Dreemurr residence...&* Who might this be...?/", "scr_litemuseb_slash_scr_litemuseb_gml_126_0");
                        global.msg[3] = stringsetloc("\\E3* ... Kris?/", "scr_litemuseb_slash_scr_litemuseb_gml_127_0");
                        global.msg[4] = stringsetloc("\\E5* Sigh... Do not make me come over there./", "scr_litemuseb_slash_scr_litemuseb_gml_128_0");
                        scr_noface(5);
                        global.msg[6] = stringsetloc("* Click.../%", "scr_litemuseb_slash_scr_litemuseb_gml_130_0");
                    }
                    else
                    {
                        scr_speaker("no_name");
                        msgsetloc(0, "* (Ring^1, ring...)/", "scr_litemuseb_slash_scr_litemuseb_gml_389_0");
                        msgnextloc("* (Everybody seems too busy to pick up the phone...)/%", "scr_litemuseb_slash_scr_litemuseb_gml_390_0");
                    }
                }
            }
            if (room == room_torhouse)
            {
                tempsaid = 1;
                global.msg[0] = stringsetloc("* Ring.../", "scr_litemuseb_slash_scr_litemuseb_gml_136_0");
                global.msg[1] = stringsetloc("* (The phone is ringing^1, but you can't get it.)/", "scr_litemuseb_slash_scr_litemuseb_gml_137_0");
                global.msg[2] = stringsetloc("* (You're already on the phone^1, after all...)/%", "scr_litemuseb_slash_scr_litemuseb_gml_138_0");
            }
            scr_writetext(0, "x", 0, 0);
            break;
        case 202:
            global.msc = 375;
            scr_text(global.msc);
            global.typer = 5;
            global.fc = 0;
            instance_create(0, 0, obj_dialoguer);
            break;
    }
}

enum UnknownEnum
{
    Value_0,
    Value_12 = 12
}
