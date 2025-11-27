scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
    if (blocker == 0)
    {
        blocker = instance_create(x, y, obj_board_solid);
        with (blocker)
        {
            setxy_board(4512, 832);
            image_xscale = 2;
        }
        blocker = 1;
    }
    if (con == 0 && obj_board_camera.con == 0)
    {
        mus_volume(global.currentsong[1], 0, 60);
        with (obj_actor_tenna)
            bounce = 1;
        var tetalk = stringsetloc("This is it! Your final test!", "obj_b1_finalehalls_slash_Step_0_gml_27_0");
        scr_couchtalk(tetalk, "tenna", 2, 120);
        con++;
    }
    if (con == 1)
    {
        timer++;
        if (timer == 5)
            scr_pathfind_to_point("susie", 6, 0, 0);
        if (timer == 15)
            scr_pathfind_to_point("ralsei", 5, 0, 0);
    }
}
else
{
}
