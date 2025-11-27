if (su == 0)
{
    with (obj_mainchara_board)
    {
        if (name == "susie")
            other.su = id;
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
if (ra == 0)
{
    with (obj_mainchara_board)
    {
        if (name == "ralsei")
            other.ra = id;
    }
}
if (tenna == 0)
    tenna = obj_actor_tenna;
if (realralsei == 0)
{
    with (obj_caterpillarchara)
    {
        if (name == "ralsei")
            other.realralsei = id;
    }
}
if (realsusie == 0)
{
    with (obj_caterpillarchara)
    {
        if (name == "susie")
            other.realsusie = id;
    }
}
var mytrigger = "susiedig";
if (scr_debug())
{
    if (keyboard_check_pressed(ord("F")))
    {
        if (ra.myhealth > 1)
            ra.myhealth = 1;
    }
}
if (active == 1)
{
    if (global.interact == 0)
    {
        if (con == 0 && obj_board_camera.con == 0 && global.flag[1020] == 0)
        {
            ra.follow = true;
            if (susiewalkcon == 0)
            {
                var walk = "0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0R0R0R0R0R0R0R0R0R0R0R0R0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0L0L0L0L0L0L0L0L0L0L0L0L0L0L0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0D0D0D0D0D0D0D0D0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0W0W0W0D0D0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W";
                if (visit > 0)
                {
                    var visit2walk0 = "0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0W0W0W0W0W0L0L0L0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0U0U0U0U0U0U0U0U0U0L0L0L0L0L0L0L0L0L0L0L0L0L0L0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0D0D0D0D0D0D0D0W0W0W0R0R0R0R0R0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0L0L0L0L0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0R0R0R0R0R0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0L0L0L0L0L0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0R0R0R0R0R0W0W0W0W0W0W0W0W0W0D0D0D0D0D0D0D0D0D0D0D0D0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R";
                    var visit2walk1 = "0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0U0U0U0U0U0U0U0U0U0U0U0U0W0W0W0R0R0R0R0R0R0R0R0R0R0R0R0R0R0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0D0D0D0D0D";
                    var visit2walk2 = "0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0D0D0D0D0D0D0D0D0D0D0R0R0R0R0R0R0R0R0R0U0U";
                    walk = visit2walk2;
                    su.sleepy = true;
                }
                scr_play_susie_recording(walk);
                sustalktimer = 0;
                if (visit == 0)
                    susiewalkcon = 1;
                else
                    susiewalkcon = 20;
            }
            if (susiewalkcon == 1)
            {
                sustalktimer++;
                if (sustalktimer == 5)
                {
                    visit++;
                    tenna.bounce = 1;
                    var tetalk = stringsetloc("Uh oh! Weed alert!", "obj_b1susiedig_slash_Step_0_gml_64_0");
                    scr_couchtalk(tetalk, "tenna", 2, 61);
                }
                if (sustalktimer == 65)
                {
                    tenna.bounce = 1;
                    var tetalk = stringsetloc("You may find plucking these plants is \"key\"!", "obj_b1susiedig_slash_Step_0_gml_70_0");
                    scr_couchtalk(tetalk, "tenna", 2, 71);
                }
                if (sustalktimer == 135)
                {
                    tenna.bounce = 1;
                    var tetalk = stringsetloc("But you can't grip this grass without a \"special treasure.\"", "obj_b1susiedig_slash_Step_0_gml_76_0");
                    scr_couchtalk(tetalk, "tenna", 2, 71);
                }
                if (sustalktimer == 205)
                {
                    tenna.bounce = 1;
                    var tetalk = stringsetloc("Can you find it somewhere on the board?", "obj_b1susiedig_slash_Step_0_gml_82_0");
                    scr_couchtalk(tetalk, "tenna", 2, 70);
                }
                if (sustalktimer == 575)
                {
                    tenna.bounce = 1;
                    snd_play(snd_laughtrack_short_temp);
                    var tetalk = stringsetloc("Guys. It's not in this room. It's in another room. Please.", "obj_b1susiedig_slash_Step_0_gml_89_0");
                    scr_couchtalk(tetalk, "tenna", 2, 90);
                }
            }
        }
        if (con == 0 && obj_board_camera.con == 0 && global.flag[1020] == 1)
        {
            var triggered = 0;
            with (kr)
            {
                if (place_meeting(x, y, obj_board_trigger))
                {
                    var inst = instance_place(x, y, obj_board_trigger);
                    if (inst.extflag == mytrigger)
                        triggered = 1;
                }
            }
            if (triggered == 1)
            {
                with (obj_board_trigger)
                {
                    if (extflag == mytrigger)
                        instance_destroy();
                }
                with (su)
                    setxy(other.kr.x, other.kr.y);
                with (ra)
                {
                    setxy(other.kr.x, other.kr.y);
                    scr_board_caterpillar_interpolate();
                    follow = true;
                }
                blocker1 = instance_create_board(11, 5, obj_board_solid);
                blocker1.visible = true;
                blocker1.image_alpha = true;
                blocker1.sprite_index = spr_board_tennastatueblocker;
                with (blocker1)
                    scr_depth_board();
                scr_darksize(blocker1);
                with (blocker1)
                {
                    with (instance_create(x, y, obj_board_smokepuff))
                        image_blend = #E27A5C;
                }
                blocker2 = instance_create_board(10, 5, obj_board_solid);
                blocker2.visible = true;
                blocker2.image_alpha = true;
                blocker2.sprite_index = spr_board_tennastatueblocker;
                with (blocker2)
                    scr_depth_board();
                with (blocker2)
                {
                    with (instance_create(x, y, obj_board_smokepuff))
                        image_blend = #E27A5C;
                }
                scr_darksize(blocker2);
                with (obj_mainchara_board)
                {
                    if (x > 416)
                    {
                        x = 416;
                        if (name == "ralsei")
                            scr_board_caterpillar_interpolate();
                    }
                }
                snd_play(snd_board_splash);
                snd_play(snd_board_door_close);
                krishealth = kr.myhealth;
                ralseihealth = ra.myhealth;
                con = 0.5;
            }
        }
        if (con == 0.5)
        {
            with (su)
            {
                if (x != board_tilex(5))
                {
                    x -= 4;
                    facing = 3;
                    image_speed = 0.25;
                }
                else
                {
                    other.con += 0.1;
                }
                timer = 0;
            }
        }
        if (con == 0.6)
        {
            with (su)
            {
                if (y != board_tiley(3))
                {
                    y -= 4;
                    facing = 2;
                }
                else
                {
                    facing = 0;
                    other.timer++;
                    image_speed = 0;
                }
            }
            if (timer == 1)
            {
            }
            if (timer == 15)
            {
                with (realsusie)
                {
                    sprite_index = rsprite;
                    scr_delay_var("sprite_index", usprite, 30);
                }
                var susietalk = stringsetloc("Weeds? Leave it to me.", "obj_b1susiedig_slash_Step_0_gml_210_0");
                scr_couchtalk(susietalk, "susie", 1, 60);
            }
            if (timer > 30)
            {
                con = 1;
                timer = 0;
            }
        }
        if (con == 1)
        {
            fakesu = instance_create(su.x, su.y, obj_board_susiedig_fakesusie);
            su.x = 128;
            su.y = 64;
            su.canfreemove = 0;
            su.image_alpha = 0;
            timer = 0;
            con = 2;
        }
        if (con == 2)
        {
            timer++;
            if (raldie == 0)
            {
                with (obj_mainchara_board)
                {
                    if (name == "ralsei")
                    {
                        if (myhealth <= 0)
                        {
                            other.raldie = 1;
                            other.timer = 999;
                            var ratalk = stringsetloc("SUSIE!!", "obj_b1susiedig_slash_Step_0_gml_243_0");
                            scr_couchtalk(ratalk, "ralsei", 2, 80);
                            with (obj_caterpillarchara)
                            {
                                if (name == "ralsei")
                                    scr_shakeobj();
                            }
                        }
                    }
                }
            }
            if (timer == 5)
            {
                var ratalk = stringsetloc("You've, um, \"got this,\" Susie!", "obj_b1susiedig_slash_Step_0_gml_239_0");
                scr_couchtalk(ratalk, "ralsei", 2, 60);
                realralsei.sprite_index = realralsei.lsprite;
            }
            if (timer == 70)
            {
                with (realralsei)
                {
                    sprite_index = spr_ralsei_shocked_behind;
                    scr_delay_var("sprite_index", usprite, 60);
                    scr_shakeobj();
                }
                var ratalk = stringsetloc("W-wait! Watch where you're throwing!!", "obj_b1susiedig_slash_Step_0_gml_251_0");
                scr_couchtalk(ratalk, "ralsei", 2, 60);
            }
            if (timer == 145)
            {
                var sutalk = stringsetloc("Watch what?", "obj_b1susiedig_slash_Step_0_gml_256_0");
                scr_couchtalk(sutalk, "susie", 2, 60);
            }
            if (fakesu.con == 99 && !i_ex(obj_board_grabobject))
            {
                su.x = fakesu.x;
                su.y = fakesu.y;
                su.image_alpha = 1;
                safe_delete(fakesu);
                su.canfreemove = 1;
                con++;
            }
            if (raldie && ra.myhealth > 0)
            {
                with (obj_mainchara_board)
                {
                    if (name == "ralsei")
                    {
                        visible = true;
                        image_alpha = 1;
                    }
                }
                debug_print("revived ralsei");
                raldie = 0;
            }
        }
        if (con == 3)
        {
            su.canfreemove = 1;
            var pickupcount = 0;
            with (obj_board_pickup)
            {
                if (x >= 128 && x <= 512 && y >= 64 && y <= 320)
                    pickupcount++;
            }
            if (pickupcount == 1 && !teend)
            {
                if (ra.myhealth > 0)
                    scr_pathfind_to_point("ralsei", 9, 6, 2);
                else
                    killer = true;
                teend = true;
                var tetalk = stringsetloc("Well, you somehow survived! Take a key!", "obj_b1susiedig_slash_Step_0_gml_301_0");
                if (killer == true)
                    tetalk = stringsetloc("Well, some of you survived! Take a key!", "obj_b1susiedig_slash_Step_0_gml_302_0");
                scr_couchtalk(tetalk, "tenna", 2, 70);
                with (obj_actor_tenna)
                    bounce = true;
            }
            if (pickupcount == 0)
                con++;
        }
        if (con == 4)
        {
            snd_play(snd_impact);
            with (blocker1)
                instance_create(x, y, obj_board_smokepuff);
            safe_delete(blocker1);
            with (blocker2)
                instance_create(x, y, obj_board_smokepuff);
            safe_delete(blocker2);
            scr_pathfind_to_point("susie", 9, 4, 0);
            timer = 0;
            con++;
        }
        if (con == 5)
        {
            if (scr_board_checklocation("kris", 9, 5, 24))
            {
                con = 5.5;
                scr_board_caterpillar_interpolate_ralsei();
                ra.follow = 1;
            }
        }
        if (con == 6 && obj_board_camera.con == 0)
        {
            timer++;
            if (timer == 5)
            {
                var sustring = stringsetloc("Wanna do it again?", "obj_b1susiedig_slash_Step_0_gml_340_0");
                scr_couchtalk(sustring, "susie", 2, 70);
            }
            if (timer == 65)
            {
                var rastring = stringsetloc("Umm, I think we're good.", "obj_b1susiedig_slash_Step_0_gml_345_0");
                scr_couchtalk(rastring, "ralsei", 2, 60);
                con++;
            }
        }
    }
}
else
{
    sustalktimer = 0;
    susiewalkcon = 0;
    if (con == 5.5)
        con = 6;
}
if (startsong == 1)
{
    stime1++;
    if (stime1 == 1)
    {
        debug_print("start music");
        snd_volume(global.currentsong[1], 0, 30);
    }
    if (stime1 == 31)
    {
        snd_stop(global.currentsong[1]);
        global.currentsong[0] = snd_init("baci_perugina.ogg");
        global.currentsong[1] = mus_loop_ext(global.currentsong[0], 1, 1.2);
        startsong = 2;
    }
}
if (endsong == 1)
{
    stime2++;
    if (stime2 == 1)
    {
        debug_print("end music");
        mus_fade(global.currentsong[1], 30);
    }
    if (stime2 == 31)
    {
        snd_stop(global.currentsong[1]);
        global.currentsong[0] = snd_init("board_zelda.ogg");
        global.currentsong[1] = mus_loop(global.currentsong[0]);
        stime2 = 0;
        endsong = 2;
    }
}
