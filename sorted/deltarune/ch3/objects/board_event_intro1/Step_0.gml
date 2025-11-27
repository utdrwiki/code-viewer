if (kris == 0)
    kris = 1185;
if (susie == 0)
{
    with (obj_caterpillarchara)
    {
        if (name == "susie")
            other.susie = id;
    }
}
if (ralsei == 0)
{
    with (obj_caterpillarchara)
    {
        if (name == "ralsei")
            other.ralsei = id;
    }
}
if (tenna == 0)
    tenna = obj_actor_tenna;
if (krboard == 0)
{
    with (obj_mainchara_board)
    {
        if (name == "kris")
            other.krboard = id;
    }
}
if (raboard == 0)
{
    with (obj_mainchara_board)
    {
        if (name == "ralsei")
            other.raboard = id;
    }
}
if (active)
{
    if (con == 0 && obj_board_camera.con == 0)
    {
        snd_free_all();
        timer = 0;
        con = 1;
    }
    if (con == 1)
    {
        timer++;
        if (timer == 1)
        {
            with (ralsei)
            {
                sprite_index = spr_ralsei_walk_right_unhappy;
                scr_resetgameshowcharacter_delay("ralsei", 80);
            }
            var ratalk = stringsetloc("Umm, can I finish reading the MANUAL?", "obj_board_event_intro1_slash_Step_0_gml_29_0");
            scr_couchtalk(ratalk, "ralsei", 2, 80);
        }
        if (timer == 60)
        {
            tenna.bounce = 1;
            var tetalk = stringsetloc("No! For your adventure awaits...", "obj_board_event_intro1_slash_Step_0_gml_35_0");
            scr_couchtalk(tetalk, "tenna", 2, 120);
        }
    }
    if (suwalk == 0 && obj_board_camera.con == 0)
    {
        suwalktimer++;
        if (suwalktimer == 1)
            raboard.follow = true;
        scr_pathfind_end("susie");
        if (suwalktimer >= 15)
        {
            suwalk = 1;
            scr_pathfind_to_point("susie", choose(5, 6), 7, 0);
            with (obj_mainchara_board)
            {
                if (name == "susie")
                    sleepy = true;
            }
        }
    }
}
else
{
    if (con != 0)
        con = 999;
    suwalk = 0;
    suwalktimer = 0;
}
