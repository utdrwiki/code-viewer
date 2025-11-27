scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
    if (con == 0 && obj_board_camera.con == 0)
    {
        var tetalk = stringsetloc("Wow! Haha! Enemy, watch out!", "obj_b3desert_slash_Step_0_gml_14_0");
        scr_couchtalk(tetalk, "tenna", 2, 80);
        con = 1;
    }
    if (obj_board_camera.con == 0)
        ralsei.follow = false;
    if (suwalk == 0 && obj_board_camera.con == 0 && !i_ex(obj_chaseenemy_board))
    {
        suwalktimer++;
        if (suwalktimer == 10)
        {
            if (susie.x < 250)
                scr_pathfind_to_point("susie", choose(6, 7), choose(1, 2), 0);
            else
                scr_pathfind_to_point("susie", 1, choose(3, 4), 0);
        }
        if (suwalktimer == 25)
        {
            var rand = irandom(3);
            var targx = 1;
            var targy = 1;
            switch (rand)
            {
                case 0:
                    targx = 2;
                    targy = 4;
                    break;
                case 1:
                    targx = 5;
                    targy = 4;
                    break;
                case 2:
                    targx = 9;
                    targy = 5;
                    break;
                case 3:
                    targx = 6;
                    targy = choose(4, 5);
                    break;
            }
            scr_pathfind_to_point("ralsei", targx, targy, 0);
            suwalk = 1;
        }
    }
}
else
{
    suwalktimer = 0;
    suwalk = 0;
}
