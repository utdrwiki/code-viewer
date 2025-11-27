tenna = obj_actor_tenna;
active = false;
with (obj_board_trigger)
{
    if (extflag == "b2iceregion_watcher")
    {
        if (active == true)
            other.active = true;
    }
}
if (active == true)
{
    scr_board_populatevars();
    scr_gameshow_populatevars();
    if (con == 0 && obj_board_camera.con == 0)
    {
        var trig = 0;
        with (kris)
            trig = instance_place(x, y, obj_board_trigger);
        if (i_ex(trig))
        {
            if (trig.extflag == "b2iceregiontrigger")
                con = 1;
        }
    }
}
if (ralseiworried == 0 && obj_board_camera.con == 0 && global.flag[1022] == 1)
{
    with (obj_board_trigger)
    {
        if (extflag == "b2iceregion_ralworrypart1" && active)
        {
            var sutalk = stringsetloc("That's weird. There's something up here.", "obj_b2iceregion_slash_Step_0_gml_38_0");
            scr_couchtalk(sutalk, "susie", 2, 120);
            var ratalk = stringsetloc("...", "obj_b2iceregion_slash_Step_0_gml_41_0");
            scr_script_delayed(scr_couchtalk, 60, ratalk, "ralsei", 2, 60);
            other.ralseiworried = 2;
        }
    }
}
if (ralseiworried == 2)
{
    var _trig = 0;
    with (obj_board_trigger)
    {
        if (extflag == "b2iceregion_ralworrypart2" && active)
            _trig = 1;
    }
    if (_trig == 1)
    {
        ralseiworried = 3;
        ralworrytimer = 0;
    }
}
if (tennawarn1 == 0 && obj_board_camera.con == 0)
{
    var trig = 0;
    with (obj_board_trigger)
    {
        if (active && extflag == "b2iceregion_tennawarning1")
            trig = true;
    }
    if (trig)
    {
        tennawarn1 = 1;
        with (obj_actor_tenna)
            bounce = 1;
        var tetalk = stringsetloc("Sorry, nothing up this way, folks!", "obj_b2iceregion_slash_Step_0_gml_159_0");
        if (global.flag[1022] == 0)
            scr_couchtalk(tetalk, "tenna", 1, 90);
    }
}
if (tennawarn2 == 0 && obj_board_camera.con == 0)
{
    var trig = 0;
    with (obj_board_trigger)
    {
        if (active && extflag == "b2iceregion_tennawarning2")
            trig = true;
    }
    if (trig)
    {
        tennawarn2 = 1;
        with (obj_actor_tenna)
            bounce = 1;
        var tetalk = stringsetloc("See, it just loops!", "obj_b2iceregion_slash_Step_0_gml_175_0");
        if (global.flag[1022] == 0)
            scr_couchtalk(tetalk, "tenna", 1, 90);
    }
}
if (tennawarn3 == 0 && obj_board_camera.con == 0)
{
    var trig = 0;
    with (obj_board_trigger)
    {
        if (active && extflag == "b2iceregion_tennawarning3")
            trig = true;
    }
    if (trig)
    {
        tennawarn3 = 1;
        with (obj_actor_tenna)
            bounce = 1;
        var tetalk = stringsetloc("This part's unfinished! Go back!", "obj_b2iceregion_slash_Step_0_gml_121_0");
        if (global.flag[1022] == 0)
            scr_couchtalk(tetalk, "tenna", 1, 90);
    }
}
if (tennawarn4 == 0 && obj_board_camera.con == 0)
{
    var trig = 0;
    with (obj_board_trigger)
    {
        if (active && extflag == "b2iceregion_tennawarning4")
            trig = true;
    }
    if (trig)
    {
        tennawarn4 = 1;
        with (obj_actor_tenna)
            bounce = 1;
        var tetalk = stringsetloc("Unfinished! UNFINISHED, I said!", "obj_b2iceregion_slash_Step_0_gml_141_0");
        if (global.flag[1022] == 0)
            scr_couchtalk(tetalk, "tenna", 1, 90);
    }
}
if (con == 1 && active == true && global.flag[1022] == 0)
{
    with (obj_board_boat)
    {
        if (engaged)
            snd_pause(oceansong);
    }
    global.interact = 1;
    tenna.bounce = 1;
    scr_shakeobj_ext(tenna, 4, 10);
    with (obj_caterpillarchara)
    {
        if (name == "susie")
            sprite_index = spr_susie_walk_right_dw_unhappy;
        if (name == "ralsei")
            sprite_index = spr_ralsei_walk_right_unhappy;
    }
    with (obj_mainchara)
        sprite_index = spr_krisr_dark;
    var tetalk = stringsetloc("MIKE, CUT! CUT!!!", "obj_b2iceregion_slash_Step_0_gml_96_0");
    scr_couchtalk(tetalk, "tenna", 1, 60);
    scr_shakeobj(tenna, 10);
    con = 0.1;
    timer = 0;
}
if (con == 0.1)
{
    timer++;
    if (timer == 45)
    {
        timer = 0;
        con = 2;
    }
}
if (con == 2)
{
    global.interact = 1;
    timer++;
    if (timer == 1)
    {
        loopsnd = snd_loop(snd_tenna_beep_loop);
        snd_pitch(loopsnd, 1.2);
        instance_create_depth(x, y, -999, obj_technicaldifficultyBars);
    }
    if (timer == 2)
    {
        scr_board_instawarp(1280, 3648, 1344, 3872);
        with (obj_board_cautiontape)
        {
            inplace = 1;
            set = 0;
        }
    }
    if (timer == 3)
    {
        with (obj_board_boat)
        {
            if (engaged)
                setxy_board(1344, 3840);
        }
    }
    if (timer == 120)
    {
        snd_stop(snd_tenna_beep_loop);
        with (obj_technicaldifficultyBars)
            instance_destroy();
        with (obj_board_boat)
        {
            if (engaged)
                snd_resume(oceansong);
        }
        var tetalk = stringsetloc("Phew! Sorry folks, our contestants got a little lost!", "obj_b2iceregion_slash_Step_0_gml_132_0");
        scr_couchtalk(tetalk, "tenna", 1, 120);
        tenna.bounce = 1;
        global.interact = 0;
        con = 10;
    }
}
