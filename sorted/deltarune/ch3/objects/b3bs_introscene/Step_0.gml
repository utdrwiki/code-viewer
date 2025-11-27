if (con == 1)
{
    con = 99;
    global.interact = 1;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    c_sel(kr);
    c_setxy(302, 430);
    c_facing("u");
    c_sel(su);
    c_setxy(252, 264);
    c_facing("r");
    c_sel(ra);
    c_setxy(346, 270);
    c_facing("l");
    c_sel(kr);
    c_walk_wait("u", 4, 26);
    c_sel(su);
    c_facing("d");
    c_sel(ra);
    c_facing("d");
    c_wait(4);
    c_speaker("susie");
    c_msgsetloc(0, "* Heh^1, look who it is. Ralsei wanted to wait for you^1, so.../", "obj_b3bs_introscene_slash_Step_0_gml_37_0");
    c_facenext("ralsei", 0);
    c_msgnextloc("* And Susie said \"Watch. Kris'll show up any minute now^1,\" so.../", "obj_b3bs_introscene_slash_Step_0_gml_39_0");
    c_facenext("susie", 0);
    c_msgnextloc("* And I say \"shut up^1,\" so let's go!/%", "obj_b3bs_introscene_slash_Step_0_gml_41_0");
    c_talk();
    c_wait_box(2);
    c_sel(su);
    c_sprite(spr_susie_walk_down_dw_unhappy);
    c_sel(ra);
    c_sprite(spr_ralsei_laugh);
    c_addxy(0, 6);
    c_animate(0, 8, 0.15);
    c_wait_box(4);
    c_sel(ra);
    c_addxy(0, -4);
    c_facing("l");
    c_sel(su);
    c_sprite(spr_susie_walk_right_dw_unhappy);
    c_wait_talk();
    c_sel(su);
    c_walkdirect(298, 264, 8);
    c_sel(ra);
    c_walkdirect(300, 250, 8);
    c_wait(9);
    c_sel(kr);
    c_facing("d");
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 99 && !i_ex(cutscene_master))
{
    if (!snd_is_playing(global.currentsong[1]))
    {
        global.currentsong[0] = snd_init("stealth.ogg");
        global.currentsong[1] = mus_loop(global.currentsong[0]);
    }
    instance_create(140, 240, obj_savepoint);
    global.interact = 0;
    instance_destroy();
}
