if (kris == 0)
{
    with (obj_mainchara_board)
        other.kris = id;
}
if (con == 0)
{
    obj_gameshow_swordroute.drawui = false;
    global.interact = 1;
    obj_mainchara_board.facing = 2;
    timer = 0;
    con = 1;
}
if (con == 1)
{
    timer++;
    if (timer == 1)
    {
        var steps = 8;
        var delay = 15;
        for (var i = 0; i < steps; i++)
        {
            with (obj_gameshow_swordroute)
                scr_delay_var("screencolor", merge_color(c_black, #E2FF81, i / steps), delay * (i - 1));
        }
    }
    if (timer == 60)
    {
        transition.active = true;
        timer = 0;
        con = 2;
    }
}
if (con == 2)
{
    if (transition.completed == true)
    {
        snd_free_all();
        scr_musicer("board_ocean.ogg");
        global.interact = 0;
        obj_mainchara_board.facing = 0;
        obj_gameshow_swordroute.drawui = true;
        obj_gameshow_swordroute.skip = false;
        con++;
    }
}
if (con == 10)
    scr_board_sword_repeat();
if (obj_board_controller.violence == false)
{
    if (kris.xp > 0)
        obj_board_controller.violence = true;
}
if (scon == 0)
{
    obj_board_controller.violence = false;
    if (kris.sword == true)
    {
        scon = 1;
        obj_board_controller.violence = true;
    }
}
if (scon == 1)
{
    if (kris.swordlv == 2)
    {
        scon = -1;
        scr_delay_var("scon", 1.9, 30);
        snd_volume(global.currentsong[1], 0, 30);
    }
}
if (scon == 1.9)
{
    snd_stop(global.currentsong[1]);
    mus_initloop("board_ocean.ogg");
    scon = 2;
}
