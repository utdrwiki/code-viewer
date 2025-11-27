scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
    if (con == 0 && !init)
    {
        scr_resetgameshowcharacter("all");
        kris.visible = 0;
        susie.visible = 0;
        ralsei.visible = 0;
        kris.canfreemove = 0;
        ralsei.follow = 0;
        ralsei.x = kris.x - 32;
        susie.x = kris.x + 32;
        init = 1;
    }
    if (con == 0 && obj_board_camera.con == 0 && !i_ex(obj_board_transition))
    {
        con = 1;
        suwalk = 1;
    }
    if (con == 1)
    {
        var startsnd = 492;
        var endsnd = 493;
        var timespread = 15;
        timer++;
        if (timer == (1 + (timespread * 0)))
        {
            star1 = instance_create(320, 192, obj_board_startransition);
            star1.image_index = 0;
            star1.targx = kris.x;
            star1.targy = kris.y;
            with (kris)
                scr_delay_var("visible", true, other.star1.transitiontime);
            snd_play_delay(endsnd, star1.transitiontime);
            snd_stop(startsnd);
            snd_play(startsnd);
        }
        if (timer == (1 + (timespread * 1)))
        {
            star1 = instance_create(320, 192, obj_board_startransition);
            star1.image_index = 1;
            star1.targx = susie.x;
            star1.targy = susie.y;
            snd_stop(startsnd);
            snd_play(startsnd);
            with (susie)
                scr_delay_var("visible", true, other.star1.transitiontime);
            snd_play_delay(endsnd, star1.transitiontime);
            firstvisitcon = -1;
        }
        if (timer == (1 + (timespread * 2)))
        {
            snd_free_all();
            star1 = instance_create(320, 192, obj_board_startransition);
            star1.image_index = 2;
            star1.targx = ralsei.x;
            star1.targy = ralsei.y;
            snd_stop(startsnd);
            snd_play(startsnd);
            with (ralsei)
                scr_delay_var("visible", true, other.star1.transitiontime);
            snd_play_delay(endsnd, star1.transitiontime);
            timer = 0;
            con = 2;
        }
    }
    if (con == 2 && !i_ex(obj_board_startransition))
    {
        ralsei.follow = true;
        scr_board_caterpillar_interpolate_ralsei();
        with (ralsei)
        {
            for (i = 0; i < 10; i += 1)
                facingdir[i] = 1;
            facingdir[10] = 0;
        }
        suwalk = 0;
        with (obj_mainchara_board)
            canfreemove = true;
        ralsei.follow = true;
        mus_initloop(obj_ch3_gameshow.boardmusic);
        con = 3;
        timer = 0;
    }
    if (suwalk == 0 && obj_board_camera.con == 0)
    {
        suwalktimer++;
        if (suwalktimer == 1)
            ralsei.follow = true;
        if (suwalktimer == 15)
        {
            scr_pathfind_to_point("susie", choose(4, 5, 6, 7), choose(5, 6), 0);
            suwalk = 1;
        }
    }
}
else
{
    suwalk = 0;
    suwalktimer = 0;
}
if (con == 3)
{
    timer++;
    if (timer == 1)
    {
        tenna.bounce = 1;
        var tetalk = stringsetloc("Welcome to TV-tropolis!!!", "obj_b3intro_slash_Step_0_gml_140_0");
        scr_couchtalk(tetalk, "tenna", 2, 60);
    }
    if (timer == 60)
    {
        su_real.sprite_index = spr_susie_walk_right_dw_unhappy;
        var sutalk = stringsetloc("Alright, let's just get this over with.", "obj_b3intro_slash_Step_0_gml_146_0");
        scr_couchtalk(sutalk, "susie", 2, 60);
    }
    if (timer == 120)
    {
        su_real.sprite_index = su_real.usprite;
        timer = 0;
        con = 4;
    }
}
if (qcounttalk == 0)
{
    if (obj_board_inventory.qcount == 2)
        qcounttalk = 1;
}
if (qcounttalk == 1 && !i_ex(obj_quizsequence) && !bw_ex())
{
    qtime++;
    if (qtime == 15)
    {
        tenna.bounce = 1;
        var tetalk = stringsetloc("Both Q's! Head for TV tower!!!", "obj_b3intro_slash_Step_0_gml_177_0");
        scr_couchtalk(tetalk, "tenna", 2, 80);
        qcounttalk++;
    }
}
