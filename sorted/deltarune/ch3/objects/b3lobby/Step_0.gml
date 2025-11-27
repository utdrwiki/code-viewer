scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
    if (con == 0 && obj_board_camera.con == 0)
    {
        global.currentsong[0] = snd_init("board_zelda.ogg");
        global.currentsong[1] = mus_loop_ext(global.currentsong[0], 1, 1);
        mus_volume(global.currentsong[1], 0, 0);
        mus_volume(global.currentsong[1], 1, 60);
        con = 1;
    }
    if (con == 1)
    {
        timer++;
        if (timer == 15)
        {
            tenna.bounce = true;
            var tetalk = stringsetloc("Finally!! Welcome to TV tower, our premier dungeon!", "obj_b3lobby_slash_Step_0_gml_23_0");
            scr_couchtalk(tetalk, "tenna", 2, 90);
        }
    }
    if (suwalk == 0 && obj_board_camera.con == 0)
    {
        suwalktimer++;
        if (suwalktimer == 1)
            ralsei.follow = true;
        if (suwalktimer == 10)
            scr_pathfind_to_point("susie", choose(7, 8), 5, 2);
    }
}
else
{
    suwalk = 0;
    suwalktimer = 0;
    if (con > 1)
        con = 999;
}
