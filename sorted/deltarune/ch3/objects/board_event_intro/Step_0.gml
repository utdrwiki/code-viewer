if (krboard == 0)
{
    with (obj_mainchara_board)
    {
        if (name == "kris")
            other.krboard = id;
    }
}
if (realra == 0)
{
    with (obj_caterpillarchara)
    {
        if (name == "ralsei")
            other.realra = id;
    }
}
if (realsu == 0)
{
    with (obj_caterpillarchara)
    {
        if (name == "susie")
            other.realsu = id;
    }
}
if (tenna == 0)
    tenna = obj_actor_tenna;
if (active)
{
    if (con == 0)
    {
        timer++;
        if (timer == 1)
        {
            with (obj_mainchara_board)
            {
                if (name == "ralsei")
                    follow = 0;
            }
        }
        if (timer == 30)
            con = 21;
    }
    if (con == 21)
    {
        contimer++;
        if (contimer == 1)
        {
            global.interact = 0;
            tenna.bounce = 1;
            var tennacouchtalk = stringsetloc("Now begin! Our state of the art... Modern electronic video adventure!!!", "obj_board_event_intro_slash_Step_0_gml_29_0");
            scr_couchtalk(tennacouchtalk, "tenna", 2, 75);
            var ralseimove = "0U0U0U0U0U0U0U0U0U0U0U";
            scr_play_ralsei_recording(ralseimove);
            var sumove = "0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0L0L0L0L0L0L0L0L0L0L0W0W0W0W0W0W0W0W0W0W0W0W0L0L0L0L0L0L0L0L0L0L0L0L0W0W0W0W0W0W0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0W0W0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0W0W0W0W0W0W0W0W0W0W0D0D0W0W0W0W0W0W0W0W0W0W0W0W0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0W0W0W0W0W0W0W0W0W0W0W0W0W0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0D0D0D0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0R0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W";
            scr_play_susie_recording(sumove);
        }
        if (contimer == 60)
        {
            with (realsu)
            {
                sprite_index = spr_susie_walk_right_dw_unhappy;
                scr_resetgameshowcharacter_delay("susie", 120);
            }
            var susiecouchtalk = stringsetloc("Looks like crap.", "obj_board_event_intro_slash_Step_0_gml_46_0");
            scr_couchtalk(susiecouchtalk, "susie", 2, 120);
        }
        if (contimer == 105)
        {
            with (realra)
            {
                sprite_index = spr_ralsei_shocked_left;
                x -= 16;
                y -= 6;
                scr_shakeobj();
                scr_resetgameshowcharacter_delay("ralsei", 105);
            }
            var ralseicouchtalk = stringsetloc("SUSIE!", "obj_board_event_intro_slash_Step_0_gml_60_0");
            scr_couchtalk(ralseicouchtalk, "ralsei", 2, 105);
        }
        if (contimer == 135)
        {
            tenna.bounce = 1;
            var tennacouchtalk = stringsetloc("It's cutting edge!!!", "obj_board_event_intro_slash_Step_0_gml_67_0");
            scr_couchtalk(tennacouchtalk, "tenna", 2, 80);
            con = 21;
        }
    }
    if (makeitemsvis == 1)
    {
        makeitemsvis = 2;
        obj_ch3_gameshow.kr_healthbar.visible = true;
        obj_ch3_gameshow.su_healthbar.visible = true;
        obj_ch3_gameshow.ra_healthbar.visible = true;
        obj_ch3_gameshow.scoreboard.visible = true;
        obj_ch3_gameshow.inventory.visible = true;
    }
    if (suwalk == 0 && obj_board_camera.con == 0)
    {
        suwalktimer++;
        if (suwalktimer == 9)
        {
            scr_pathfind_to_point("susie", choose(4, 5, 6, 7), choose(2, 3, 4, 5), 0);
            suwalk = 1;
        }
    }
}
else
{
    con = 999;
    suwalk = 0;
    suwalktimer = 0;
}
if (global.flag[20] == 1)
    aww_track = true;
if (aww_track)
{
    aww_track_timer++;
    if (aww_track_timer == 1)
        snd_play(snd_audience_aww);
    if (aww_track_timer >= 30 && !d_ex())
    {
        aww_track = false;
        aww_track_timer = 0;
        global.flag[20] = 0;
    }
}
