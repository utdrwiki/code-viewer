pebberoni = stringsetloc("SMELLS LIKE#PEBBERONI", "obj_b2fashionshop2_slash_Step_0_gml_292_0");
scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
    drawtext = true;
    if (pippins.grabbed)
    {
        textcomplete = true;
        texttimer = 999;
        drawtext = false;
    }
    if (sndpause == 0 && obj_board_camera.con == 0)
    {
        sndpause = 1;
        snd_pause(global.currentsong[1]);
    }
    if (sndpause == 1 && obj_board_camera.con != 0)
    {
        sndpause = 0;
        snd_resume(global.currentsong[1]);
    }
    if (visitinit == 0 && obj_board_camera.con == 0)
    {
        visitinit = 1;
        with (pippins)
            setxy_board(3376, 864);
        shopstring = string1;
        if (!i_ex(bow) && !i_ex(deodorant))
            shopstring = string3;
    }
    if (con == 0 && obj_board_camera.con == 0)
    {
        if (debugset == true)
        {
            debugset = false;
            with (obj_mainchara_board)
                controlled = false;
            susie.controlled = true;
        }
        if (bowtalk == 0)
        {
            bowtalktimer++;
            if (bowtalktimer == 30)
            {
                ralsei.follow = false;
                scr_pathfind_to_point("kris", board_tilex(7) - 16, board_tiley(4), 1);
            }
            if (bowtalktimer == 62)
                scr_pathfind_to_point("ralsei", board_tilex(6) - 16, board_tiley(4), 1);
            if (bowtalktimer == 60)
            {
                var sutalk = stringsetloc("Haha, PIZZA DEODORANT (FOR NERDS)?", "obj_b2fashionshop2_slash_Step_0_gml_63_0");
                scr_couchtalk(sutalk, "susie", 2, 120);
            }
            if (bowtalktimer == 180)
                krisflip = 1;
            if (bowtalktimer == 210)
            {
                var sutalk = stringsetloc("Hey, Ralsei. Looks like Kris is trying to tell you something.", "obj_b2fashionshop2_slash_Step_0_gml_80_0");
                scr_couchtalk(sutalk, "susie", 2, 130);
            }
            if (bowtalktimer == 340)
            {
                var ratalk = stringsetloc("K... Kris? You think I need, um...?", "obj_b2fashionshop2_slash_Step_0_gml_85_0");
                scr_couchtalk(ratalk, "ralsei", 2, 110);
            }
            if (bowtalktimer == 435)
            {
                krisflip = 0;
                kris.facing = 3;
            }
            if (bowtalktimer == 440)
            {
                var ratalk = stringsetloc("You know, I'm not exactly sure, how I would even require that sort of thing...", "obj_b2fashionshop2_slash_Step_0_gml_90_0");
                scr_couchtalk(ratalk, "ralsei", 2, 150);
            }
            if (bowtalktimer == 540)
                krisflip = 5;
            if (bowtalktimer == 590)
            {
                var ratalk = stringsetloc("...", "obj_b2fashionshop2_slash_Step_0_gml_107_0");
                scr_couchtalk(ratalk, "ralsei", 2, 90);
            }
            if (bowtalktimer == 680)
            {
                var ratalk = stringsetloc("Um, if it's for you, Kris...", "obj_b2fashionshop2_slash_Step_0_gml_112_0");
                scr_couchtalk(ratalk, "ralsei", 2, 90);
            }
            if (bowtalktimer == 756)
            {
                krisflip = 0;
                kris.facing = 1;
            }
            if (bowtalktimer == 760)
            {
                scr_pathfind_to_point("ralsei", 8, 4);
                bowtalktimer = 0;
                bowtalk = 1;
            }
        }
        if (bowtalk == 1)
        {
            var trig = false;
            with (obj_board_pickup)
            {
                if (type != "ribbon")
                {
                    if (place_meeting(x, y, obj_mainchara_board))
                    {
                        with (instance_place(x, y, obj_mainchara_board))
                        {
                            if (name == "ralsei")
                                trig = true;
                        }
                    }
                }
            }
            if (trig == true)
            {
                scr_pathfind_end("ralsei");
                if (i_ex(deodorant))
                {
                    with (deodorant)
                        dodeodorant = true;
                }
                bowtalk = 2;
            }
        }
        if (bowtalk == 2)
        {
            if (i_ex(deodorant))
            {
                if (deodorant.con > 4)
                {
                    with (obj_mainchara_board)
                        controlled = false;
                    susie.controlled = true;
                    bowtalk = 3;
                }
            }
        }
        if (bowtalk == 3 && !i_ex(deodorant))
        {
            bowtalk = 4;
            with (obj_mainchara_board)
                canfreemove = true;
        }
        if (bowtalk <= 4)
        {
            var grabbedralse = false;
            with (obj_board_grabobject)
            {
                if (grabbedid != 0)
                {
                    if (grabbedid.object_index == obj_mainchara_board)
                    {
                        debug_print("picked up ralsei");
                        grabbedralse = true;
                    }
                }
            }
            if (grabbedralse && !broken)
            {
                krisflip = false;
                broken = true;
                bowtalktimer = 0;
                debug_print("broken");
            }
        }
        if (bowtalk < 20)
        {
            var _su = susie;
            with (obj_board_pickup)
            {
                if (pickupname == "susie")
                {
                    other.bowtalk = 20;
                    other.bowtalktimer = 0;
                    other.krisflip = false;
                }
            }
        }
        if (bowtalk < 20 && broken)
        {
            bowtalktimer++;
            if (bowtalktimer == 1)
            {
                bowtalk = 19;
                var ratalk = stringsetloc("--oh!", "obj_b2fashionshop2_slash_Step_0_gml_195_0");
                scr_couchtalk(ratalk, "ralsei", 2, 80);
            }
        }
        if (bowtalk == 4)
        {
            bowtalktimer++;
            if (bowtalktimer == 10)
            {
                var ratalk = stringsetloc("Um, I hope this is... better?", "obj_b2fashionshop2_slash_Step_0_gml_187_0");
                scr_couchtalk(ratalk, "ralsei", 2, 80);
            }
            if (bowtalktimer >= 10)
            {
                if (broken)
                    bowtalktimer = 9999999;
            }
            if (bowtalktimer == 100)
                scr_play_recording("kris", "0W0W0R0R0R0RU0RU0R0RU0RU0RU0LRU0LD0R0U0LD0R0LU0D0R0L0RD0RU0L0RD0RU0RU0RD0L0LU0LD0R0U0L0LD0R0U0L0R0U0L0R0R0RD0L0L0U0R0R0L0L0R0R0L0L0D0R0U0LU0LD0D0R0R0RU0U0L0LD0D0R0RU0LU0L0D0D0R0RU0U0LU0LD0D0RD0RU0U0LU0L0D0R0R0U0L0L0D0RD0R0R0L0L0L0R0R0L0L0L0R0R0L0L0LU0RU0R0R0R0D0D0LD0L0LU0U0RU0R0RD0D0LD0L0LU0U0R0R0RD0D0L0L0U0RU0R0R0RD0LD0L0LU0U0RU0R0D0L0L0L0LD0R0R0R0U0LU0L0LD0D0R0R0R0U0LU0L0LD0D0R0R0RU0RU0L0L0LD0D0D0R0R0RU0U0LU0L0LD0D0D0D");
            if (bowtalktimer == 130)
            {
                var sutalk = stringsetloc("Ewwwww, Kris is huffing the fuuumes!!! Hahaha!!!", "obj_b2fashionshop2_slash_Step_0_gml_203_0");
                scr_couchtalk(sutalk, "susie", 2, 60);
            }
            if (bowtalktimer == 190)
            {
                var ratalk = stringsetloc("Um, I'm...", "obj_b2fashionshop2_slash_Step_0_gml_208_0");
                scr_couchtalk(ratalk, "ralsei", 2, 50);
            }
            if (bowtalktimer == 240)
            {
                scr_pathfind_to_point("ralsei", 10, 6, 0);
                scr_play_recording("kris", "0W");
                kris.facing = 0;
                var ratalk = stringsetloc("Just going to read the instruction manual for a bit...", "obj_b2fashionshop2_slash_Step_0_gml_216_0");
                scr_couchtalk(ratalk, "ralsei", 2, 120);
            }
        }
        if (bowtalk == 20)
        {
            scr_board_forcethrow();
            with (pippins)
                killme = true;
            ralsei.follow = false;
            scr_pathfind_end("kris");
            scr_pathfind_end("ralsei");
            scr_play_recording("kris", "0W");
            scr_shakeobj(su_real);
            su_real.sprite_index = spr_susie_exasperated;
            snd_play(snd_wing);
            var sutalk = stringsetloc("HEY! WHAT THE --", "obj_b2fashionshop2_slash_Step_0_gml_238_0");
            scr_couchtalk(sutalk, "susie", 2, 80);
            bowtalk = 21;
            bowtalktimer = 0;
        }
        if (bowtalk == 21)
        {
            bowtalktimer++;
            su_real.depth = kr_real.depth - 2;
            kr_real.x = scr_even(kr_real.x);
            kr_real.y = scr_even(kr_real.y);
            if (bowtalktimer == 40)
            {
                safe_delete(obj_couchwriter);
                su_real.sprite_index = spr_susie_pounceright;
                su_real.hspeed = 14;
                su_real.vspeed = -10;
                su_real.gravity = 2;
                su_real.friction = 0.8;
            }
            if (bowtalktimer == 46)
            {
                ra_real.sprite_index = spr_ralsei_shocked_left;
                ra_real.hspeed = 4;
                ra_real.friction = 0.6;
                ra_real.y -= 6;
                su_real.gravity = 0;
                su_real.vspeed = 0;
                su_real.y = 392;
                su_real.hspeed *= 0.5;
                su_real.sprite_index = spr_susie_walk_right_dw_unhappy;
                snd_play_x(snd_damage, 0.8, 1.6);
                kr_real.hspeed = 8;
                kr_real.friction = 0.9;
                with (obj_mainchara_board)
                    controlled = 0;
            }
            if (bowtalktimer == 49)
            {
                kr_real.sprite_index = kr_real.lsprite;
                snd_play(snd_noise);
            }
            if (bowtalktimer == 50)
            {
                texttimer = 0;
                shopstring = pebberoni;
                if (susie.ribbon)
                    shopstring = stringsetloc("WOW, SUSIE#WEARS RIBBONS?", "obj_b2fashionshop2_slash_Step_0_gml_296_0");
            }
            if (bowtalktimer == 60)
            {
                scr_resetgameshowcharacter("susie", 15);
                su_real.sprite_index = spr_susie_walk_left_dw_unhappy;
                su_real.image_speed = 0.25;
                scr_resetgameshowcharacter_delay("susie", 15);
            }
            if (bowtalktimer == 83)
            {
                var sutalk = stringsetloc("Kris, you dumbass! Why'd you make me wear that!?", "obj_b2fashionshop2_slash_Step_0_gml_309_0");
                scr_couchtalk(sutalk, "susie", 2, 90);
            }
            if (bowtalktimer == 87)
            {
                ra_real.x += 12;
                ra_real.sprite_index = spr_ralsei_walk_left_sad;
            }
            if (bowtalktimer == 103)
                scr_pathfind_to_point("kris", susie.x - 32, susie.y, 1);
            if (bowtalktimer == 140)
            {
                kr_real.sprite_index = kr_real.lsprite;
                kr_real.image_index = 0;
            }
            if (bowtalktimer == 143)
            {
                var ratalk = stringsetloc("M... Make you?", "obj_b2fashionshop2_slash_Step_0_gml_348_0");
                scr_couchtalk(ratalk, "ralsei", 2, 60);
                ra_real.sprite_index = spr_ralsei_wonder_left;
            }
            if (bowtalktimer == 193)
            {
                krisflip = 5;
                var sutalk = stringsetloc("Ugh, take it off!!", "obj_b2fashionshop2_slash_Step_0_gml_356_0");
                scr_couchtalk(sutalk, "susie", 2, 80);
                scr_shakeobj(su_real, 8, 2);
                snd_play(snd_noise);
            }
            if (bowtalktimer == 228)
            {
                scr_resetgameshowcharacter("kris", 15);
                scr_resetgameshowcharacter_delay("kris", 15);
                with (kr_real)
                    scr_delay_var("image_speed", 0, 15);
                with (susie)
                    scr_delay_var("controlled", true, 15);
                with (susie)
                    scr_delay_var("facing", 0, 15);
                kr_real.sprite_index = kr_real.lsprite;
                kr_real.image_speed = 0.25;
                global.flag[1024] = 1;
                krisflip = 0;
                scr_pathfind_to_point("kris", 5.5, 7, 0);
                bowtalktimer = 0;
                bowtalk++;
            }
        }
        if (bowtalk == 22 && scr_board_checklocation("kris", 5.5, 7, 1))
        {
            kris.controlled = true;
            global.interact = 1;
            snd_play(snd_escaped);
            scr_quickwarp(2432, 3392, 2688, 3584);
            bowtalk = 23;
            obj_b2tennaleave1.con = 5;
        }
    }
    if (con == 72)
    {
        if (suwalk == 0 && obj_board_camera.con == 0)
        {
            suwalktimer++;
            if (suwalktimer == 1)
                ralsei.follow = true;
            if (suwalktimer == 16)
            {
                if (susie.x < 320)
                    scr_pathfind_to_point("susie", 5, 5, 0);
                else
                    scr_pathfind_to_point("susie", choose(9, 10), choose(5, 6), 0);
            }
        }
    }
    if (con == 72)
    {
        if (obj_b2enemysquabble.battlecon == 15 || obj_b2bombfun.visited == 1)
        {
            if (bowtalk2 == 0 && i_ex(bow))
                bowtalk2 = 0.5;
            if (bowtalk2 == 0.5 && active)
            {
                var pickup = false;
                if (!i_ex(bow))
                {
                    texttimer = 0;
                    shopstring = string2;
                    var timetalk = 90;
                    var sutalk = stringsetloc("THAT'S what you wanted to come back for!?", "obj_b2fashionshop2_slash_Step_0_gml_430_0");
                    scr_couchtalk(sutalk, "susie", 2, timetalk);
                    with (obj_caterpillarchara)
                    {
                        if (name == "susie")
                        {
                            snd_play(snd_wing);
                            sprite_index = spr_susie_exasperated;
                            scr_shakeobj();
                            scr_resetgameshowcharacter_delay("susie", timetalk + 11);
                        }
                    }
                    bowtalk2 = 1;
                }
            }
            if (deotalk == 0 && i_ex(deodorant))
                deotalk = 0.5;
            if (deotalk == 0.5 && active)
            {
                if (!i_ex(deodorant))
                {
                    texttimer = 0;
                    shopstring = pebberoni;
                    var timetalk = 90;
                    var sutalk = stringsetloc("Okay, controller earned. You needed that.", "obj_b2fashionshop2_slash_Step_0_gml_450_0");
                    scr_couchtalk(sutalk, "susie", 2, timetalk);
                    with (obj_caterpillarchara)
                    {
                        if (name == "susie")
                        {
                            sprite_index = spr_susie_walk_right_dw;
                            scr_resetgameshowcharacter_delay("susie", timetalk + 11);
                        }
                    }
                    deotalk = 1;
                }
            }
        }
    }
}
else
{
    timer = 0;
    texttimer = 0;
    visitinit = 0;
    textcomplete = false;
    bowtalktimer = 0;
    if (global.flag[1190] == 1 || obj_b2bombfun.visited == 1)
    {
        suwalktimer = 0;
        suwalk = 0;
        con = 72;
    }
}
if (krisflip)
{
    fliptime++;
    var flipspeed = 10 - krisflip;
    if ((fliptime % flipspeed) == 0)
    {
        if (kris.facing == 1)
            kris.facing = 3;
        else
            kris.facing = 1;
    }
}
