if (i_ex(star))
{
    with (star)
    {
        if (myinteract == 3)
        {
            global.interact = 1;
            global.msc = -99;
            global.choice = -1;
            global.choicemsg[0] = stringsetloc("#Pick it#up", "obj_room_console_room_slash_Step_0_gml_14_0");
            global.choicemsg[1] = stringsetloc("#Don't pick#it up", "obj_room_console_room_slash_Step_0_gml_15_0");
            global.choicemsg[2] = stringset("");
            global.choicemsg[3] = stringset("");
            scr_speaker("no_name");
            msgsetloc(0, "* (...? Seems there's a controller fallen on the ground.)/", "obj_room_console_room_slash_Step_0_gml_20_0");
            msgnext("\\C2 ");
            d_make();
            myinteract = 4;
        }
        if (myinteract == 4 && global.choice != -1)
        {
            k_d(2);
            scr_speaker("no_name");
            if (global.choice == 0)
            {
                visible = false;
                msgsetloc(0, "* (\\cYODDCONTROLLER\\cW was added to your \\cYKEY ITEMS\\cW.)/%", "obj_room_console_room_slash_Step_0_gml_34_0");
                myinteract = 6;
            }
            if (global.choice == 1)
            {
                msgsetloc(0, "* (You didn't pick up the strangely familiar controller.)/%", "obj_room_console_room_slash_Step_0_gml_39_0");
                myinteract = 5;
            }
            d_make();
        }
        if (myinteract == 5 && !d_ex())
        {
            global.interact = 0;
            myinteract = 0;
        }
        if (myinteract == 6)
        {
            if (scr_msgno_end(0) || !d_ex())
            {
                myinteract = 7;
                snd_play(snd_item);
            }
        }
        if (myinteract == 7 && !d_ex())
        {
            global.flag[1176] = 2;
            scr_keyitemget(16);
            global.interact = 0;
            myinteract = 0;
            other.star = -4;
            safe_delete(other.block);
            instance_destroy();
        }
    }
}
if (con == 10 && global.interact == 0)
{
    con = 11;
    global.interact = 1;
    scr_speaker("no_name");
    msgsetloc(0, "* Kris..^1. Kris^1, that's you^1, isn't it^1, luv?/", "obj_room_console_room_slash_Step_0_gml_81_0");
    msgnextloc("* Good show^1, good show.../", "obj_room_console_room_slash_Step_0_gml_82_0");
    msgnextloc("* Tenna's been up to this and that^1, that and this..^1. All sorts of boring stuff./", "obj_room_console_room_slash_Step_0_gml_83_0");
    msgnextloc("* But Kris^1! Oh^1, Kris^1! You and I know..^1. The REAL drama happens BACKSTAGE!/", "obj_room_console_room_slash_Step_0_gml_84_0");
    msgnextloc("* That's why..^1. I got it ready for you^1, y'know./", "obj_room_console_room_slash_Step_0_gml_85_0");
    msgnextloc("* One last game./", "obj_room_console_room_slash_Step_0_gml_86_0");
    msgnextloc("* And I'll keep watch./", "obj_room_console_room_slash_Step_0_gml_87_0");
    msgnextloc("* Well^1, just as long as..^1. haha. Just as long as I can./", "obj_room_console_room_slash_Step_0_gml_88_0");
    msgnextloc("* Now^1, Kris^1, I hate to trouble you^1, I really do^1, but.../", "obj_room_console_room_slash_Step_0_gml_89_0");
    msgnextloc("* Y'see^1, I can't really move myself now./", "obj_room_console_room_slash_Step_0_gml_90_0");
    msgnextloc("* If you could just shove me out of the way.../", "obj_room_console_room_slash_Step_0_gml_91_0");
    msgnextloc("* Yes^1, that's right^1! Just like that!/%", "obj_room_console_room_slash_Step_0_gml_92_0");
    d_make();
}
if (con == 11 && !d_ex())
{
    con = 12;
    scr_delay_var("con", 13, 120);
    scr_script_delayed(snd_play_x, 10, 168, 0.7, 1);
    scr_script_delayed(snd_play_x, 10, 155, 0.7, 1);
    with (ramb_npc)
        scr_lerpvar("y", y, y - 30, 90, 3, "inout");
}
if (con == 13)
{
    con = 14;
    scr_speaker("no_name");
    msgsetloc(0, "\\M0* Kris!/", "obj_room_console_room_slash_Step_0_gml_127_0");
    msgnextloc("\\M2* ..^1. enjoy the games^1, eh^1, luv?/%", "obj_room_console_room_slash_Step_0_gml_128_0");
    d_make();
}
if (con == 14 && !d_ex())
{
    con = -1;
    scr_flag_set(1238, 1);
    global.interact = 0;
    global.facing = 0;
}
