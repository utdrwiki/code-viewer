if (init == 0)
{
    if (i_ex(obj_board_tree_static))
    {
        var image_ind = obj_board_tree_static.image_index;
        hazard[0] = instance_create(x + 320, y + 64, obj_board_tree_static);
        hazard[1] = instance_create(x + 320, y + 96, obj_board_tree_static);
        hazard[0].image_index = image_ind;
        hazard[1].image_index = image_ind;
        init = 1;
    }
}
if (kr == 0)
{
    with (obj_mainchara_board)
    {
        if (name == "kris")
            other.kr = id;
    }
}
if (su == 0)
{
    with (obj_mainchara_board)
    {
        if (name == "susie")
            other.su = id;
    }
}
if (ra == 0)
{
    with (obj_mainchara_board)
    {
        if (name == "ralsei")
            other.ra = id;
    }
}
kris = kr;
susie = su;
ralsei = ra;
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
ra_real = ralseireal;
su_real = susiereal;
kr_real = krisreal;
if (active == 1)
{
    if (wither == 0)
    {
        if (obj_board_oasis.wither)
        {
            wither = 1;
            debug_print("withercheck");
            if (i_ex(hazard[0]))
                hazard[0].sprite_index = spr_board_tree_withered;
            if (i_ex(hazard[1]))
                hazard[1].sprite_index = spr_board_tree_withered;
        }
    }
    maketimer = 0;
    if (solved == 0)
    {
        if (stucktrigger == 1)
        {
            if (!i_ex(obj_bpush2_stucktrigger))
            {
                stucktrigger = 2;
                stucktriggertimer = 0;
            }
        }
        if (stucktrigger == 2)
        {
            stucktriggertimer++;
            if (stucktriggertimer == 1)
                snd_play(snd_error);
            if (stucktriggertimer == 30)
            {
                tenna.bounce = 1;
                var tetalk = stringsetloc("Ooh, that's gotta hurt, folks!", "obj_b1push2_slash_Step_0_gml_57_0");
                if (obj_bpush1.timeresult == 1)
                    tetalk = stringsetloc("Child's play!? I meant baby's work! This is bad, folks!", "obj_b1push2_slash_Step_0_gml_58_0");
                scr_couchtalk(tetalk, "tenna", 2, 120);
                snd_play_delay(snd_laughtrack_short_temp, 10);
                stucktrigger = 0;
                stucktriggertimer = 0;
            }
        }
        if (stucktrigger == 0)
            stucktriggertimer++;
        if (con == 0 && obj_board_camera.con == 0)
        {
            ra.follow = 1;
            var letsstart = 0;
            with (kr)
            {
                if (place_meeting(x, y, obj_board_trigger))
                {
                    var trig = instance_place(x, y, obj_board_trigger);
                    if (trig.extflag == "push2")
                        letsstart = 1;
                }
            }
            if (letsstart == 1)
            {
                global.interact = 1;
                with (obj_board_trigger)
                {
                    if (extflag == "push2")
                        instance_destroy();
                }
                with (su)
                {
                    scr_pathfind_end("susie");
                    if (y < 80)
                        y = 80;
                    if (x < 160)
                        x = 160;
                }
                with (ra)
                {
                    if (y < 80)
                        y = 80;
                    if (x < 160)
                        x = 160;
                    scr_pathfind_end("ralsei");
                    follow = 0;
                }
                hazard[2] = instance_create(x + 128, y - 32, obj_board_tree_static);
                hazard[3] = instance_create(x + 160, y - 32, obj_board_tree_static);
                hazard[4] = instance_create(x + -32, y + 64, obj_board_tree_static);
                hazard[5] = instance_create(x + -32, y + 96, obj_board_tree_static);
                hazard[6] = instance_create(x + 128, y + 192, obj_board_tree_static);
                hazard[7] = instance_create(x + 160, y + 192, obj_board_tree_static);
                for (var i = 4; i < 8; i++)
                {
                    with (hazard[i])
                    {
                        with (instance_create(x, y, obj_board_smokepuff))
                            scr_depth_board();
                    }
                }
                hazard[2].image_index = hazard[0].image_index;
                hazard[3].image_index = hazard[0].image_index;
                hazard[4].image_index = hazard[0].image_index;
                hazard[5].image_index = hazard[0].image_index;
                hazard[6].image_index = hazard[0].image_index;
                hazard[7].image_index = hazard[0].image_index;
                if (wither)
                {
                    for (var i = 0; i < array_length(hazard); i++)
                        hazard[i].sprite_index = spr_board_tree_withered;
                }
                snd_play_pitch(snd_impact_bc, 0.6);
                snd_play_pitch(snd_impact_bc, 1.2);
                timer = 0;
                con = 1;
            }
        }
        if (con == 1)
        {
            timer++;
            if (timer == 5)
            {
                global.interact = 0;
                timer = 0;
                con = 2;
                scr_pathfind_to_point("ralsei", 5, 4, 0);
                scr_pathfind_to_point("susie", 8, 4, 0);
            }
        }
        if (con == 2)
        {
            timer++;
            if (timer == 1)
            {
                tenna.bounce = 1;
                var tetalk = stringsetloc("Another puzzle! Child's play for our heroes!", "obj_b1push2_slash_Step_0_gml_162_0");
                if (obj_bpush1.timeresult == 2)
                    tetalk = stringsetloc("Puzzle two!! Get ready for a long one, folks!", "obj_b1push2_slash_Step_0_gml_164_0");
                if (obj_bpush1.timeresult == 3)
                    tetalk = stringsetloc("Puzzle two!? Can they finish it within the episode!?", "obj_b1push2_slash_Step_0_gml_166_0");
                scr_couchtalk(tetalk, "tenna", 2, 160);
            }
        }
        if (wrongwaycon == 0)
        {
            with (obj_bpush2_stucktrigger_alt)
            {
                if (place_meeting(x, y, obj_pushableblock_board))
                    other.wrongwaycon = 1;
            }
            wrongwaytimer = 0;
        }
        if (wrongwaycon == 1)
        {
            wrongwaytimer++;
            if (wrongwaytimer == 1)
                snd_play(snd_error);
            if (wrongwaytimer == 35)
            {
                tenna.bounce = 1;
                var tetalk = stringsetloc("Whoops! Not that way!!!", "obj_b1push2_slash_Step_0_gml_192_0");
                scr_couchtalk(tetalk, "tenna", 2, 90);
                snd_play(snd_slidewhistle);
                snd_play_delay(snd_laughtrack_short_temp, 10);
                wrongwaytimer = 0;
                wrongwaycon = 2;
            }
        }
        if (wrongwaycon == 2)
        {
            var wrongcount = 0;
            with (obj_bpush2_stucktrigger_alt)
            {
                if (place_meeting(x, y, obj_pushableblock_board))
                    wrongcount++;
            }
            if (wrongcount == 0)
                wrongwaycon = 3;
        }
        if (wrongwaycon == 3)
        {
            with (obj_bpush2_stucktrigger_alt)
            {
                if (place_meeting(x, y, obj_pushableblock_board))
                    other.wrongwaycon = 4;
            }
        }
        if (wrongwaycon == 4)
        {
            wrongwaytimer++;
            if (wrongwaytimer == 1)
                snd_play(snd_error);
            if (wrongwaytimer == 25)
            {
                tenna.bounce = 1;
                var tetalk = stringsetloc("Talk about a BLOCK head!!", "obj_b1push2_slash_Step_0_gml_230_0");
                scr_couchtalk(tetalk, "tenna", 2, 90);
                snd_play(snd_splat);
                snd_play_delay(snd_laughtrack_short_temp, 10);
                wrongwaycon = 5;
            }
        }
        if (scr_debug())
        {
            if (ralcon == 0 && keyboard_check_pressed(vk_f5))
            {
                with (ralsei)
                {
                    scr_pathfind_end(name);
                    setxy(288, 192);
                    follow = 0;
                }
                with (susie)
                {
                    scr_pathfind_end(name);
                    setxy(384, 192);
                }
                with (obj_pushableblock_board)
                {
                    if (extflag == "push2")
                        instance_destroy();
                }
                with (instance_create(x, y, obj_pushableblock_board))
                {
                    extflag = "push2";
                    setxy_board(1344, 1248);
                }
                with (instance_create(x, y, obj_pushableblock_board))
                {
                    extflag = "push2";
                    setxy_board(1568, 1184);
                }
            }
        }
        var halfsolved = 0;
        if (instance_number(obj_board_event_push2_blocktrigger) == 1)
            halfsolved = true;
        if (halfsolved && stucktrigger == 0 && ralcon == 0 && !i_ex(obj_couchwriter))
        {
            mus_volume(global.currentsong[1], 0, 30);
            ralcon = 1;
            raltimer = 0;
        }
        if (ralcon == 1)
        {
            raltimer++;
            var talktimer = 75;
            if (raltimer == 1)
            {
                scr_board_gridreset();
                scr_pathfind_to_point("ralsei", 2, 3, 0);
            }
            if (raltimer == 2)
            {
                tempstop = instance_create(x, y, obj_board_solid);
                with (tempstop)
                    setxy_board(1344, 1184);
                tempstop.image_xscale = 1;
                with (tempstop)
                {
                    if (place_meeting(x, y, obj_mainchara_board))
                    {
                    }
                }
            }
            if (raltimer == 15)
            {
                ralcon = 1.01;
                raltimer = 0;
            }
        }
        if (ralcon == 1.01)
        {
            raltimer++;
            if (raltimer == 1)
            {
                kris.canfreemove = false;
                kr_real.sprite_index = kr_real.rsprite;
                su_real.sprite_index = spr_susie_walk_right_dw;
                ra_real.sprite_index = spr_ralsei_walk_left_unhappy;
                var ratalk = stringsetloc("Don't worry, Kris!", "obj_b1push2_slash_Step_0_gml_323_0");
                scr_couchtalk(ratalk, "ralsei", 2, 60);
            }
            var skip = false;
            if (raltimer > 6 && (button1_p() || button3_h()))
                skip = true;
            if (raltimer == 60 || skip == true)
            {
                ralcon = 1.02;
                raltimer = 0;
            }
        }
        if (ralcon == 1.02)
        {
            raltimer++;
            if (raltimer == 1)
            {
                ra_real.sprite_index = spr_ralsei_walk_left;
                var ratalk = stringsetloc("According to the manual...", "obj_b1push2_slash_Step_0_gml_329_0");
                scr_couchtalk(ratalk, "ralsei", 2, 60);
            }
            var skip = false;
            if (raltimer > 6 && (button1_p() || button3_h()))
                skip = true;
            if (raltimer == 60 || skip == true)
            {
                ralcon = 1.03;
                raltimer = 0;
            }
        }
        if (ralcon == 1.03)
        {
            raltimer++;
            if (raltimer == 1)
            {
                ra_real.sprite_index = spr_ralsei_smile_up;
                su_real.sprite_index = spr_susie_walk_right_dw_unhappy;
                var ratalk = stringsetloc("I have a special ability!", "obj_b1push2_slash_Step_0_gml_336_0");
                scr_couchtalk(ratalk, "ralsei", 2, 60);
            }
            var skip = false;
            if (raltimer > 6 && (button1_p() || button3_h()))
                skip = true;
            if (raltimer == 60 || skip == true)
            {
                ralcon = 1.04;
                raltimer = 0;
            }
        }
        if (ralcon == 1.04)
        {
            raltimer++;
            if (raltimer == 1)
            {
                scr_resetgameshowcharacter("kris");
                scr_resetgameshowcharacter("susie");
                scr_board_flash();
                snd_play(snd_explosion);
                stoolralsei = instance_create_board(2, 3, obj_pushableblock_board);
                stoolralsei.sprite_index = spr_ralsei_board_stoolforme;
                ralsei.visible = false;
                ralsei.canfreemove = false;
                safe_delete(tempstop);
                tempstop = 999;
                kris.canfreemove = true;
                ra_real.sprite_index = spr_ralsei_walk_left;
                var ratalk = stringsetloc("If there's no BLOCKs to push... then...", "obj_b1push2_slash_Step_0_gml_342_0");
                scr_couchtalk(ratalk, "ralsei", 2, 60);
            }
            var skip = false;
            if (raltimer > 6 && (button1_p() || button3_h()))
                skip = true;
            if (raltimer == 60 || skip == true)
            {
                ralcon = 1.05;
                raltimer = 0;
            }
        }
        if (ralcon == 1.05)
        {
            raltimer++;
            if (raltimer == 1)
            {
                ra_real.sprite_index = spr_ralsei_walk_up;
                var ratalk2 = stringsetloc("Push... me.", "obj_b1push2_slash_Step_0_gml_351_0_b");
                scr_couchtalk(ratalk2, "ralsei", 2, 60);
            }
            var skip = false;
            if (raltimer > 6 && (button1_p() || button3_h()))
                skip = true;
            if (raltimer == 60 || skip == true)
            {
                ralcon = 2;
                raltimer = 0;
            }
        }
        if (ralcon == 2)
        {
            raltimer++;
            if (raltimer == 15)
            {
                tenna.bounce = 1;
                var tetalk = stringsetloc("Aww, it's beautiful folks!!!", "obj_b1push2_slash_Step_0_gml_306_0");
                scr_couchtalk(tetalk, "tenna", 2, 60);
            }
            if (raltimer == 35)
            {
                var pushsong_snd = snd_init("tvromance.ogg");
                pushsong = mus_loop(pushsong_snd);
            }
            if (raltimer == 37)
            {
                lovewall = scr_dark_marker(0, 0, spr_gameshow_pushoflove);
                lovewall.image_alpha = 0;
                lovewall.depth = 89999;
                scr_lerpvar_instance(lovewall, "image_alpha", 0, 1, 30);
                snd_play_delay(snd_audience_aww, 30);
            }
            if (raltimer == 39)
            {
                var pushsprite = scr_84_get_sprite("spr_gameshow_pushingbuddies");
                pushingbuddiessign = scr_dark_marker(320, -64, pushsprite);
                pushingbuddiessign.depth = 89990;
                scr_lerpvar_instance(pushingbuddiessign, "y", -64, 0, 30, -2, "out");
            }
            if (raltimer == 75)
            {
                var raltalk = stringsetloc("W-wait,#what the...!?", "obj_b1push2_slash_Step_0_gml_346_0");
                scr_couchtalk(raltalk, "ralsei", 2, 60);
                snd_play(snd_wing);
                with (ra_real)
                    setxy(x + 10, y - 6);
                ra_real.sprite_index = spr_ralsei_shocked_behind;
                scr_shakeobj(ra_real);
            }
            if (raltimer == 105)
            {
                kris.canfreemove = true;
                stoolralsei.blocked = false;
                scr_resetgameshowcharacter("kris");
                raltimer = 0;
                ralcon++;
                kris.facing = 0;
            }
        }
        if (ralcon < 100)
        {
            if (!i_ex(obj_board_event_push2_blocktrigger))
            {
                finishtimer = 0;
                ralcon = 100;
            }
        }
        if (ralcon == 3)
        {
            raltimer++;
            if (raltimer == 60)
            {
                scr_resetgameshowcharacter("ralsei");
                ra_real.sprite_index = spr_ralsei_walk_left_blush;
                scr_resetgameshowcharacter_delay("ralsei", 120);
                var raltalk = stringsetloc("Umm, j-just, ignore all that and push me, Kris...", "obj_b1push2_slash_Step_0_gml_390_0");
                scr_couchtalk(raltalk, "ralsei", 2, 120);
            }
            var pushed = false;
            if (stoolralsei.pushcount > 0)
            {
                ralseihasbeenpushed = true;
                pushed = true;
            }
            if (pushtoomuch == 0 && stoolralsei.pushcount == 9)
            {
                scr_resetgameshowcharacter("ralsei");
                ra_real.sprite_index = spr_ralsei_walk_left_blush;
                scr_resetgameshowcharacter_delay("ralsei", 120);
                snd_play(snd_wing);
                scr_shakeobj(ra_real);
                var raltalk = stringsetloc("K... Kris??? Why are you... pushing me so much?", "obj_b1push2_slash_Step_0_gml_377_0");
                scr_couchtalk(raltalk, "ralsei", 2, 120);
                pushtoomuch = 1;
            }
            if (!ralseihasbeenpushed)
            {
                if (raltimer == 300 && !ralseihasbeenpushed)
                {
                    var raltalk = stringsetloc("K... Kris?", "obj_b1push2_slash_Step_0_gml_395_0");
                    scr_couchtalk(raltalk, "ralsei", 2, 90);
                    ra_real.sprite_index = spr_ralsei_walk_left_unhappy;
                    snd_play(snd_laughtrack_short_temp);
                    mus_volume(pushsong, 0, 30);
                }
                if (raltimer == 450 && !ralseihasbeenpushed)
                {
                    tenna.bounce = 1;
                    snd_play(snd_laughtrack_short_temp);
                    var tetalk = stringsetloc("This is getting awkward kid just push him", "obj_b1push2_slash_Step_0_gml_410_0");
                    scr_couchtalk(tetalk, "tenna", 2, 120);
                }
                if (raltimer == 600 && !ralseihasbeenpushed)
                {
                    stoolralsei.con = -2;
                    tenna.bounce = 1;
                    ra_real.sprite_index = spr_ralsei_walk_left_blush;
                    var tetalk = stringsetloc("Okay, let's go to a commercial break!", "obj_b1push2_slash_Step_0_gml_417_0");
                    scr_couchtalk(tetalk, "tenna", 2, 120);
                }
                if (raltimer == 720 && !ralseihasbeenpushed)
                {
                    safe_delete(obj_couchwriter);
                    global.interact = 1;
                    ralcon = 91;
                    instance_create(0, 0, obj_gameshow_ralseistoolcommercial);
                }
            }
        }
        if (ralcon == 91)
        {
            safe_delete(pushingbuddiessign);
            safe_delete(lovewall);
            safe_delete(obj_board_event_push2_blocktrigger);
            with (stoolralsei)
                setxy(board_tilex(4), board_tiley(3));
            for (var i = 0; i < 8; i++)
            {
                with (hazard[i])
                    instance_destroy();
            }
        }
        if (ralcon == 100)
        {
            finishtimer++;
            if (finishtimer >= 30 && !i_ex(obj_gameshow_ralseistoolcommercial))
            {
                raltimer = 0;
                mus_volume(pushsong, 0, 10);
                for (var i = 0; i < array_length(hazard); i++)
                {
                    with (hazard[i])
                    {
                        var puff = instance_create(x, y, obj_board_smokepuff);
                        with (puff)
                            scr_depth_board();
                        instance_destroy();
                    }
                }
                snd_play_pitch(snd_impact_bc, 1.2);
                snd_play_pitch(snd_impact_bc, 0.6);
                if (i_ex(lovewall) && i_ex(pushingbuddiessign))
                {
                    with (obj_lerpvar)
                    {
                        if (target == other.pushingbuddiessign || target == other.lovewall)
                            instance_destroy();
                    }
                }
                if (i_ex(pushingbuddiessign))
                {
                    scr_lerpvar_instance(pushingbuddiessign, "y", pushingbuddiessign.y, -64, 30);
                    scr_doom(pushingbuddiessign, 31);
                }
                if (i_ex(lovewall))
                {
                    scr_lerpvar_instance(lovewall, "image_alpha", lovewall.image_alpha, 0, 30);
                    scr_doom(lovewall, 31);
                }
                ralcon = 101;
                with (obj_event_manager)
                    trigger_event(UnknownEnum.Value_0, UnknownEnum.Value_18);
            }
        }
        if (ralcon == 101)
        {
            with (obj_pushableblock_board)
            {
                if (extflag == "push2")
                {
                    var replacementblock = instance_create(x, y, obj_board_solid);
                    replacementblock.sprite_index = sprite_index;
                    replacementblock.image_index = image_index;
                    scr_darksize(replacementblock);
                    replacementblock.visible = true;
                    replacementblock.depth = depth;
                    instance_destroy();
                }
            }
            ralsei.x = stoolralsei.x;
            ralsei.y = stoolralsei.y;
            ralsei.visible = true;
            safe_delete(stoolralsei);
            with (ralsei)
            {
                var puff = instance_create(x, y, obj_board_smokepuff);
                puff.image_blend = #13D26F;
                scr_board_caterpillar_interpolate_ralsei();
                canfreemove = true;
                follow = true;
            }
            scr_resetgameshowcharacter("susie");
            scr_resetgameshowcharacter("ralsei");
            scr_board_gridreset();
            with (obj_actor_tenna)
                bounce = 1;
            var tetalk = stringsetloc("What a great puzzle, folks!", "obj_b1push2_slash_Step_0_gml_496_0");
            scr_couchtalk(tetalk, "tenna", 2, 90);
            ra.follow = 0;
            kr.canfreemove = true;
            global.interact = 0;
            solved = 1;
            ralcon = 102;
            mus_volume(global.currentsong[1], 1, 30);
            snd_stop(pushsong);
            visited = 1;
            scr_pathfind_end("susie");
        }
    }
    if (solved)
    {
        if (visited == 0)
        {
            con++;
            visited = 1;
            ra.follow = true;
        }
        if (suwalkcon == 0 && obj_board_camera.con == 0 && !i_ex(obj_chaseenemy_board))
        {
            with (obj_mainchara_board)
            {
                if (name == "susie")
                    sleepy = true;
            }
            scr_pathfind_to_point("susie", 8, choose(3, 4), 0);
            suwalkcon = 1;
        }
    }
}
else
{
    suwalkcon = 0;
    if (solved == 1 && made == 0)
    {
        maketimer++;
        if (maketimer > 30)
        {
            made = 1;
            chaseenemy = instance_create(x + 160, y + 64, obj_chaseenemy_board_spawner);
            chaseenemy.encounterno = 132;
            chaseenemy.encounterflag = 581;
        }
    }
    if (solved && visited)
        visited = 0;
}

enum UnknownEnum
{
    Value_0,
    Value_18 = 18
}
