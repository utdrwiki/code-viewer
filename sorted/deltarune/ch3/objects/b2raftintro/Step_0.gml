scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
    if (kris.boat == true)
    {
        suwalk = 1;
        boated = true;
    }
    else
    {
        susie.sleepy = true;
    }
    if (boated == true && kris.boat == false && susie.canfreemove == true)
    {
        boated = false;
        ralsei.follow = true;
        if (susie.x > 326)
            scr_pathfind_to_point("susie", 10, 4, 3);
        else if (susie.y < 184)
            scr_pathfind_to_point("susie", choose(1, 2, 3), 1, 0);
        else
            scr_pathfind_to_point("susie", 3, 5, 3);
    }
    if (suwalk == 0 && obj_board_camera.con == 0)
    {
        ralsei.follow = true;
        suwalk = 1;
        if (susie.x < 129)
        {
            scr_pathfind_to_point("susie", 3, 1, 0);
        }
        else if (susie.y > 268)
        {
            debug_print("south");
            scr_pathfind_to_point("susie", 2, 6, 2);
        }
        else
        {
            scr_pathfind_to_point("susie", 9, choose(3, 4, 5), 0);
        }
    }
    if (con == 0 && obj_board_camera.con == 0)
    {
        with (obj_board_trigger)
        {
            if (extflag == "b2cantlift")
            {
                if (place_meeting(x, y, obj_mainchara_board))
                    other.con = 1;
            }
        }
    }
    if (con == 1)
    {
        if (kris.camera == true)
            con = 2;
        timer++;
        if (timer == 1)
            scr_pathfind_to_point("susie", 3, 5, 3);
        if (timer == 10)
        {
            su_real.sprite_index = spr_susie_walk_right_dw_unhappy;
            var sutalk = stringsetloc("Hey dumbass, game's broke. I can't lift this rock.", "obj_b2raftintro_slash_Step_0_gml_90_0");
            scr_couchtalk(sutalk, "susie", 2, 60);
        }
        if (timer == 70)
        {
            tenna.bounce = 1;
            scr_resetgameshowcharacter("susie");
            var tetalk = stringsetloc("Perhaps you need a secret tool...", "obj_b2raftintro_slash_Step_0_gml_98_0");
            scr_couchtalk(tetalk, "tenna", 2, 60);
        }
        if (timer == 130)
            scr_resetgameshowcharacter("ralsei");
    }
}
else
{
    suwalk = 0;
}
