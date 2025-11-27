scr_board_populatevars();
if (tenna == 0)
{
    with (obj_actor_tenna)
        other.tenna = id;
}
if (susiereal == 0)
{
    with (obj_caterpillarchara)
    {
        if (name == "susie")
            other.susiereal = id;
    }
}
if (ralseireal == 0)
{
    with (obj_caterpillarchara)
    {
        if (name == "ralsei")
            other.ralseireal = id;
    }
}
if (krisreal == 0)
{
    with (obj_mainchara)
        other.krisreal = id;
}
if (active == 1)
{
    if (con == 0 && obj_board_camera.con == 0)
    {
        timer++;
        if (timer == 1)
        {
            visit++;
            scr_pathfind_to_point("susie", 6, 4, 2);
            if (visit == 1)
            {
                var tetalk = stringsetloc("Enter the giant pyramid tile to enter!", "obj_b1pyramid1_slash_Step_0_gml_23_0");
                scr_couchtalk(tetalk, "tenna", 2, 90);
                with (obj_actor_tenna)
                    bounce = 1;
            }
        }
        if (timer == 15)
            scr_pathfind_to_point("ralsei", 5, 4, 2);
        if (visit == 1)
        {
            if (timer == 165)
            {
                var sutalk = stringsetloc("Why is it small?", "obj_b1pyramid1_slash_Step_0_gml_28_0");
                scr_couchtalk(sutalk, "susie", 2, 90);
            }
            if (timer == 255)
            {
                var ratalk = stringsetloc("Maybe there's a smaller one inside?", "obj_b1pyramid1_slash_Step_0_gml_33_0");
                scr_couchtalk(ratalk, "ralsei", 2, 90);
                global.flag[1001] = 1;
            }
            if (timer == 345)
            {
                var tetalk = stringsetloc("You will never find the even smaller pyramid!", "obj_b1pyramid1_slash_Step_0_gml_39_0");
                scr_couchtalk(tetalk, "tenna", 2, 90);
                with (obj_actor_tenna)
                    bounce = 1;
            }
        }
    }
}
else
{
    timer = 0;
}
