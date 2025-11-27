if (swordcon == 0)
{
    if (obj_mainchara_board.swordlv == 4)
    {
        mus_volume(global.currentsong[1], 0, 60);
        mus_play_ext("board_ocean.ogg", 1, 1);
        swordcon = 1;
    }
}
if (con == 0)
{
    obj_gameshow_swordroute.screencolor = c_black;
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
                scr_delay_var("screencolor", merge_color(c_black, #FFD864, i / steps), delay * (i - 1));
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
        global.currentsong[0] = snd_init("board_ocean.ogg");
        global.currentsong[1] = mus_loop_ext(global.currentsong[0], 1, 1);
        global.interact = 0;
        obj_mainchara_board.facing = 0;
        obj_gameshow_swordroute.drawui = true;
        obj_gameshow_swordroute.skip = false;
        safe_delete(transition);
        con++;
    }
}
if (con == 10)
    scr_board_sword_repeat();
