scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
    if (con == 0 && obj_board_camera.con == 0)
    {
        timer++;
        if (timer == 1)
        {
            tenna.bounce = 1;
            var tetalk = stringsetloc("And there's the DOOR, folks! They're at the ROOF!!", "obj_b3belevatorexit_slash_Step_0_gml_18_0");
            scr_couchtalk(tetalk, "tenna", 2, 70);
        }
        if (timer == 35)
            scr_pathfind_to_point("kris", 5, 7, 0);
        if (timer == 60)
        {
            scr_pathfind_to_point("ralsei", 5, 7, 0);
            con++;
            timer = 0;
        }
    }
    if (scr_board_checklocation("kris", board_tilex(5), board_tiley(7), 4))
    {
        timer++;
        if (timer == 2)
        {
            with (obj_mainchara_board)
                controlled = 0;
            kris.controlled = 1;
            global.interact = 1;
            obj_board_camera.shift = "down";
        }
    }
}
else
{
}
