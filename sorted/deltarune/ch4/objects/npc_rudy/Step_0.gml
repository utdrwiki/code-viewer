if (coughcon < 0)
    event_inherited();
if (coughcon == 0 && !d_ex())
{
    global.interact = 1;
    coughcon = 1;
    is_coughing = true;
    snd_play(snd_rudycough);
    sprite_index = spr_rudy_cough;
    image_speed = 0.25;
    alarm[0] = 30;
}
if (coughcon == 2 && !d_ex())
{
    coughcon = 3;
    sprite_index = spr_rudy_d;
    image_speed = 0;
}
if (coughcon == 3 && !d_ex())
{
    coughcon = -1;
    is_coughing = false;
    global.interact = 0;
    myinteract = 0;
}
if (have_convo && !is_coughing)
{
    have_convo = false;
    talked++;
    global.msc = 1339;
    scr_text(global.msc);
    myinteract = 3;
    global.interact = 1;
    mydialoguer = instance_create(0, 0, obj_dialoguer);
}
if (con == 0 && !d_ex())
{
    con = 1;
    alarm[1] = 30;
    if (global.choice == 0)
    {
        scr_speaker("rudy");
        msgsetloc(0, "\\E4* That's right..^1. Festival tomorrow. Told Noelle I'd..^1. go support her./%", "obj_npc_rudy_slash_Step_0_gml_62_0");
        coughcon = 0;
    }
    if (global.choice == 1)
    {
        if (scr_flag_get(316) == 0)
        {
            if (scr_flag_get(752) == 0)
            {
                scr_flag_set(752, 1);
                scr_speaker("rudy");
                msgsetloc(0, "\\E1* Kris..^1. why the hell..^1. did you bring your friend here?/", "obj_npc_rudy_slash_Step_0_gml_76_0");
                scr_anyface_next("susie", 20);
                msgnextloc("\\EK* I^1, uh..^1. I dunno man^1, I..^1. Kris^1, why did you?/", "obj_npc_rudy_slash_Step_0_gml_78_0");
                scr_anyface_next("rudy", 7);
                msgnextloc("\\E7* Haha..^1. HAHAHA!^1! It's just so crazy^1, you gotta laugh!/%", "obj_npc_rudy_slash_Step_0_gml_80_0");
            }
            else
            {
                scr_speaker("rudy");
                msgsetloc(0, "\\E1* .../%", "obj_npc_rudy_slash_Step_0_gml_84_0");
            }
        }
        else if (scr_flag_get(753) == 0)
        {
            scr_flag_set(753, 1);
            scr_speaker("rudy");
            msgsetloc(0, "\\E4* Suzmeister..^1. nice..^1. seeing you at church today./", "obj_npc_rudy_slash_Step_0_gml_93_0");
            scr_anyface_next("susie", 3);
            msgnextloc("\\E3* ..^1. uh^1, thanks. You^1, uh^1, feeling any better?/", "obj_npc_rudy_slash_Step_0_gml_95_0");
            scr_anyface_next("rudy", 4);
            msgnextloc("\\E4* I'll..^1. I'll get there^1, just..^1. church was a lot./", "obj_npc_rudy_slash_Step_0_gml_97_0");
            msgnextloc("\\E6* ..^1. Susie?/", "obj_npc_rudy_slash_Step_0_gml_98_0");
            scr_anyface_next("susie", 0);
            msgnextloc("\\E0* Uhh^1, what?/", "obj_npc_rudy_slash_Step_0_gml_100_0");
            scr_anyface_next("rudy", "6");
            msgnextloc("\\E6* You going..^1. to the festival tomorrow?/", "obj_npc_rudy_slash_Step_0_gml_102_0");
            scr_anyface_next("susie", "N");
            msgnextloc("\\EN* Uhh^1, me? Yeah^1, uh..^1. I guess. If I have to./", "obj_npc_rudy_slash_Step_0_gml_104_0");
            scr_anyface_next("rudy", "3");
            msgnextloc("\\E3* Noelle..^1. she's not going with anyone./", "obj_npc_rudy_slash_Step_0_gml_106_0");
            scr_anyface_next("susie", "6");
            msgnextloc("\\E6* HER?? Wow^1, what the heck? No way./", "obj_npc_rudy_slash_Step_0_gml_108_0");
            msgnextloc("\\E6* Never expect that from HER^1! Woah. Total left field./", "obj_npc_rudy_slash_Step_0_gml_109_0");
            scr_anyface_next("rudy", "3");
            msgnextloc("\\E3* .../", "obj_npc_rudy_slash_Step_0_gml_111_0");
            scr_anyface_next("susie", "M");
            msgnextloc("\\EM* Mean^1, she's like^1, top shelf. People might get psyched out./", "obj_npc_rudy_slash_Step_0_gml_113_0");
            scr_anyface_next("rudy", "3");
            msgnextloc("\\E3* \"Top shelf.\"/", "obj_npc_rudy_slash_Step_0_gml_115_0");
            scr_anyface_next("susie", "D");
            msgnextloc("\\ED* Yeah. Uh^1, yeah. Anyway^1, uh^1, man. Sucks to be her./", "obj_npc_rudy_slash_Step_0_gml_117_0");
            scr_anyface_next("rudy", 2);
            msgnextloc("\\E2* Haha..^1. HAHAHA^1! It'll be..^1. fine^1, sweetheart./%", "obj_npc_rudy_slash_Step_0_gml_119_0");
        }
        else
        {
            scr_speaker("susie");
            msgsetloc(0, "\\EC* Damn^1, she could ask anybody and they'd say yes./", "obj_npc_rudy_slash_Step_0_gml_123_0");
            scr_anyface_next("rudy", 2);
            msgnextloc("\\E2* Hahaha^1! I wonder!/%", "obj_npc_rudy_slash_Step_0_gml_125_0");
        }
    }
    myinteract = 3;
    global.interact = 1;
    mydialoguer = instance_create(0, 0, obj_dialoguer);
}
if (con == 2 && !d_ex())
{
    if (global.choice == 0)
    {
        if (!is_coughing)
        {
            con = 3;
            scr_speaker("rudy");
            msgsetloc(0, "\\E5* Just gotta..^1. save up my strength. Then I'll.../", "obj_npc_rudy_slash_Step_0_gml_143_0");
            msgnextloc("\\E3* I'll be..^1. bustin' outta here^1, baby!/%", "obj_npc_rudy_slash_Step_0_gml_144_0");
            myinteract = 3;
            global.interact = 1;
            mydialoguer = instance_create(0, 0, obj_dialoguer);
        }
    }
    else
    {
        con = 3;
    }
}
if (con == 3 && !d_ex())
{
    con = 99;
    global.interact = 0;
    myinteract = 0;
}
