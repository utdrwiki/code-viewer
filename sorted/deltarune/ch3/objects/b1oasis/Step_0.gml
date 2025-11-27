if (init == 0)
    init = 1;
if (kr == 0)
{
    with (obj_mainchara_board)
    {
        if (name == "kris")
            other.kr = id;
    }
}
if (su == 0)
{
    with (obj_mainchara_board)
    {
        if (name == "susie")
            other.su = id;
    }
}
if (realsusie == 0)
{
    with (obj_caterpillarchara)
    {
        if (name == "susie")
            other.realsusie = id;
    }
}
if (realralsei == 0)
{
    with (obj_caterpillarchara)
    {
        if (name == "ralsei")
            other.realralsei = id;
    }
}
if (tenna == 0)
{
    with (obj_actor_tenna)
        other.tenna = id;
}
if (active == 1 && init == 1 && obj_board_camera.con == 0)
{
    con = 4;
    if (susiewalkcon == 0 && obj_board_camera.con == 0)
    {
        scr_pathfind_end("susie");
        sustimer = 0;
        var findpoint = 0;
        with (obj_board_pointsGet)
        {
            if (x > 128 && x < 528 && y > 64 && y < 318)
                findpoint = id;
        }
        if (findpoint == 0)
        {
            susiewalkcon = 3;
            sustimer = 0;
        }
        else
        {
            scr_pathfind_to_point("susie", findpoint.x, findpoint.y, 0);
            susiewalkcon = 1;
        }
    }
    if (susiewalkcon == 1)
    {
        with (su)
        {
            if (is_moving == false && is_moving_timer == 0)
                other.susiewalkcon = 0;
        }
    }
    if (susiewalkcon == 3)
    {
        sustimer++;
        if (sustimer == 15)
        {
            scr_pathfind_to_point("susie", choose(4, 7), 3, 0);
            susiewalkcon = 5;
            su.sleepy = true;
        }
    }
    if (talkcon == 10 && !bw_ex())
    {
        var tetalk = stringsetloc("GREAT performance, Elnina!", "obj_b1oasis_slash_Step_0_gml_68_0");
        if (talker == "lanino1")
            tetalk = stringsetloc("GREAT performance, Lanino!", "obj_b1oasis_slash_Step_0_gml_69_0");
        with (obj_actor_tenna)
            bounce = 1;
        scr_couchtalk(tetalk, "tenna", 2, 90);
        talkcon = 11;
    }
}
else
{
    timer = 0;
    susiewalkcon = 0;
    talkcon = 0;
}
if (talkcon == 11)
{
    talktimer++;
    if (talktimer == 40)
    {
        with (obj_board_npc)
        {
            if (extflag == other.talker)
            {
                var memspeed = image_speed;
                image_speed = 0.125;
                sprite_index = pose;
                scr_delay_var("sprite_index", idle, 120);
            }
        }
    }
}
