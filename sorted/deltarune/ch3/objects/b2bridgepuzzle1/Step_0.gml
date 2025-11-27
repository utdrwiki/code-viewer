scr_board_populatevars();
scr_gameshow_populatevars();

autosolve = function()
{
    if (scr_debug())
    {
        with (obj_board_bridge)
        {
            if (puzzleid == 0)
                instance_destroy();
        }
        with (obj_board_bridge_placed)
        {
            if (puzzleid == 0)
                instance_destroy();
        }
        instance_create_board(3, 3, obj_board_bridge);
        instance_create_board(5, 3, obj_board_bridge);
        instance_create_board(7, 3, obj_board_bridge);
        instance_create_board(8, 3, obj_board_bridge);
        instance_create_board(9, 3, obj_board_bridge);
    }
};

if (puzzle == 0)
{
    with (obj_board_event_bridgepuzzle)
    {
        if (puzzleid == 0)
            other.puzzle = id;
    }
}
if (active == 1)
{
    if (con == 0 && obj_board_camera.con == 0)
    {
        if (rawalk == 0)
        {
            rawalk = 1;
            ralsei.follow = 0;
            scr_pathfind_to_point("ralsei", 2, 4, 0);
            scr_pathfind_to_point("susie", 1, 5, 1);
        }
        with (kris)
        {
            if (place_meeting(x, y, obj_board_trigger))
            {
                var trig = instance_place(x, y, obj_board_trigger);
                if (trig.extflag == "b2bridgepuzzle1trig")
                    other.con = 1;
            }
        }
    }
    if (con >= 5 && !solved && surftalk == 0)
    {
        var starttime = 900;
        var proceed = true;
        if (surftime < starttime)
        {
            if (ralsei.visible == false)
                proceed = false;
        }
        if (proceed)
            surftime++;
        if (surftime >= starttime)
        {
            surfboardready = true;
            if (broketease == 0)
            {
                broketease = 99;
                show_debug_message_concat("can't break tease now");
            }
            var susieouttatheway = false;
            var inst = collision_rectangle(ralsei.x - 10, ralsei.y - 10, ralsei.x + 32 + 10, ralsei.y + 32 + 10, susie, 0, true);
            if (!i_ex(inst) && !i_ex(obj_board_grabobject))
                susieouttatheway = true;
            if (susieouttatheway)
            {
                surftalk = 1;
                surftime = 0;
            }
            else
            {
                debug_message("susie in the way!");
            }
        }
    }
    if (surftalk == 1)
    {
        surftime++;
        if (surftime == 1)
        {
            scr_play_recording("ralsei", "0W0W");
            scr_play_recording("kris", "0W0W");
            with (ralsei)
            {
                debug_print("surfboard created");
                x = round(x / 32) * 32;
                y = round(y / 32) * 32;
                other.lastknownralseicoords = [x, y];
                other.surfboard = instance_create(x, y, obj_board_bridgespawner);
            }
            surfboard.ralsei = true;
            surfboard.active = true;
            surfboard.sprite_index = spr_board_ralsei_surfboard;
            resetralvis = true;
            debug_message(lastknownralseicoords);
        }
        if (surftime == 2)
        {
            ralsei.visible = false;
            with (ralsei)
                setxy(board_tilex(11), board_tiley(0));
        }
        if (solved)
        {
            surftime = 999;
            surftalk = -2;
        }
        if (surftime == 8)
        {
            didsurf = true;
            var ratalk = stringsetloc("--oh!!", "obj_b2bridgepuzzle1_slash_Step_0_gml_69_0");
            scr_couchtalk(ratalk, "ralsei", 2, 80);
            scr_shakeobj(ra_real);
            snd_play(snd_wing);
        }
        if (surftime == 30)
        {
            snd_play(snd_noise);
            su_real.sprite_index = spr_susie_point_right;
            su_real.x += 10;
            su_real.y += 52;
            scr_shakeobj(su_real);
            var sutalk = stringsetloc("I KNEW YOU COULD TURN INTO A SURF BOARD!", "obj_b2bridgepuzzle1_slash_Step_0_gml_81_0");
            scr_couchtalk(sutalk, "susie", 2, 100);
            scr_resetgameshowcharacter_delay("susie", 111);
        }
    }
    if (con == 1)
    {
        con = 2;
        timer = -31;
        kris.cantleave = true;
    }
    if (con == 2)
    {
        timer++;
        if (timer == -30)
        {
            var ratalk = stringsetloc("Oh! Another puzzle!", "obj_b2bridgepuzzle1_slash_Step_0_gml_52_0");
            scr_couchtalk(ratalk, "ralsei", 2, 80);
        }
        if (timer == 1)
        {
            su_real.sprite_index = su_real.usprite;
            var sutalk = stringsetloc("...", "obj_b2bridgepuzzle1_slash_Step_0_gml_58_0");
            scr_couchtalk(sutalk, "susie", 2, 60);
        }
        if (timer == 30)
            ra_real.sprite_index = ra_real.lsprite;
        if (timer == 55)
        {
            kr_real.sprite_index = kr_real.lsprite;
            kris.canfreemove = 0;
            kris.controlled = false;
            with (obj_board_playercamera)
                instance_destroy();
            with (obj_board_grayregion)
                instance_destroy();
            with (obj_mainchara_board)
                fun = false;
        }
        if (timer == 60)
        {
            var ratalk = stringsetloc("So, um, should be easy for you, right?", "obj_b2bridgepuzzle1_slash_Step_0_gml_72_0");
            scr_couchtalk(ratalk, "ralsei", 2, 80);
        }
        if (timer == 120)
        {
            scr_shakeobj(su_real, 4);
            su_real.sprite_index = spr_susieb_attackready_unarmed;
            snd_play(snd_whip_crack_only);
            var sutalk = stringsetloc("Look over there!", "obj_b2bridgepuzzle1_slash_Step_0_gml_80_0");
            scr_couchtalk(sutalk, "susie", 2, 45);
        }
        if (timer == 160)
        {
            var ratalk = stringsetloc("Huh?", "obj_b2bridgepuzzle1_slash_Step_0_gml_85_0");
            scr_couchtalk(ratalk, "ralsei", 2, 50);
            ra_real.sprite_index = ra_real.rsprite;
        }
        if (timer == 175)
        {
            with (su_real)
                sprite_index = usprite;
            con++;
            timer = 0;
        }
    }
    if (con == 3)
    {
        with (obj_board_playercamera)
            _end = 99;
        su_real.depth = 95320;
        timer++;
        if (timer == 1)
        {
            kr_real.sprite_index = kr_real.usprite;
            with (su_real)
            {
                image_speed = 0.25;
                scr_move_to_point_over_time(274, 288, 8);
            }
        }
        if (timer == 14)
            su_real.sprite_index = spr_susieu_dark_benddown;
        if (timer == 20)
        {
            scr_shakeobj(su_real, 8);
            snd_play(snd_wing);
        }
        if (timer == 26)
        {
            scr_shakeobj(su_real, 8);
            snd_play(snd_equip);
            obj_ch3_gameshow.wires.sprite_index = spr_controllerwires_skr;
        }
        if (timer == 32)
        {
            with (su_real)
            {
                sprite_index = usprite;
                image_index = 0;
                image_speed = 0;
                snd_play(snd_wing);
            }
        }
        if (timer == 38)
        {
            var ratalk = stringsetloc(" ? ", "obj_b2bridgepuzzle1_slash_Step_0_gml_132_0");
            scr_couchtalk(ratalk, "ralsei", 2, 30, -1, -1, 14);
            scr_resetgameshowcharacter_delay("ralsei", 30);
            with (su_real)
            {
                image_speed = 0.25;
                sprite_index = dsprite;
                scr_move_to_point_over_time(140, 392, 8);
            }
        }
        if (timer == 47)
        {
            with (su_real)
            {
                image_speed = 0;
                sprite_index = usprite;
                scr_shakeobj(id, 4);
            }
            con = 4;
            timer = 0;
        }
    }
    if (con == 4)
    {
        var sutalk = stringsetloc("Let's go, easy puzzle.", "obj_b2bridgepuzzle1_slash_Step_0_gml_158_0");
        scr_couchtalk(sutalk, "susie", 2, 90);
        with (obj_mainchara_board)
        {
            fun = false;
            canfreemove = true;
        }
        kris.controlled = 0;
        susie.controlled = 1;
        with (obj_mainchara_board)
            cantleave = true;
        susie.facing = 0;
        global.interact = 0;
        con = 5;
        sutease = -2;
        timer = 0;
    }
    if (sutease == -2)
    {
        if (surfboardready)
        {
            sutease = -4;
            broketease = -4;
        }
        else if (instance_exists(obj_board_grabobject))
        {
            with (obj_board_grabobject)
            {
                if (grabbedid.object_index == obj_mainchara_board)
                {
                    print_message("broke teasing sequence early");
                    other.broketease = 42;
                    other.sutease = -4;
                    other.suteasetimer = 0;
                    scr_pathfind_end("kris");
                    scr_play_recording("kris", "0W0W");
                    scr_play_recording("ralsei", "0W0W");
                    other.kris.canfreemove = true;
                    scr_pathfind_to_point("kris", 1, 4, 0);
                    other.kris.fun = 0;
                    other.kris.image_speed = 0;
                }
            }
        }
    }
    if (sutease > 0 && sutease < 99)
    {
        if (i_ex(obj_board_grabobject))
        {
            with (obj_board_grabobject)
            {
                if (grabbedid.object_index == obj_pushableblock_board || grabbedid.object_index == obj_mainchara_board)
                {
                    print_message("broke teasing sequence");
                    other.broketease = 1;
                    other.sutease = 100;
                    other.suteasetimer = 0;
                    scr_pathfind_end("kris");
                    scr_play_recording("kris", "0W0W");
                    scr_play_recording("ralsei", "0W0W");
                    other.kris.fun = 0;
                    other.kris.image_speed = 0;
                }
            }
        }
    }
    if (broketease == 1 && solved == 0)
    {
        if (surfboardready)
            broketease = 999;
        else
            broketeasetimer++;
        if (broketeasetimer == 55)
        {
            var sutalk = stringsetloc("Uhh... knock it off, \"Kris\". You're uh, distracting me.", "obj_b2bridgepuzzle1_slash_Step_0_gml_198_0");
            scr_couchtalk(sutalk, "susie", 2, 120);
            su_real.sprite_index = su_real.rsprite;
        }
        if (broketeasetimer == 175)
        {
            var ratalk = stringsetloc("S-Sorry, Susie!", "obj_b2bridgepuzzle1_slash_Step_0_gml_204_0");
            scr_couchtalk(ratalk, "ralsei", 2, 60);
            ra_real.sprite_index = ra_real.lsprite;
        }
        if (broketeasetimer == 235)
        {
            scr_resetgameshowcharacter("ralsei");
            scr_resetgameshowcharacter("susie");
            broketease = 2;
        }
    }
    if (sutease == -2)
    {
        suteasetimer++;
        if (suteasetimer == 1)
        {
            scr_pathfind_end("kris");
            scr_play_recording("kris", "0W0W");
        }
        if (suteasetimer == 90)
        {
            suteasetimer = 0;
            sutease = 1;
        }
    }
    if (sutease == 1)
    {
        suteasetimer++;
        if (suteasetimer == 1)
        {
            kris.canfreemove = true;
            scr_pathfind_to_point("kris", 1, 4, 1);
        }
        if (suteasetimer > 1)
        {
            if (scr_board_checklocation("kris", 1, 4, 4))
            {
                scr_pathfind_end("kris");
                scr_play_recording("kris", "0W0W");
                with (kris)
                    setxy(board_tilex(1), board_tiley(4));
                kris.allow_diagonals = false;
                suteasetimer = 0;
                sutease = 1.5;
            }
        }
    }
    if (sutease == 1.5)
    {
        suteasetimer++;
        if (suteasetimer >= 90)
        {
            suteasetimer = 0;
            sutease = 2;
        }
    }
    if (sutease == 2)
    {
        kris.image_speed = 0.125;
        suteasetimer++;
        if (suteasetimer == 1)
        {
            var krstring = "";
            for (var i = 0; i < 80; i++)
                krstring += "0R0R0R0W0W0L0L0L0W0W";
            scr_play_recording("kris", krstring);
        }
        if (suteasetimer == 60)
        {
            var sutalk = stringsetloc("Eww, Kris, stop trying to hug Ralsei.", "obj_b2bridgepuzzle1_slash_Step_0_gml_263_0");
            scr_couchtalk(sutalk, "susie", 2, 90);
        }
        if (suteasetimer == 140)
        {
            var ratalk = stringsetloc("K... Kris!?", "obj_b2bridgepuzzle1_slash_Step_0_gml_268_0");
            scr_couchtalk(ratalk, "ralsei", 2, 80);
        }
        if (suteasetimer == 151)
        {
            scr_play_recording("kris", "0W0W");
            with (kris)
                setxy(board_tilex(1), board_tiley(4));
            with (ralsei)
                setxy(board_tilex(2), board_tiley(4));
            var ralstring = "";
            var krstring = "";
            for (var i = 0; i < 1200; i++)
            {
                ralstring += "0U0U0U0U0U0U0U0U0L0L0L0L0L0L0L0L0D0D0D0D0D0D0D0D0R0R0R0R0R0R0R0R";
                krstring += "0R0R0R0R0R0R0R0R0U0U0U0U0U0U0U0U0L0L0L0L0L0L0L0L0D0D0D0D0D0D0D0D";
            }
            scr_play_recording("kris", krstring);
            scr_play_recording("ralsei", ralstring);
        }
    }
    if (sutease < 4 && solved == 1)
    {
        sutease = 100;
        suteasetimer = 0;
        kris.fun = 0;
        scr_play_recording("kris", "0D");
        scr_play_recording("ralsei", "0D");
    }
    if (scr_debug())
    {
        if (solved == 0 && keyboard_check_pressed(vk_f5))
            autosolve();
    }
    if (solved == 0)
    {
        if (puzzle.solved == true)
        {
            solved = 1;
            with (obj_board_bridge)
            {
                if (puzzleid == 0 && sprite_index != spr_board_ralsei_surfboard)
                {
                    with (instance_create(x, y, obj_board_smokepuff))
                        image_blend = #B46A37;
                    instance_destroy();
                }
            }
            with (obj_board_bridge)
            {
                if (sprite_index == spr_board_ralsei_surfboard)
                {
                    if (visible)
                        instance_create(x, y, obj_board_smokepuff);
                    instance_destroy();
                }
            }
            scr_board_gridreset();
            var doreset = true;
            with (obj_board_bridge_placed)
            {
                if (sprite_index == spr_board_ralsei_surfboard)
                    doreset = false;
            }
            if (doreset)
            {
                with (obj_mainchara_board)
                {
                    if (name == "ralsei")
                    {
                        if (!visible)
                        {
                            follow = false;
                            setxy(other.lastknownralseicoords[0], other.lastknownralseicoords[1]);
                            visible = true;
                        }
                        fun = 0;
                        if (other.broketease != 42)
                        {
                            scr_board_caterpillar_interpolate_ralsei();
                            canfreemove = true;
                            follow = true;
                        }
                        else
                        {
                            scr_pathfind_to_point("ralsei,", 4, 2, 0);
                        }
                    }
                }
            }
            global.flag[1023] = 0;
            timer = 0;
        }
    }
}
else
{
    rawalk = 0;
}
if (sutease == 100 && solved == 1)
{
    suteasetimer++;
    if (suteasetimer == 1)
    {
        with (obj_mainchara_board)
        {
            if (name == "kris")
                canfreemove = true;
        }
        global.flag[1024] = 1;
        sukriswalk = 1;
    }
    if (suteasetimer == 15)
    {
        if (puzzle.resetcount < 2)
        {
            var ratalk = stringsetloc("Susie!! That was amazing!!", "obj_b2bridgepuzzle1_slash_Step_0_gml_462_0");
            scr_couchtalk(ratalk, "ralsei", 2, 60);
        }
        if (puzzle.resetcount >= 2 && puzzle.resetcount < 5)
        {
            var ratalk = stringsetloc("Wow!! Great job, Susie!!", "obj_b2bridgepuzzle1_slash_Step_0_gml_467_0");
            scr_couchtalk(ratalk, "ralsei", 2, 60);
        }
        if (puzzle.resetcount >= 5)
        {
            var sutalk = stringsetloc("Took you long enough, dumbass.", "obj_b2bridgepuzzle1_slash_Step_0_gml_472_0");
            scr_couchtalk(sutalk, "susie", 2, 60);
        }
    }
    if (suteasetimer == 60)
    {
        if (puzzle.resetcount < 2)
        {
            var sutalk = stringsetloc("You doubted my geniusness?", "obj_b2bridgepuzzle1_slash_Step_0_gml_480_0");
            scr_couchtalk(sutalk, "susie", 2, 60);
        }
        if (puzzle.resetcount >= 2 && puzzle.resetcount < 5)
        {
            var sutalk = stringsetloc("Yeah, great job, \"Susie.\"", "obj_b2bridgepuzzle1_slash_Step_0_gml_486_0");
            scr_couchtalk(sutalk, "susie", 2, 60);
        }
        if (puzzle.resetcount >= 5)
        {
            var ratalk = stringsetloc("Huh? No, Susie, you did great!", "obj_b2bridgepuzzle1_slash_Step_0_gml_491_0");
            scr_couchtalk(ratalk, "ralsei", 2, 60);
        }
    }
    with (obj_board_grabobject)
    {
        if (i_ex(grabbedid))
        {
            with (grabbedid)
            {
                if (object_index == obj_mainchara_board)
                {
                    if (follow)
                    {
                        debug_print("grabbed break");
                        scr_play_recording("ralsei", "0W");
                        follow = false;
                    }
                }
            }
        }
    }
}
if (active && obj_board_camera.con == 0 && solved == true)
{
    with (obj_board_grabobject)
    {
        sourcex = x;
        sourcey = y;
    }
    if (sukriswalk == 1)
    {
        sukriswalktimer++;
        if (sukriswalktimer == 2)
            scr_pathfind_to_point("kris", 10, 7, 0);
        if (sukriswalktimer > 1)
        {
            if (scr_board_checklocation("kris", 10, 7, 2))
            {
                sukriswalktimer = 0;
                sukriswalk = 2;
                kris.x = board_tilex(10);
                kris.y = board_tiley(7);
            }
        }
    }
    if (sukriswalk == 2)
    {
        if (scr_board_checklocation("kris", board_tilex(10), board_tiley(7), 10))
        {
            sukriswalktimer++;
            if (sukriswalktimer == 6)
            {
                with (obj_mainchara_board)
                    controlled = 0;
                kris.controlled = 1;
                global.interact = 1;
                obj_board_camera.shift = "down";
                with (obj_b2tennaleave1)
                    cont1 = 1;
            }
        }
    }
}
if (active)
{
    if (obj_b2enemysquabble.battlecon == 15)
    {
        var trig = 0;
        with (obj_board_trigger)
        {
            if (extflag == "b2retreadcomment")
            {
                if (place_meeting(x, y, other.kris))
                    trig = 1;
            }
        }
        if (trig == 1)
        {
            if (retread == 0)
            {
                retreadtimer = 0;
                retread = 1;
            }
        }
    }
}
if (retread == 1)
{
    retreadtimer++;
    if (retreadtimer == 1)
    {
        con = 99;
        var ratalk = stringsetloc("Umm, nice job on this puzzle, Kris...", "obj_b2bridgepuzzle1_slash_Step_0_gml_559_0");
        scr_couchtalk(ratalk, "ralsei", 2, 80);
    }
    if (retreadtimer == 92)
    {
        var sutalk = stringsetloc("Hey, I got the throwing thingy.", "obj_b2bridgepuzzle1_slash_Step_0_gml_564_0");
        scr_couchtalk(sutalk, "susie", 2, 80);
        retread = 2;
    }
}
if (resetralvis == true)
{
    if (!active && obj_board_camera.con == 0)
    {
        ralsei.visible = true;
        resetralvis = false;
        with (obj_board_bridge)
        {
            if (puzzleid == 0)
                instance_destroy();
        }
        with (obj_board_bridge_placed)
        {
            if (sprite_index == spr_board_ralsei_surfboard)
            {
                sprite_index = spr_board_bridge_1x;
                image_index = 1;
                image_speed = 0;
            }
        }
    }
}
if (active)
{
    if (con == 99)
    {
        if (suwalk == 0 && obj_board_camera.con == 0)
        {
            suwalktimer++;
            if (suwalktimer == 1)
                ralsei.follow = true;
            if (suwalktimer == 8)
            {
                if (susie.x > 320)
                    scr_pathfind_to_point("susie", choose(1, 2), choose(2, 3, 4, 5), 0);
                else
                    scr_pathfind_to_point("susie", 10, choose(3, 4, 5, 6), 0);
            }
        }
    }
}
else
{
    if (con >= 5)
        con = 99;
    if (con == 99)
    {
        suwalktimer = 0;
        suwalk = 0;
    }
}
