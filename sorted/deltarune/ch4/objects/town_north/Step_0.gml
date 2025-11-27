if (global.chapter == 4)
{
    if (con == 0 && !d_ex() && global.interact == 0)
    {
        con = 1;
        global.interact = 1;
        blackall = scr_dark_marker(-10, -10, spr_pixel_white);
        blackall.image_xscale = 999;
        blackall.image_yscale = 999;
        blackall.depth = 100;
        blackall.image_blend = c_black;
        blackall.image_alpha = 0;
        tv_marker = scr_marker(1095, 85, spr_tv_broken_no_stand);
        with (tv_marker)
            scr_depth();
        tv_marker.visible = 0;
        cutscene_master = scr_cutscene_make();
        scr_maincharacters_actors();
    }
    if (con == 1)
    {
        con = 5;
        alarm[0] = 1;
        global.facing = 0;
        c_sel(su);
        c_facing("u");
        c_speaker("no_name");
        c_msgsetloc(0, "* ..^1. what? You want to give me your TV?/", "obj_town_north_slash_Step_0_gml_40_0");
        c_msgnextloc("* I..^1. don't understand. Is there some kind of catch?/", "obj_town_north_slash_Step_0_gml_41_0");
        c_facenext("susie", 20);
        c_msgnextloc("\\EK* Uhh^1, it's scuffed^1, old^1, and the colors are kinda messed up.../", "obj_town_north_slash_Step_0_gml_43_0");
        c_msgnextloc("\\EN* But^1, it's^1, uhh..^1. really good. It's a really good TV./", "obj_town_north_slash_Step_0_gml_44_0");
        c_facenext("no_name", 0);
        c_msgnextloc("* ..^1. I see. Could you bring it on by?/", "obj_town_north_slash_Step_0_gml_46_0");
        c_facenext("susie", 6);
        c_msgnextloc("\\E6* Uhh^1, yeah^1! Of course^1! Wait a sec!/%", "obj_town_north_slash_Step_0_gml_48_0");
        c_talk_wait();
        c_var_lerp_instance(blackall, "image_alpha", 0, 1, 15);
        c_wait(15);
        c_sound_play(snd_escaped);
        c_var_instance(tv_marker, "visible", 1);
        c_sel(kr);
        c_setxy(1117, 110);
        c_sel(su);
        c_setxy(1083, 103);
        c_wait(15);
        c_var_lerp_instance(blackall, "image_alpha", 1, 0, 15);
        c_wait(30);
        c_speaker("no_name");
        c_msgsetloc(0, "* Oh my^1, it's a handsome little thing^1, isn't it. What's the brand?/", "obj_town_north_slash_Step_0_gml_69_0");
        c_facenext("susie", "N");
        c_msgnextloc("\\EN* Uh^1, I dunno^1, but his name's Tenna./", "obj_town_north_slash_Step_0_gml_71_0");
        c_facenext("no_name", 0);
        c_msgnextloc("* ..^1. your TV has a name?/", "obj_town_north_slash_Step_0_gml_73_0");
        c_facenext("susie", 20);
        c_msgnextloc("\\EK* No. I mean^1, uhh^1, yeah. But just like^1, a nickname./", "obj_town_north_slash_Step_0_gml_75_0");
        c_facenext("no_name", 0);
        c_msgnextloc("* Like \"antenna?\" How cute..^1. I'll take it./", "obj_town_north_slash_Step_0_gml_77_0");
        c_facenext("susie", 7);
        c_msgnextloc("\\E7* Really?^1! Hell yeah^1, Kris^1! We found him a home!/", "obj_town_north_slash_Step_0_gml_79_0");
        c_facenext("no_name", 0);
        c_msgnextloc("* Hahaha^1! Oh my^1, you two really love this TV^1, don't you. Well^1, don't worry.../", "obj_town_north_slash_Step_0_gml_81_0");
        c_msgnextloc("* I have the strange feeling \"Mr. Tenna\" and I are going to get along..^1. famously./", "obj_town_north_slash_Step_0_gml_82_0");
        c_facenext("susie", 20);
        c_msgnextloc("\\EK* Cool^1, well^1, I'm putting it in your house now./%", "obj_town_north_slash_Step_0_gml_84_0");
        c_talk();
        c_wait_box(10);
        c_sel(su);
        c_sprite(spr_susie_guts_pose);
        c_wait_box(12);
        c_sel(su);
        c_facing("u");
        c_wait_talk();
        c_var_lerp_instance(blackall, "image_alpha", 0, 1, 15);
        c_wait(25);
        c_sound_play(snd_noise);
        c_var_instance(tv_marker, "visible", 0);
        c_wait(15);
        c_var_lerp_instance(blackall, "image_alpha", 1, 0, 15);
        c_wait(15);
        c_pannable(1);
        c_panobj(kr_actor, 15);
        c_wait(15);
        c_pannable(0);
        c_actortokris();
        c_actortocaterpillar();
        c_terminatekillactors();
    }
    if (con == 6 && !i_ex(obj_cutscene_master))
    {
        global.interact = 0;
        global.facing = 0;
        con = 99;
    }
}
