scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
    if (init == 0)
    {
        tennanpc = instance_create(354, 320, obj_npc_sign);
        with (tennanpc)
        {
            extflag = "tenna";
            sprite_index = spr_board_triggerarea;
            depth = -99;
            visible = false;
            image_xscale = 6;
            image_yscale = 5;
        }
        consolenpc = instance_create(266, 318, obj_npc_sign);
        with (consolenpc)
        {
            extflag = "console";
            sprite_index = spr_board_triggerarea;
            depth = -99;
            visible = false;
            image_xscale = 4;
            image_yscale = 2.375;
        }
        _solid = instance_create(0, 300, obj_solidblocksized);
        with (_solid)
            image_xscale = 16;
        door = instance_create(634, 340, obj_doorAny);
        with (door)
        {
            image_yscale = 20;
            doorRoom = room_dw_b3bs_interstitial;
            doorEntrance = 1;
        }
        init = 1;
    }
    if (con == 0 && obj_board_camera.con == 0)
    {
        snd_free_all();
        with (obj_mainchara_board)
            controlled = 0;
        timer = 0;
        con = 1;
        kris.depth -= 5;
    }
    if (con == 1)
    {
        timer++;
        if (timer == 15)
        {
            kr_real.sprite_index = kr_real.rsprite;
            ra_real.sprite_index = spr_ralsei_walk_right_unhappy;
            su_real.sprite_index = spr_susie_walk_right_dw_unhappy;
            tenna.bounce = 1;
            var tetalk = stringsetloc("There it is! The door to the stairs!!!", "obj_b3stairs_slash_Step_0_gml_75_0");
            scr_couchtalk(tetalk, "tenna", 2, 60);
        }
        if (timer == 75)
        {
            ra_real.sprite_index = spr_ralsei_head_down_sad_right;
            var ratalk = stringsetloc("Wait... why does that door have 2 Q's on it?", "obj_b3stairs_slash_Step_0_gml_81_0");
            scr_couchtalk(ratalk, "ralsei", 2, 60);
        }
        if (timer == 135)
        {
            su_real.sprite_index = spr_susie_shiver_stand;
            var sutalk = stringsetloc("Ugh, not more quizzes...", "obj_b3stairs_slash_Step_0_gml_87_0");
            scr_couchtalk(sutalk, "susie", 2, 60);
        }
        if (timer == 195)
        {
            tenna.bounce = 1;
            var tetalk = stringsetloc("2 Q'S!? What the -- it shouldn't look like that!", "obj_b3stairs_slash_Step_0_gml_93_0");
            scr_couchtalk(tetalk, "tenna", 2, 80);
        }
        if (timer == 275)
        {
            tenna.bounce = 1;
            var tetalk = stringsetloc("Mike, the door please!!!", "obj_b3stairs_slash_Step_0_gml_99_0");
            scr_couchtalk(tetalk, "tenna", 2, 80);
            timer = 0;
            con = 1.9;
        }
    }
    if (con == 1.9)
    {
        timer++;
        if (timer == 80)
        {
            with (scr_board_marker(1792, 1632, spr_board_b3stairdoor_big, 0, 999995, 2))
                setxy_board(x, y);
            for (var i = 0; i < 5; i++)
            {
                for (var ii = 0; ii < 4; ii++)
                    instance_create(300 + (28 * i), (138 + (28 * ii)) - 32, obj_board_smokepuff);
            }
            snd_play(snd_board_splash);
            snd_play_x(snd_board_splash, 0.6, 0.8);
            snd_play_x(snd_board_splash, 0.6, 1.4);
        }
        if (timer == 95)
        {
            kr_real.sprite_index = kr_real.usprite;
            su_real.sprite_index = spr_susie_shocked_behind;
            su_real.x += 20;
            ra_real.sprite_index = spr_ralsei_shocked_behind;
            scr_shakeobj(su_real);
            scr_shakeobj(ra_real);
            snd_play(snd_wing);
            snd_play(snd_noise);
        }
        if (timer == 110)
        {
            tenna.bounce = 1;
            var tetalk = stringsetloc("You need twenty Q's to open this door, folks!", "obj_b3stairs_slash_Step_0_gml_173_0");
            scr_couchtalk(tetalk, "tenna", 2, 70);
        }
        if (timer == 180)
        {
            scr_resetgameshowcharacter("ralsei");
            scr_resetgameshowcharacter("susie");
            kr_real.sprite_index = kr_real.rsprite;
            ra_real.sprite_index = spr_ralsei_shocked_standing_right;
            su_real.sprite_index = spr_susie_walk_right_dw_unhappy;
            var ratalk = stringsetloc("2... 20 Q's!?", "obj_b3stairs_slash_Step_0_gml_184_0");
            scr_couchtalk(ratalk, "ralsei", 2, 60);
        }
        if (timer == 240)
        {
            music = mus_initloop("ch3_board3.ogg");
            snd_pitch(music, muspitch);
            scr_lerpvar("muspitch", muspitch, 2, 450);
            pitchactive = 1;
            tenna.bounce = 1;
            var tetalk = stringsetloc("That's right! As we speak, twenty more areas have been unlocked in TV-tropolis!", "obj_b3stairs_slash_Step_0_gml_195_0");
            scr_couchtalk(tetalk, "tenna", 2, 90);
        }
        if (timer == 330)
        {
            snd_pitch(music, 1);
            ra_real.sprite_index = spr_ralsei_walk_right_unhappy;
            tenna.bounce = 1;
            var tetalk = stringsetloc("Backtrack and conquer each district's quiz, then you'll unlock the stairs...", "obj_b3stairs_slash_Step_0_gml_204_0");
            scr_couchtalk(tetalk, "tenna", 2, 80);
        }
        if (timer == 410)
        {
            snd_pitch(music, 1.2);
            snd_volume(music, 1, 0);
            tenna.bounce = 1;
            var tetalk = stringsetloc("Allowing you to finally hunt for that elevator card!", "obj_b3stairs_slash_Step_0_gml_212_0");
            scr_couchtalk(tetalk, "tenna", 2, 60);
        }
        if (timer == 470)
        {
            tenna.bounce = 1;
            var tetalk = stringsetloc("On which one of TV tower's 100 floors of fun could it be?!", "obj_b3stairs_slash_Step_0_gml_218_0");
            scr_couchtalk(tetalk, "tenna", 2, 60);
        }
        if (timer == 530)
        {
            timer = 0;
            con = 2;
        }
    }
    if (con == 2)
    {
        timer++;
        if (timer == 1)
        {
            with (tenna)
            {
                scr_lerpvar("x", x, x + 20, 8, -1, "out");
                scr_lerpvar("y", y, y - 60, 8, -1, "out");
            }
            safe_delete(obj_couchwriter);
            tenna.preset = 2;
            tenna.bounce = 1;
            var tetalk = stringsetloc("All your favorite#programs! All your#favorite tools!", "obj_b3stairs_slash_Step_0_gml_245_0");
            var tx1 = 454;
            var ty1 = 222;
            var tx2 = tx1 + 20;
            var ty2 = ty1 + 48;
            scr_tennabubble_xytail(tetalk, tx1, ty1, tx2, ty2, 60);
        }
        if (timer == 40)
        {
            with (tenna)
            {
                scr_lerpvar("x", x, x - 40, 8, -1, "out");
                scr_lerpvar("y", y, y - 40, 8, -1, "out");
            }
            tenna.preset = 17;
            tenna.bounce = 1;
            tenna.image_speed = 1;
            var tetalk = stringsetloc("You kids are#gonna love the#VHS floor!", "obj_b3stairs_slash_Step_0_gml_265_0");
            var tx1 = 454;
            var ty1 = 182;
            var tx2 = 458;
            var ty2 = 228;
            scr_tennabubble_xytail(tetalk, tx1, ty1, tx2, ty2, 60);
        }
        if (timer == 80)
        {
            tenna.preset = 22;
            tenna.bounce = 1;
            with (tenna)
            {
                scr_lerpvar("x", x, x + 60, 2, -1, "out");
                scr_lerpvar("y", y, y - 40, 2, -1, "out");
            }
            var tetalk = stringsetloc("The wood#panelled car#tournament!", "obj_b3stairs_slash_Step_0_gml_284_0");
            var tx1 = 448;
            var ty1 = 162;
            var tx2 = tx1 + 20;
            var ty2 = ty1 + 48;
            scr_tennabubble_xytail(tetalk, tx1, ty1, tx2, ty2, 60);
        }
        if (timer == 120)
        {
            with (tenna)
            {
                scr_lerpvar("x", x, x - 60, 2, -1, "out");
                scr_lerpvar("y", y, y - 40, 2, -1, "out");
            }
            tenna.bounce = 1;
            tenna.sprite_index = spr_tenna_point_left;
            var tetalk = stringsetloc("New powdered#drinks!", "obj_b3stairs_slash_Step_0_gml_303_0");
            var tx1 = 452;
            var ty1 = 162;
            var tx2 = 452;
            var ty2 = 204;
            scr_tennabubble_xytail(tetalk, tx1, ty1, tx2, ty2, 60);
        }
        if (timer == 160)
        {
            with (tenna)
            {
                scr_lerpvar("x", x, x + 80, 2, -1, "out");
                scr_lerpvar("y", y, y - 20, 2, -1, "out");
            }
            tenna.bounce = 1;
            tenna.sprite_index = spr_tenna_dance_cabbage;
            tenna.image_speed = 3;
            var tetalk = stringsetloc("The unused#lawnmower puzzles!", "obj_b3stairs_slash_Step_0_gml_325_0");
            var tx1 = 452;
            var ty1 = 111;
            var tx2 = 512;
            var ty2 = 153;
            scr_tennabubble_xytail(tetalk, tx1, ty1, tx2, ty2, 60);
        }
        if (timer == 130)
            su_real.sprite_index = spr_susie_walk_right_dw;
        if (timer == 170)
            sugurt = 1;
        if (timer == 200)
        {
            tenna.bounce = 1;
            tenna.sprite_index = spr_tenna_point_left;
            tenna.facing = "r";
            var tetalk = stringsetloc("Don't adjust your#set, because#we're", "obj_b3stairs_slash_Step_0_gml_349_0");
            var tx1 = 502;
            var ty1 = 124;
            var tx2 = 502;
            var ty2 = 174;
            scr_tennabubble_xytail(tetalk, tx1, ty1, tx2, ty2, 60);
        }
    }
    if (con == 3)
    {
        timer++;
        if (timer == 1)
        {
            var sutalk = stringsetloc("Oops.", "obj_b3stairs_slash_Step_0_gml_366_0");
            scr_couchtalk(sutalk, "susie", 2, 60);
        }
        if (timer == 30)
        {
            tenna.preset = 0;
            tenna.sprite_index = spr_tenna_pose_headraised;
            tenna.bounce = 1;
            var tetalk = stringsetloc("Huh?", "obj_b3stairs_slash_Step_0_gml_374_0");
            var tx1 = 424;
            var ty1 = 138;
            var tx2 = 454;
            var ty2 = 164;
            var bub = scr_tennabubble_xytail(tetalk, tx1, ty1, tx2, ty2, 80);
            bub.lifetime = 60;
        }
        if (timer == 90)
        {
            safe_delete(obj_tennatalkbubble);
            su_real.sprite_index = spr_susie_confused_right;
            su_real.y += 4;
            su_real.x += 2;
            var sutalk = stringsetloc("Uhh... yogurt... got on my controller. ...", "obj_b3stairs_slash_Step_0_gml_389_0");
            scr_couchtalk(sutalk, "susie", 2, 60);
        }
        if (timer == 150)
        {
            safe_delete(obj_couchwriter);
            timer = 0;
            con = 4;
        }
    }
    if (con == 4)
    {
        timer++;
        if (timer == 1)
        {
            scr_resetgameshowcharacter("susie");
            scr_resetgameshowcharacter("ralsei");
            scr_resetgameshowcharacter("kris");
            su_real.sprite_index = spr_susie_walk_right_dw_unhappy;
            with (tenna)
            {
                setxy(544, 376);
                sprite_index = spr_tenna_attack;
                scr_jump_to_point(394, 366, 64, 8);
            }
        }
        if (timer == 6)
        {
            scr_resetgameshowcharacter("kris");
            scr_resetgameshowcharacter("susie");
            scr_resetgameshowcharacter("ralsei");
        }
        if (timer == 9)
        {
            tenna.preset = 12;
            snd_play(snd_impact);
        }
        if (timer == 10)
        {
            scr_shakeobj(tenna);
            sirensactive = 1;
            alarmsounds = 1;
            with (scr_board_marker(board_tilex(0), board_tiley(0), spr_board_yogurtemergency, 0, 990000, 2))
                image_index = 0;
            var tetalk;
            with (scr_board_marker(board_tilex(1), board_tiley(2), spr_board_yogurtemergency_text, 1, 989995, 1, 0))
                tetalk = stringsetloc("What the--!?#Emergency!! Stop#the cameras!!!", "obj_b3stairs_slash_Step_0_gml_442_0");
            var tx1 = 310;
            var ty1 = 102;
            var tx2 = 350;
            var ty2 = 152;
            var bub = scr_tennabubble_xytail(tetalk, tx1, ty1, tx2, ty2, 80);
            bub.lifetime = 90;
        }
        if (timer == 100)
        {
            tenna.preset = 18;
            tenna.animchangetimer = 2;
            with (tenna)
                scr_lerpvar("speedscale", 0.8, 3, 90);
            var tetalk = stringsetloc("Commercial break!!!#Commercial break!!!", "obj_b3stairs_slash_Step_0_gml_458_0");
            var tx1 = 346;
            var ty1 = 84;
            var tx2 = 362;
            var ty2 = 130;
            var bub = scr_tennabubble_xytail(tetalk, tx1, ty1, tx2, ty2, 80);
            bub.lifetime = 110;
        }
        if (timer == 210)
        {
            scr_lerpvar("lightfade", 0, 1, 120, 2, "out");
            tenna.preset = 2;
            tenna.bounce = 1;
            tenna.speedscale = 1;
            var tetalk = stringsetloc("You kids get to the#green room and wipe#that down right now!", "obj_b3stairs_slash_Step_0_gml_474_0");
            var tx1 = 346;
            var ty1 = 84;
            var tx2 = 362;
            var ty2 = 130;
            with (scr_board_marker(board_tilex(0), board_tiley(0), spr_technicaldifficultyBars, 0, 989990))
            {
                image_xscale = 27.428571428571427;
                image_yscale = 64;
            }
            var bub = scr_tennabubble_xytail(tetalk, tx1, ty1, tx2, ty2, 80);
            bub.lifetime = 120;
            with (tenna)
                scr_depth_alt();
        }
        if (timer == 230)
        {
            with (obj_mainchara_board)
                controlled = 0;
            with (obj_ch3_gameshow.wires)
            {
                image_alpha = 0;
                snd_play(snd_item);
            }
            with (kr_real)
                scr_lerpvar("y", y, y - 20, 5);
            kr_real.image_speed = 0.125;
            su_real.image_speed = 0.125;
            ra_real.image_speed = 0.125;
            with (obj_caterpillarchara)
                scr_lerpvar("y", y, y - 20, 5);
        }
        if (timer == 235)
        {
            kr_real.image_speed = 0;
            su_real.image_speed = 0;
            ra_real.image_speed = 0;
            with (obj_caterpillarchara)
            {
                fun = 0;
                follow = true;
                ignoredepth = 0;
                scr_caterpillar_interpolate();
            }
            global.plot = 199;
            alarmsounds = 0;
            obj_mainchara.y -= 20;
            obj_mainchara.fun = 0;
            obj_mainchara.freeze = 0;
            obj_mainchara.ignoredepth = 0;
            global.facing = 0;
            global.flag[6] = 0;
            global.flag[7] = 0;
            global.hp[1] = global.maxhp[1];
            global.hp[2] = global.maxhp[2];
            global.hp[3] = global.maxhp[3];
        }
        if (timer == 330)
        {
            scr_lerpvar("lightfade", 0, 1, 120, 2, "out");
            var tetalk = stringsetloc("Everyone hurry,#take your controllers!#They could be#CONTAMINATED!!", "obj_b3stairs_slash_Step_0_gml_543_0");
            var tx1 = 346;
            var ty1 = 84;
            var tx2 = 362;
            var ty2 = 130;
            var bub = scr_tennabubble_xytail(tetalk, tx1, ty1, tx2, ty2, 80);
            bub.lifetime = 120;
            with (tenna)
                scr_depth_alt();
            con = 5;
        }
    }
}
else
{
}
if (sugurt == 1)
{
    gurttimer++;
    if (gurttimer == 1)
    {
        snd_play(snd_wing);
        yogurt = scr_dark_marker(su_real.x + 46 + 8, su_real.y + 22 + 16, spr_gameshow_yogurttube_centerpoint);
        yogurt.depth = kr_real.depth;
        su_real.sprite_index = spr_susie_holdright;
        scr_shakeobj(yogurt, 4);
    }
    if (gurttimer == 30)
    {
        snd_play(snd_board_throw);
        su_real.sprite_index = spr_susie_tossup;
        yogurt.sprite_index = spr_gameshow_yogurttube_centerpoint;
        yogurt.y -= 22;
        yogurt.x -= 4;
        yogurt.vspeed = -12;
        yogurt.gravity = 0.8;
        with (yogurt)
            scr_lerpvar("x", x, x - 22, 30, 2, "out");
        with (yogurt)
            scr_lerpvar("image_angle", 0, 180, 30);
    }
    if (gurttimer == 40)
        su_real.sprite_index = su_real.usprite;
    if (gurttimer == 60)
    {
        snd_free_all();
        pitchactive = 0;
        snd_play(snd_splat);
        kr_real.sprite_index = kr_real.lsprite;
        ra_real.sprite_index = ra_real.lsprite;
        tenna.wobbleamt = 0;
    }
    if (gurttimer == 61)
    {
        timer = 0;
        con++;
    }
}
if (con == 5)
{
    if (obj_mainchara.x < 20)
    {
        scr_speaker("tenna");
        msgsetloc(0, "* Wrong way^1! The green room is the other direction!!!/%", "obj_b3stairs_slash_Step_0_gml_617_0");
        if (wrongleavecount == 1)
        {
            scr_speaker("tenna");
            msgsetloc(0, "* Come on and work with me here^1, kids!/%", "obj_b3stairs_slash_Step_0_gml_621_0");
        }
        if (wrongleavecount == 2)
        {
            scr_speaker("tenna");
            msgsetloc(0, "* That yogurt is starting to curdle!!!/%", "obj_b3stairs_slash_Step_0_gml_626_0");
        }
        if (wrongleavecount > 2)
        {
            scr_speaker("tenna");
            msgsetloc(0, "* .../%", "obj_b3stairs_slash_Step_0_gml_631_0");
        }
        else
        {
            tenna.bounce = 1;
        }
        wrongleavecount++;
        con = 6;
        var d = d_make();
        d.side = 0;
        global.interact = 1;
    }
}
if (con == 6 && !d_ex())
{
    con = 5;
    obj_mainchara.x = 20;
    global.facing = 1;
    global.interact = 0;
}
if (sirensactive)
    sirensiner++;
if (i_ex(redscreen))
    redscreen.image_alpha = abs(sin(sirensiner / 30) / 2) - lightfade;
if (pitchactive)
    snd_pitch(music, muspitch);
if (alarmsounds)
{
    alarmtimer++;
    if ((alarmtimer % 20) == 0)
    {
        alarmcount++;
        var alarmpitch = 0;
        if ((alarmcount % 2) == 0)
            alarmpitch = 0.3;
        snd_play_x(snd_tv_alarm, 1, 1.1 + alarmpitch);
    }
}
