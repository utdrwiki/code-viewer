scr_board_populatevars();
scr_gameshow_populatevars();
if (mypuz == 0)
{
    with (obj_board_event_bridgepuzzle)
    {
        if (puzzleid == 21)
            other.mypuz = id;
    }
}
if (active == 1)
{
    if (kris.boat == true && boattalk < 1 && obj_board_camera.con == 0)
    {
        boattalktimer++;
        if (boattalktimer == 30)
        {
            tenna.bounce = 1;
            var tetalk = stringsetloc("Nothing here! Head up to find a DOCK!", "obj_b2bridgeintro_slash_Step_0_gml_21_0");
            scr_couchtalk(tetalk, "tenna", 2, 140);
        }
        if (boattalktimer == 200)
        {
            tenna.bounce = 1;
            var tetalk = stringsetloc("Ha ha, what's UP... DOCK!?", "obj_b2bridgeintro_slash_Step_0_gml_27_0");
            scr_couchtalk(tetalk, "tenna", 2, 120);
        }
        if (boattalktimer == 340)
        {
            tenna.bounce = 1;
            var tetalk = stringsetloc("Okay, head north or I'll DOCK your points!", "obj_b2bridgeintro_slash_Step_0_gml_33_0");
            scr_couchtalk(tetalk, "tenna", 2, 90);
        }
        if (boattalktimer > 500 && ((boattalktimer % 30) * 4) == 0)
        {
            boattalk = 0.1;
            var boat = 0;
            with (obj_board_boat)
            {
                if (engaged)
                {
                    var pointsDisplay = instance_create(centerx(), centery(), obj_board_pointsGetDisplay);
                    pointsDisplay.amount = -1;
                    if (global.flag[1044] == 0)
                        pointsDisplay.onlyvisual = true;
                }
            }
        }
    }
    if (obj_board_camera.con != 0 && boattalktimer > 30)
    {
        boattalktimer = 9999;
        boattalk = 9999;
    }
    if (con == 0 && solved == true && obj_board_camera.con == 0)
    {
        if (suwalk == 0)
        {
            if (obj_mainchara_board.x > 320)
            {
                ralsei.follow = 1;
                if (kris.controlled == true)
                {
                    scr_pathfind_to_point("susie", choose(7, 8, 9), choose(4, 5, 6), 0);
                    suwalk = 1;
                }
                if (susie.controlled == true)
                    suwalk = 1;
                if (smells == 0 && obj_b2enemysquabble.battlecon > 10)
                    smells = 1;
                susie.sleepy = true;
            }
            else
            {
                debug_print("LEFT SIDE");
                ralsei.follow = 1;
                if (kris.controlled == true)
                {
                    scr_pathfind_to_point("susie", choose(1, 2, 3), choose(1, 2), 0);
                    suwalk = 1;
                }
                if (susie.controlled == true)
                    suwalk = 1;
            }
        }
    }
    if (convstart == 0)
    {
        if (obj_board_camera.con == 0)
        {
            with (obj_board_trigger)
            {
                if (extflag == "b2bridgeintro_convstart")
                {
                    if (place_meeting(x, y, obj_mainchara_board))
                        other.convstart = 1;
                }
            }
        }
    }
    else if (convstart < 99)
    {
        convstart++;
        if (convstart == 5)
        {
            var ratalk = stringsetloc("Looks like a puzzle.", "obj_b2bridgeintro_slash_Step_0_gml_109_0");
            scr_couchtalk(ratalk, "ralsei", 2, 80);
        }
        if (convstart == 80)
        {
            var sutalk = stringsetloc("Heh, leave it to me.", "obj_b2bridgeintro_slash_Step_0_gml_114_0");
            scr_couchtalk(sutalk, "susie", 2, 80);
        }
    }
    if (con == 0 && solved == false && obj_board_camera.con == 0)
    {
        if (suwalk == 0 && kris.boat == false)
        {
            pretimer++;
            if (pretimer >= 10)
            {
                pretimer = 0;
                scr_pathfind_to_point("susie", 2, 2, 0);
                suwalk = 19;
            }
        }
        if (suwalk == 19)
        {
            if (scr_board_checklocation("susie", 2, 2, 1))
            {
                if (!instance_place(board_tilex(1), board_tiley(3), obj_board_solid) || !instance_place(board_tilex(2), board_tiley(3), obj_board_solid) || !instance_place(board_tilex(3), board_tiley(3), obj_board_solid))
                {
                    scr_play_recording("susie", "0D0D0D0D0D0D0D0D0D0D0D0D0D0D");
                    suwalk = 20;
                    suwalktimer = 0;
                }
            }
        }
        if (suwalk == 20)
        {
            if (susie.susierecordcon == 0)
            {
                scr_pathfind_to_point("susie", 1, 4, 0);
                suwalk = 21;
            }
        }
        if (abs(susie.x - board_tilex(1)) < 4 && abs(susie.y - board_tiley(4)) < 4)
        {
            scr_pathfind_end();
            with (susie)
                setxy(board_tilex(1), board_tiley(4));
            susie.facing = 0;
            con = 1;
        }
    }
    if (con == 1 && obj_board_camera.con == 0)
    {
        pretimer++;
        if (pretimer == 5)
            scr_play_susie_recording("0101");
        if (pretimer > 10)
        {
            if (i_ex(susie.grabbed))
            {
                con = 2;
                pretimer = 0;
                kris.cantleave = true;
                boattalk = 1;
            }
            else
            {
                pretimer = 4;
            }
        }
    }
    if (con == 2)
    {
        pretimer++;
        if (pretimer == 5)
            scr_pathfind_to_point("susie", 4, 5);
        if (pretimer > 5)
        {
            if (abs(susie.x - board_tilex(4)) < 4 && abs(susie.y - board_tiley(5)) < 4)
            {
                pretimer = 0;
                with (susie)
                    setxy(board_tilex(4), board_tiley(5));
                susie.facing = 1;
                scr_pathfind_end("susie");
                var deliverlastbridge = "0W0W0W0W0W0W010W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0D0D0D0D0D0D0D0D0D0D0D0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0W0W010W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0U0U0U0U0U0U0U0U0U0U0U0W0R0R0R0R0R0R0R0R0R0R0R0R0R0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W01010101";
                scr_play_susie_recording(deliverlastbridge);
                con = 3;
            }
        }
    }
    if (con == 3)
    {
        if (mypuz.solved == true)
        {
            solved = true;
            kris.cantleave = false;
            con = 4;
            timer = 0;
        }
    }
    if (con == 4)
    {
        timer++;
        if (timer == 8)
        {
            var subridgefinish = "0W0W0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0D0L0D";
            scr_play_susie_recording(subridgefinish);
        }
        if (timer == 15)
        {
            tenna.bounce = 1;
            var tetalk = stringsetloc("Well done Susie!!", "obj_b2bridgeintro_slash_Step_0_gml_233_0");
            scr_couchtalk(tetalk, "tenna", 2, 60);
        }
        if (timer == 60)
        {
            su_real.sprite_index = spr_susie_right_dw;
            var sutalk = stringsetloc("Heh. Got anything harder?", "obj_b2bridgeintro_slash_Step_0_gml_239_0");
            scr_couchtalk(sutalk, "susie", 2, 80);
        }
        if (timer == 140)
        {
            with (obj_couchwriter)
                instance_destroy();
            scr_resetgameshowcharacter("susie");
            timer = 0;
            con = 5;
        }
    }
}
else
{
    if (boattalk > 0)
        boattalk = 1;
    suwalk = 0;
    pretimer = 0;
    con = 0;
    smtimer = 0;
}
if (solved == true && resetpuzzle == false)
{
    var done = false;
    with (obj_board_trigger)
    {
        if (extflag == "b2bridgepuzzle1resetpuzzle")
        {
            if (place_meeting(x, y, obj_mainchara_board))
            {
                with (obj_board_bridge_placed)
                {
                    if (puzzleid == 21)
                        instance_destroy();
                }
                done = true;
            }
        }
    }
    if (done == true)
        resetpuzzle = true;
}
if (active)
{
    if (smells == 1 && obj_board_camera.con == 0)
    {
        smtimer++;
        if (smtimer >= 15)
        {
            smells = 2;
            var sutalk = stringsetloc("Cool. Smells like nothing.", "obj_b2bridgeintro_slash_Step_0_gml_304_0");
            scr_couchtalk(sutalk, "susie", 2, 80);
        }
    }
}
if (dodelete)
{
    dodelete = false;
    with (obj_board_bridge_placed)
    {
        if ((y - other.y) == 128 && ((x - other.x) == 128 || (x - other.x) == 160))
            instance_destroy();
    }
}
