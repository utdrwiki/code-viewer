scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
    if (suwalk == 0 && obj_board_camera.con == 0)
    {
        suwalktimer++;
        if (susie.y > 170)
        {
            if (suwalktimer == 1)
                ralsei.follow = true;
            if (suwalktimer == 5)
            {
                scr_play_recording("susie", "0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0W0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0D0D");
                susie.sleepy = true;
            }
        }
        else
        {
            if (suwalktimer == 1)
                ralsei.follow = true;
            if (suwalktimer == 5)
            {
                scr_play_recording("susie", "0W0W0R0R0R0R0R0R0R0RU0U0U0U0U0U0U0U0U0U0U0U0U0U0U0RU0RU0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0D0D0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W");
                susie.sleepy = true;
            }
        }
        if (solved)
        {
            if (scr_board_checklocation("susie", 240, 192, 1))
            {
                suwalktimer = 0;
                suwalk = 3;
            }
        }
    }
    var _blocked = false;
    if (i_ex(obj_board_playercamera))
        _blocked = true;
    if (suwalk == 3)
    {
        if (!_blocked)
            suwalktimer++;
        if (suwalktimer == 10 && !_blocked)
            scr_play_recording("susie", "0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0RD0RD0RD0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0LD0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0LR0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0W0W0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0W0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0LR0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0LR0L0L0L0L0L0L0L0L0L0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0LU0LU0LU0L0L0L0L0L0L0L0L0L0L0W0W0W0W0W0W0R0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W");
        if (_blocked && susie.susierecordcon == 2)
            susie.susierecordcon = 999;
        if (!_blocked && susie.susierecordcon == 999)
            susie.susierecordcon = 2;
        if (suwalktimer == 50 && drinkingit == 0 && !_blocked)
        {
            drinkingit = 0.5;
            var sutalk = stringsetloc("Mmm, I'm drinking it!", "obj_b2lancersalsa_slash_Step_0_gml_74_0");
            scr_couchtalk(sutalk, "susie", 2, 80);
        }
        if (suwalktimer == 110 && drinkingit == 0.5 && !_blocked)
        {
            drinkingit = 1;
            var ratalk = stringsetloc("You're not drinking it!", "obj_b2lancersalsa_slash_Step_0_gml_80_0");
            scr_couchtalk(ratalk, "ralsei", 2, 80);
        }
        if (suwalktimer >= 201)
        {
            if (scr_board_checklocation("susie", 272, 192, 4))
            {
                suwalk = 4;
                suwalktimer = 0;
            }
        }
    }
    if (con == 0 && obj_board_camera.con == 0)
    {
        if (!solved)
        {
            if (obj_board_inventory.lancer == true)
            {
                with (obj_board_trigger)
                {
                    if (extflag == "b2lancersalsa")
                    {
                        if (place_meeting(x, y, obj_mainchara_board))
                        {
                            other.con = 1;
                            other.timer = 0;
                            global.interact = 1;
                        }
                    }
                }
            }
            else if (commentary == 0)
            {
                con = 20;
                commentary = 1;
            }
            else if (commentary == 1)
            {
                con = 30;
            }
        }
    }
    if (grayspring == 0 && con >= 20)
    {
        var doline = false;
        if (i_ex(obj_board_grayregion))
        {
            with (obj_board_grayregion)
            {
                var inst = instance_place(x, y, obj_board_trigger);
                if (i_ex(inst))
                {
                    if (inst.extflag == "b2inthesauce")
                        doline = true;
                }
            }
        }
        if (doline)
        {
            timer = 0;
            con = 40;
            grayspring = 1;
            var tetalk = stringsetloc("Sorry, the \"grey\" spring is blocked up.", "obj_b2lancersalsa_slash_Step_0_gml_86_0");
            tenna.bounce = true;
            scr_couchtalk(tetalk, "tenna", 2, 70);
        }
    }
    if (con == 20 && tennahere())
    {
        timer++;
        if (timer == 45)
        {
            tenna.bounce = true;
            var tetalk = stringsetloc("Oh no! the green spring is blocked up!", "obj_b2lancersalsa_slash_Step_0_gml_98_0");
            scr_couchtalk(tetalk, "tenna", 2, 80);
        }
        if (timer == 125)
        {
            su_real.sprite_index = su_real.rsprite;
            var sutalk = stringsetloc("Guess we'll have to squeeze Ralsei into a green smoothie.", "obj_b2lancersalsa_slash_Step_0_gml_104_0");
            scr_couchtalk(sutalk, "susie", 2, 90);
        }
        if (timer == 190)
        {
            scr_shakeobj(ra_real);
            snd_play(snd_wing);
            ra_real.sprite_index = spr_ralsei_surprised_left_walk;
            var ratalk = stringsetloc("H-huh?! Make smoochies, not smoothies...", "obj_b2lancersalsa_slash_Step_0_gml_110_0");
            scr_couchtalk(ratalk, "ralsei", 2, 90);
        }
        if (timer > 175 && !i_ex(obj_couchwriter))
            scr_resetgameshowcharacter("all");
    }
    if (con == 30)
    {
        timer++;
        if (timer == 60)
        {
            var ratalk = stringsetloc("We'll need something to get out that green liquid...", "obj_b2lancersalsa_slash_Step_0_gml_123_0");
            scr_couchtalk(ratalk, "ralsei", 2, 90);
        }
    }
    if (con == 1)
    {
        timer++;
        if (timer == 1)
        {
            lancer = scr_board_marker(88, 170, spr_board_lancer_down, 0, 5000);
            lancer.autodepth = false;
            obj_board_inventory.lancer = false;
        }
        if (timer == 2)
        {
            with (lancer)
                scr_jump_to_point(board_tilex(-0.5), board_tiley(2), 12, 12);
            snd_play(snd_jump);
        }
        if (timer == 15)
        {
            snd_play(snd_lancerhonk);
            lancer.sprite_index = spr_board_lancer_spin;
            lancer.image_index = 0;
        }
        if (timer == 17)
            lancer.image_index = 1;
        if (timer == 19)
            lancer.image_index = 2;
        if (timer == 21)
            lancer.image_index = 3;
        if (timer == 23)
            lancer.image_index = 0;
        if (timer == 28)
        {
            scr_speaker("lancer");
            msgsetloc(0, "IS THAT A GREEN BATH!? LEAVE IT TO ME TO GET IT FREE!/", "obj_b2lancersalsa_slash_Step_0_gml_156_0");
            msgnextloc("DIG^1^1, DIG^1^1, DIG!/%", "obj_b2lancersalsa_slash_Step_0_gml_157_0");
            var d = bw_make();
            d.side = 1;
            scr_boardlancer_voice();
            con = 2;
            timer = 2;
        }
    }
    if (con == 2 && !bw_ex())
    {
        con = 3;
        timer = 0;
        snd_free_all();
        mus_play_ext("board_lancer_dig.ogg", true);
    }
    var lancerspeed = 4;
    if (con == 3)
    {
        timer++;
        if (timer == 4)
        {
            playdigsound = true;
            lancer.sprite_index = spr_board_lancer_dug;
            lancer.image_index = 1;
        }
        if (timer == 8)
        {
            lancer.hspeed = lancerspeed;
            con++;
        }
    }
    if (con == 4)
    {
        if (lancer.x >= board_tilex(0.5))
            lancer.depth = depth - 1;
        if (lancer.x >= board_tilex(1) && lancer.hspeed > 0)
        {
            with (lancer)
            {
                x = board_tilex(1);
                hspeed = 0;
                vspeed = -lancerspeed;
                image_index = 2;
            }
        }
        if (lancer.y <= board_tiley(0) && lancer.vspeed < 0)
        {
            with (lancer)
            {
                y = board_tiley(0);
                vspeed = 0;
                hspeed = lancerspeed;
                image_index = 1;
            }
            con = 5;
            timer = 0;
        }
    }
    if (con == 5)
    {
        if (lancer.x >= board_tilex(10) && lancer.hspeed > 0)
        {
            with (lancer)
            {
                x = board_tilex(10);
                hspeed = 0;
                vspeed = lancerspeed;
                image_index = 0;
            }
        }
        if (lancer.y >= board_tiley(7) && lancer.vspeed > 0)
        {
            with (lancer)
            {
                y = board_tiley(7);
                vspeed = 0;
                hspeed = -lancerspeed;
                image_index = 3;
            }
        }
        if (lancer.x <= board_tilex(6) && lancer.hspeed < 0)
        {
            with (lancer)
            {
                x = board_tilex(6);
                hspeed = 0;
                vspeed = -lancerspeed;
                image_index = 2;
            }
        }
        if (lancer.x == board_tilex(6) && lancer.y == board_tiley(6))
        {
            snd_free_all();
            lancer.hspeed = 0;
            lancer.vspeed = 0;
            con++;
            timer = 0;
            lancer.sprite_index = spr_board_lancer_spin;
            lancer.image_index = 0;
            playdigsound = false;
        }
    }
    if (con == 6)
    {
        var timetofloat = 30;
        lancer.sprite_index = spr_board_lancer_floatate;
        lancer.image_speed = 0;
        lancer.image_index = 0;
        with (lancer)
            scr_lerpvar("image_speed", 0, 0.35, timetofloat, 2, "out");
        scr_lerpvar("lancy", 284, 164, timetofloat, 2, "out");
        scr_delay_var("waterfloat", true, timetofloat + 1);
        con = 7;
    }
    if (con == 7)
    {
        if (lancy <= board_tiley(5.5))
        {
            safe_delete(myblock);
            black = scr_board_marker(board_tilex(6), board_tiley(5), spr_whitepx);
            black.image_blend = c_black;
            black.depth = 999999;
            black.image_xscale = 32;
            black.image_yscale = 32;
            var puff = instance_create(board_tilex(6), board_tiley(5), obj_board_smokepuff);
            puff.image_blend = #C46053;
            puff.depth = 999900;
            snd_play(snd_board_splash);
            con = 8;
        }
    }
    if (con == 8 && waterfloat == true)
    {
        ralsei.follow = true;
        scr_board_caterpillar_interpolate_ralsei();
        scr_boardlancer_voice();
        scr_speaker("lancer");
        msgsetloc(0, "LOOKS LIKE I STRUCK GREEN GOLD^1! TAKE A PICTURE FOR THE AGES!/%", "obj_b2lancersalsa_slash_Step_0_gml_309_0");
        bw_make();
        mus_initloop(obj_ch3_gameshow.boardmusic);
        instance_create_depth(x, y, depth - 10, obj_b2perfumespring_triggerarea);
        con++;
    }
    if (con == 9 && !bw_ex())
    {
        global.interact = 0;
        con = 0;
        solved = 1;
    }
    if (waterfloat == true)
    {
        water++;
        lancy = 164 + (sin(water / 8) * 8);
        if ((water % 6) == 0)
        {
            var bubble = scr_board_marker(x + 160 + 6 + scr_even(random_range(0, 16)), (y + 160 + 28) - scr_even(random_range(0, 32)), spr_whitepx, 0, depth - 10, choose(2, 4));
            bubble.image_blend = #C8E76C;
            var endtime = irandom_range(10, 20);
            with (bubble)
                scr_lerpvar("y", y, other.lancy + irandom(32), endtime);
            scr_doom(bubble, endtime);
        }
    }
    if (i_ex(lancer))
    {
        if (lancy < (board_tiley(6) + 16))
            lancer.y = scr_even(lancy - 16);
    }
}
else
{
    if (drinkingit == 0.5)
        drinkingit = 99;
    suwalk = 0;
    suwalktimer = 0;
    con = 0;
    timer = 0;
}
if (playdigsound)
{
    digindex++;
    if ((digindex % 4) == 0)
    {
        snd_stop(snd_board_text_main);
        snd_play_x(snd_board_text_main, 0.6, 0.8 + random_range(0, 0.1));
    }
}
