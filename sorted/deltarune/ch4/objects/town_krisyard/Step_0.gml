if (global.chapter == 4)
{
    if (con == -1)
    {
        if (obj_mainchara.y < 290)
            con = 0;
    }
    if (con == 0 && !d_ex() && global.interact == 0)
    {
        con = 1;
        alarm[0] = 1;
        global.interact = 1;
        blackall = scr_dark_marker(-10, -10, spr_pixel_white);
        blackall.image_xscale = 999;
        blackall.image_yscale = 999;
        blackall.depth = 100;
        blackall.image_blend = c_black;
        blackall.image_alpha = 0;
        susie_marker = scr_marker(156, 250, spr_susie_walk_up_lw);
        susie_marker.visible = 0;
    }
    if (con == 2)
    {
        con = 5;
        alarm[0] = 1;
        cutscene_master = scr_cutscene_make();
        scr_maincharacters_actors();
        global.facing = 0;
        c_pannable(1);
        c_pan(camerax(), 80, 30);
        c_sel(kr);
        c_walkdirect(152, 230, 30);
        c_delayfacing(31, "u");
        c_sel(su);
        c_walkdirect_wait(195, 210, 25);
        c_facing("u");
        c_wait(15);
        c_msgside("top");
        c_speaker("susie");
        c_msgsetloc(0, "\\EZ* Kris^1! Tenna's getting wet^1! Wait here^1, I'll bring him to school!/%", "obj_town_krisyard_slash_Step_0_gml_61_0");
        c_talk_wait();
        c_var_lerp_instance(blackall, "image_alpha", 0, 1, 15);
        c_wait(15);
        c_sound_play(snd_escaped);
        c_var_instance(tv_marker, "visible", 0);
        c_sel(kr);
        c_facing("d");
        c_sel(su);
        c_setxy(156, 320);
        c_walkdirect(156, 250, 25);
        c_delayfacing(26, "u");
        c_wait(15);
        c_var_lerp_instance(blackall, "image_alpha", 1, 0, 15);
        c_wait(30);
        c_speaker("susie");
        c_msgsetloc(0, "\\EZ* Jeez^1, he was sneezing and shivering.../", "obj_town_krisyard_slash_Step_0_gml_85_0");
        c_msgnextloc("\\EA* Lancer put him on the tanning bed^1, though. Should be cool./%", "obj_town_krisyard_slash_Step_0_gml_86_0");
        c_talk_wait();
        c_wait(5);
        c_panobj(kr_actor, 15);
        c_wait(16);
        c_pannable(0);
        c_var_instance(susie_marker, "visible", 1);
        c_actortokris();
        c_actortocaterpillar();
        c_terminatekillactors();
    }
    if (con == 6 && !i_ex(obj_cutscene_master))
    {
        con = 99;
        global.interact = 0;
        global.facing = 0;
        with (tv_marker)
            instance_destroy();
        with (blackall)
            instance_destroy();
        with (susie_marker)
            instance_destroy();
        scr_flag_set(780, 1);
    }
}
