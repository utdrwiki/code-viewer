if (kris == 0)
{
    with (obj_mainchara_board)
    {
        if (name == "kris")
            other.kris = id;
    }
}
if (roomstartMusic == false)
{
    mus_play_ext("glacier.ogg", 1, 0.7, 0.07);
    roomstartMusic = true;
}
if (active == true)
{
    if (con == 0)
    {
        with (instance_create(1056, 320, obj_board_solid))
        {
            scr_size(20, 2);
            setxy_board();
        }
        snd_free_all();
        kris.cantleave = true;
        con = 1;
    }
    if (con >= 1 && obj_board_camera.con == 0 && i_ex(obj_board_shadowspotlight))
        safe_delete(obj_board_shadowspotlight);
    if (con == 1)
    {
        if (place_meeting(x, y, kris))
        {
            kris.y = 256;
            for (var i = 0; i < 2; i++)
            {
                block[i] = instance_create_board(5 + i, 7, obj_board_solid);
                block[i].sprite_index = spr_shadow_mantle_new_tiles;
                block[i].image_index = 1;
                block[i].image_speed = 0;
                with (block[i])
                {
                    visible = true;
                    depth = other.depth + 1;
                }
            }
            con = -1;
            if (global.flag[1002] == 0)
                scr_delay_var("con", 1.5, 20);
            else
                con = 2.5;
            global.interact = 1;
            kris.facing = 2;
        }
    }
    if (con == 1.5)
    {
        con = -1;
        scr_delay_var("con", 2, 60);
    }
    if (con == 2)
    {
        global.interact = 1;
        kris.facing = 2;
        startmusic = 1;
        scr_speaker("no_name");
        msgsetloc(0, "Kris..^1. oh..^1. Kris.../", "obj_board_preshadowmantle_slash_Step_0_gml_79_0");
        msgnextloc("Is it fun^1, Kris?/", "obj_board_preshadowmantle_slash_Step_0_gml_80_0");
        msgnextloc("Playing around like this.../", "obj_board_preshadowmantle_slash_Step_0_gml_81_0");
        msgnextloc("That's why you're searching for them^1, aren't you?/", "obj_board_preshadowmantle_slash_Step_0_gml_82_0");
        msgnextloc("The SHADOW CRYSTALs.../", "obj_board_preshadowmantle_slash_Step_0_gml_83_0");
        msgnextloc("..^1. and the SHADOW MANTLE that I'm holding!/", "obj_board_preshadowmantle_slash_Step_0_gml_84_0_b");
        msgnextloc("Do you honestly think it'll get you what you want...?/", "obj_board_preshadowmantle_slash_Step_0_gml_84_0");
        msgnextloc("..^1. no^1, part of you is just..^1. enjoying this^1, isn't it?/", "obj_board_preshadowmantle_slash_Step_0_gml_85_0");
        if (scr_sideb_get_phase() > 0)
        {
            msgnextloc("The same part of you that enjoyed yesterday./", "obj_board_preshadowmantle_slash_Step_0_gml_90_0");
            msgnextloc("Knowing you could say it wasn't really you./", "obj_board_preshadowmantle_slash_Step_0_gml_91_0");
        }
        msgnextloc("Oh^1, don't make that sour face./", "obj_board_preshadowmantle_slash_Step_0_gml_94_0");
        msgnextloc("I can see in the dark^1, you know!/", "obj_board_preshadowmantle_slash_Step_0_gml_95_0");
        msgnextloc("The question is.../", "obj_board_preshadowmantle_slash_Step_0_gml_96_0");
        msgnextloc("Can you?/%", "obj_board_preshadowmantle_slash_Step_0_gml_97_0");
        bw_make();
        global.flag[1002] = 1;
        scr_tempsave();
        con = 2.5;
    }
    if (con == 2.5 && !bw_ex())
    {
        intro = instance_create(304, 176, obj_shadow_mantle_enemy_intro);
        var fadespeed = 10;
        scr_delay_var("darknessamt", 0.75, fadespeed * 0);
        scr_delay_var("darknessamt", 0.5, fadespeed * 1);
        scr_delay_var("darknessamt", 0.25, fadespeed * 2);
        scr_delay_var("darknessamt", 0, fadespeed * 3);
        with (obj_gameshow_swordroute)
        {
            scr_delay_var("screencolor", merge_color(#002DFF, c_black, 0.75), fadespeed * 0);
            scr_delay_var("screencolor", merge_color(#002DFF, c_black, 0.5), fadespeed * 1);
            scr_delay_var("screencolor", merge_color(#002DFF, c_black, 0.25), fadespeed * 2);
            scr_delay_var("screencolor", merge_color(#002DFF, c_black, 0), fadespeed * 3);
            global.swordscreencolor = #002DFF;
        }
        with (intro)
            scr_delay_var("laugh", 1, fadespeed * 5);
        snd_free_all();
        mus_volume(global.currentsong[1], 0, fadespeed * 1);
        scr_delay_var("con", 3, fadespeed * 13);
        con = -1;
    }
    if (con == 3 && !bw_ex())
    {
        snd_free_all();
        scr_board_instawarp(128, 64, kris.x, kris.y, "none", 118);
    }
}
if (scr_debug())
{
}
if (startmusic == 1)
{
    startmusic = 0;
    global.currentsong[0] = snd_init("nightmare_nes.ogg");
    global.currentsong[1] = mus_loop(global.currentsong[0]);
    mus_volume(global.currentsong[1], 0, 0);
    mus_volume(global.currentsong[1], 1, 30);
}
