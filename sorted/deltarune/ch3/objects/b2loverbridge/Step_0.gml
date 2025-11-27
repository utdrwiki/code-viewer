scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
    if (con == 0 && obj_board_camera.con == 0 && kris.boat == false)
    {
        with (obj_board_trigger)
        {
            if (extflag == "b2loverbridge")
            {
                if (place_meeting(x, y, obj_mainchara_board))
                {
                    var _kris = instance_place(x, y, obj_mainchara_board);
                    if (_kris.name == "kris")
                        other.con++;
                }
            }
        }
    }
    if (con == 1)
    {
        timer++;
        if (timer == 1)
        {
            with (obj_b2_ice_a1)
                killthis = 1;
            scr_board_gridreset();
        }
        if (timer == 10)
        {
            ralsei.follow = true;
            scr_board_caterpillar_interpolate_ralsei();
            tenna.y = 576;
            tenna.sprite_index = spr_tenna_faceaway;
            with (tenna)
                scr_lerpvar("x", 784, 484, 8, -1, "out");
            with (tenna)
                scr_delay_var("bounce", true, 8);
            global.flag[1022] = 0;
            for (var i = 0; i < 2; i++)
            {
                block[i] = instance_create(x, y, obj_board_solid);
                with (block[i])
                {
                    setxy_board(1824 + (32 * i), 2848);
                    visible = true;
                    scr_darksize();
                    sprite_index = spr_board_tennastatueblocker;
                    scr_depth_board();
                }
            }
            var tetalk = stringsetloc("I'm BACK! Onto ATLANTIS!", "obj_b2loverbridge_slash_Step_0_gml_63_0");
            var bub = scr_couchtalk(tetalk, "tenna", 2, 90);
            bub.y = 262 + cameray();
            with (bub)
                scr_lerpvar("x", 784, 484, 8, -1, "out");
            con = 2;
            timer = 0;
        }
    }
    if (con == 2)
    {
        timer++;
        if (timer == 90)
        {
            tenna.bounce = 1;
            var tetalk = stringsetloc("... why is this RAINBOW so IMPURE!?", "obj_b2loverbridge_slash_Step_0_gml_79_0");
            var bub = scr_couchtalk(tetalk, "tenna", 2, 80);
            con = 3;
        }
    }
    if (suwalk == 0 && obj_board_camera.con == 0)
    {
        suwalktimer++;
        if (suwalktimer == 1)
            ralsei.follow = true;
        if (suwalktimer == 15)
        {
            if (susie.y > 264)
                scr_pathfind_to_point("susie", 1, 4, 0);
            else
                scr_pathfind_to_point("susie", choose(3, 4), 4, 0);
            suwalk = 1;
        }
    }
}
else
{
    if (con == 2)
        con = 3;
    suwalk = 0;
    suwalktimer = 0;
}
