if (init == 0)
{
    kris = instance_find(obj_mainchara, 0);
    with (obj_caterpillarchara)
    {
        if (name == "susie")
            other.susie = id;
        if (name == "ralsei")
            other.ralsei = id;
    }
    tenna = instance_find(obj_actor_tenna, 0);
    init = 1;
}
if (init == 1)
{
    if (con == 0)
    {
        with (obj_mainchara_board)
            visible = false;
        kris.fun = 0;
        ralsei.fun = 0;
        susie.fun = 0;
        with (kris)
            setxy(620, 340);
        with (ralsei)
            setxy(680, 344);
        with (susie)
            setxy(740, 340);
        with (tenna)
            setxy(450, 334);
        tenna.preset = 8;
        tenna.sprite_index = spr_tenna_armsup_annoyed;
        global.facing = 3;
        debug_message("tennadepth=" + string(tenna.depth));
        tenna.auto_depth = 1;
        con = 1;
    }
    if (con == 1)
    {
        con = 2;
        cutscene_master = scr_cutscene_make();
        scr_maincharacters_actors();
        c_sel(kr);
        c_walk("l", 6, 44);
        c_sel(ra);
        c_walk("l", 6, 44);
        c_sel(su);
        c_walk("l", 6, 44);
        c_wait(45);
        c_sel(kr);
        c_facing("u");
        c_sel(ra);
        c_facing("u");
        c_sel(su);
        c_facing("u");
        c_speaker("tenna");
        c_msgsetloc(0, "* Alright^1, controllers all clean!?/", "obj_b3bintrocutscene_swordroutever_slash_Step_0_gml_60_0");
        c_msgnextloc("* Everyone back to the couch^1, let's finish up Board 3!/%", "obj_b3bintrocutscene_swordroutever_slash_Step_0_gml_61_0");
        c_talk();
        c_wait_box(0);
        c_tenna_preset(12);
        c_talk();
        c_wait_box(1);
        c_wait_talk();
        c_tenna_preset(12);
        c_tenna_preset(4);
        c_wait(1);
        c_sel(kr);
        c_walkdirect(248, 400, 24);
        c_sel(ra);
        c_walkdirect(342, 396, 30);
        c_sel(su);
        c_walkdirect(288, 282, 40);
        c_wait(24);
        c_sel(kr);
        c_facing("u");
        c_sndplay(snd_noise);
        c_wait(6);
        c_sel(ra);
        c_facing("u");
        c_sndplay(snd_noise);
        c_wait(10);
        c_sel(su);
        c_facing("u");
        c_wait(4);
        c_sprite(spr_susieu_dark_benddown);
        c_wait(7);
        c_shakeobj();
        c_sndplay(snd_noise);
        c_var_instance(id, "plugin", 1);
        c_wait(10);
        c_facing("u");
        c_wait(3);
        c_walkdirect(140, 392, 40);
        c_wait(41);
        c_facing("u");
        c_sndplay(snd_noise);
        c_var_instance(id, "con", 3);
    }
}
if (con == 3 && !i_ex(obj_cutscene_master))
{
    timer++;
    if (timer == 5)
    {
        with (tenna)
        {
            sprite_index = spr_tenna_attack;
            image_speed = 0;
            image_index = 0;
            scr_jump_to_point(484, 576, 40, 20);
            auto_depth = false;
            depth = 95180;
        }
        snd_play(snd_jump);
    }
    if (timer == 26)
    {
        snd_play(snd_noise);
        tenna.preset = 0;
        tenna.sprite_index = spr_tenna_faceaway;
        tenna.bounce = 1;
    }
    if (timer == 55)
    {
        var tetalk = stringsetloc("Mike, turn on the power.", "obj_b3bintrocutscene_swordroutever_slash_Step_0_gml_145_0");
        tenna.bounce = 1;
        scr_couchtalk(tetalk, "tenna", 2, 70);
    }
    if (timer == 115)
    {
        with (obj_couchwriter)
            instance_destroy();
        with (instance_create(0, 0, obj_swordroute_consolestarter))
        {
            timer = 0;
            standalone = 1;
            con = 10;
        }
    }
    if (timer == 290)
    {
        tenna.bounce = 1;
        var tetalk = stringsetloc("Haha, that's strange! Usually it goes right on!", "obj_b3bintrocutscene_swordroutever_slash_Step_0_gml_162_0");
        scr_couchtalk(tetalk, "tenna", 2, 90);
    }
    if (timer == 380)
    {
        con = 3.1;
        timer = 0;
    }
}
if (con == 3.1)
{
    timer++;
    if (timer == 1)
    {
        tenna.bounce = 1;
        var tetalk = stringsetloc("Mike, can we, uh, haha, try that again?", "obj_b3bintrocutscene_swordroutever_slash_Step_0_gml_168_0");
        scr_couchtalk(tetalk, "tenna", 2, 70);
    }
    if (timer == 70)
    {
        with (obj_swordroute_consolestarter)
            instance_destroy();
        with (instance_create(0, 0, obj_swordroute_consolestarter))
        {
            timer = 0;
            standalone = 1;
            con = 10;
        }
    }
    if (timer == 190)
    {
        with (obj_swordroute_consolestarter)
            instance_destroy();
        screenfade = 1;
    }
    if (timer == 310)
    {
        timer = 0;
        con = 4;
    }
}
if (con == 4)
{
    timer++;
    if (timer == 90)
    {
        tenna.bounce = 1;
        var tetalk = stringsetloc("That's funny.", "obj_b3bintrocutscene_swordroutever_slash_Step_0_gml_180_0");
        scr_couchtalk(tetalk, "tenna", 2, 100);
    }
    if (timer == 230)
    {
        tenna.bounce = 1;
        var tetalk = stringsetloc("No one's there.", "obj_b3bintrocutscene_swordroutever_slash_Step_0_gml_186_0");
        scr_couchtalk(tetalk, "tenna", 2, 100);
    }
    if (timer == 370)
    {
        tenna.bounce = 1;
        var tetalk = stringsetloc("The characters... they're gone.", "obj_b3bintrocutscene_swordroutever_slash_Step_0_gml_192_0");
        scr_couchtalk(tetalk, "tenna", 2, 100);
    }
    if (timer == 510)
        elpipsis = 1;
    if (timer == 650)
    {
        with (obj_actor)
        {
            if (name == "ralsei")
                sprite_index = spr_ralsei_walk_right_unhappy;
        }
        var ratalk = stringsetloc("Umm...", "obj_b3bintrocutscene_swordroutever_slash_Step_0_gml_205_0");
        scr_couchtalk(ratalk, "ralsei", 2, 120);
    }
    if (timer == 680)
    {
        con++;
        timer = 0;
    }
}
if (con == 5)
{
    timer++;
    if (timer == 60)
    {
        with (instance_create(x, y, obj_ch3_screen_wipe))
        {
            depth = -999;
            target_room = room_ch3_gameshowroom;
            transition_time = 40;
            transition_pause = 11;
            start = true;
            persistent = true;
        }
        global.plot = 225;
        scr_flag_set(1050, 1);
        if (!scr_havechar(2))
            scr_getchar(2);
        if (!scr_havechar(3))
            scr_getchar(3);
    }
}
if (plugin == 1)
{
    with (obj_ch3_gameshow)
    {
        wires.sprite_index = spr_controllerwires_skr;
        wires.image_alpha = 1;
    }
    with (obj_mainchara_board)
    {
        visible = false;
        global.interact = 0;
        controlled = false;
        follow = false;
        if (name == "kris")
        {
            controlled = true;
            canfreemove = false;
        }
    }
    plugin = 2;
}
if (screenfade == 1)
{
    for (var i = 0; i < 9; i++)
    {
        with (blackover)
            scr_delay_var("y", y + (i * 32), i * 15);
    }
    screenfade = 2;
}
if (elpipsis == 1)
{
    elpipsis = 0;
    var elipsis = stringsetloc("...", "obj_b3bintrocutscene_swordroutever_slash_Step_0_gml_212_0");
    with (instance_create(x, y, obj_couchwriter))
    {
        x = 474 + camerax();
        y = 262 + cameray();
        mystring = elipsis;
        mycolor = c_yellow;
        mysnd = 14;
        specialtalk = 0;
        drawtime = 60;
        if (talklength == 6)
            talklength = 12;
    }
}
