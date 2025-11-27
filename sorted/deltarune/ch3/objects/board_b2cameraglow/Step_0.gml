if (active)
{
    var photocount = global.flag[1041] + global.flag[1042] + global.flag[1043] + global.flag[1227];
    if (obj_b2raftget.con != 0)
        photocount = 0;
    if (photocount >= 3)
    {
        depth = 999979;
        if (notify == 0 && obj_board_camera.con == 0)
        {
            var tetalk = stringsetloc("The SHRINE is ASHINE! What could it mean!?", "obj_board_b2cameraglow_slash_Step_0_gml_14_0");
            scr_couchtalk(tetalk, "tenna", 2, 180);
            with (obj_actor_tenna)
                bounce = 1;
            notify = 1;
        }
        timer++;
        image_index = abs(sin(timer / 15) * 4) - 1;
        image_index = clamp(image_index, 0, 3);
    }
    else
    {
        depth = 999999;
        image_index = 0;
    }
}
else
{
    timer = 0;
    image_index = 0;
}
