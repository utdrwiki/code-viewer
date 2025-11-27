scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
    if (con == 0 && obj_board_camera.con == 0)
    {
        timer++;
        if (timer == 15)
        {
            tenna.bounce = true;
            var tetalk = stringsetloc("All you have to do is get to the top floor...", "obj_b3elevator_slash_Step_0_gml_18_0");
            scr_couchtalk(tetalk, "tenna", 2, 80);
            con = 1;
        }
    }
    if (suwalk == 0 && obj_board_camera.con == 0)
    {
        suwalktimer++;
        if (suwalktimer == 1)
            ralsei.follow = true;
        if (suwalktimer == 10)
            scr_pathfind_to_point("susie", 7, 4, 2);
    }
}
else
{
    suwalk = 0;
    suwalktimer = 0;
    if (con > 1)
        con = 999;
}
if (delbanister == 1)
{
    delbanister = 2;
    with (banister)
    {
        instance_create(x, y, obj_board_smokepuff);
        instance_create(x, y + 32, obj_board_smokepuff);
        snd_play(snd_board_splash);
    }
    safe_delete(banister);
}
