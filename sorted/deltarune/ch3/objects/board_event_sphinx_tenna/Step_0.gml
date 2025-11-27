scr_depth_board();
if (init == 0)
    init = 1;
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
if (susie == 0)
{
    with (obj_caterpillarchara)
    {
        if (name == "susie")
            other.susie = id;
    }
}
if (ralsei == 0)
{
    with (obj_caterpillarchara)
    {
        if (name == "ralsei")
            other.ralsei = id;
    }
}
if (tenna == 0)
{
    with (obj_actor_tenna)
        other.tenna = id;
}
var mytrigger = "sphinx";
if (active == 1 && obj_board_camera.con == 0)
{
    if (suwalk == 0 && obj_board_camera.con == 0)
    {
        suwalktimer++;
        if (suwalktimer == 1)
            ra.follow = true;
        if (suwalktimer == 15)
        {
            with (obj_mainchara_board)
            {
                if (name == "susie")
                    sleepy = true;
            }
            scr_pathfind_to_point("susie", 8, 5, 3);
            suwalk = 1;
        }
    }
    var _qcount = 0;
    with (obj_board_inventory)
        _qcount = qcount;
    if (doseq == 1 && obj_board_inventory.qcount < 2)
    {
        if ((potevent == 0 && global.flag[1020] == 1) && obj_board_camera.shift == "none")
        {
            kr.cantleave = true;
            nointeract = 1;
            visitcon = 99.9;
            timer2 = 12;
            bosstalk = 2;
        }
        else if (bosstalk == 0)
        {
            bosstalk = 1;
            timer2 = 0;
        }
        doseq = 0;
    }
    if (visitcon == 99.9)
    {
        if (scr_board_checklocation("susie", board_tilex(8), board_tiley(5), 4))
            visitcon = 100;
    }
    if (bosstalk == 1)
    {
        timer2++;
        if (timer2 == 15)
        {
            with (obj_mainchara_board)
            {
                if (name == "susie")
                    sleepy = false;
            }
            var sutalk = stringsetloc("So it's not a boss?", "obj_board_event_sphinx_tenna_slash_Step_0_gml_74_0_b");
            scr_couchtalk(sutalk, "susie", 2, 80);
        }
        if (timer2 == 95)
        {
            var tetalk = stringsetloc("A BOSS!? ME!? I'm offended!!!", "obj_board_event_sphinx_tenna_slash_Step_0_gml_79_0");
            scr_couchtalk(tetalk, "tenna", 2, 80);
            with (obj_actor_tenna)
                bounce = 1;
            bosstalk = 2;
        }
    }
    if (visitcon == 100 && potevent == 0)
    {
        timer2++;
        if (timer2 == 15)
        {
            with (obj_mainchara_board)
            {
                if (name == "susie")
                    sleepy = false;
            }
            scr_pathfind_to_point("susie", 9, 3, 1);
            var sutalk = stringsetloc("Know what else you're missing?", "obj_board_event_sphinx_tenna_slash_Step_0_gml_105_0");
            scr_couchtalk(sutalk, "susie", 2, 60);
        }
        if (timer2 == 75)
        {
            var tetalk = stringsetloc("Watch.", "obj_board_event_sphinx_tenna_slash_Step_0_gml_110_0");
            scr_couchtalk(tetalk, "susie", 2, 60);
            var potnearest = instance_nearest(su.x, su.y, obj_board_grabbleObject);
            if (i_ex(potnearest))
            {
                snd_play(snd_board_lift);
                safe_delete(potnearest);
                con = -1;
                su.visible = false;
                fakesu = instance_create(su.x, su.y, obj_board_marker);
                fakepot = instance_create(su.x, su.y - 28, obj_board_marker);
                fakepot.sprite_index = spr_board_jar;
                fakesu.sprite_index = su.rsprite_carry;
                fakesu.image_speed = 0;
                with (fakesu)
                    scr_depth_board();
                scr_darksize(fakepot);
                scr_darksize(fakesu);
                fakepot.depth = 100000;
            }
        }
        if (timer2 == 85)
        {
            fakesu.image_index = su.image_index;
            fakesu.sprite_index = su.lsprite_carry;
        }
        if (timer2 == 135)
        {
            snd_play(snd_board_throw);
            fakepot.vspeed = -10;
            fakepot.hspeed = -10;
            fakepot.gravity = 1;
        }
        if (timer2 == 137)
            fakesu.sprite_index = su.lsprite;
        if (timer2 == 144)
        {
            scr_shakeobj(id);
            var poof = instance_create_depth(fakepot.x, fakepot.y, 10000, obj_board_breakpoof);
            poof.ignoredepth = 1;
            safe_delete(fakepot);
            snd_play(snd_board_damage);
            hurt = 1;
        }
        if (timer2 == 154)
        {
            tenna.bounce = 1;
            var tetalk = stringsetloc("HEY!!! THAT'S CROISSANT MISUSE!!!", "obj_board_event_sphinx_tenna_slash_Step_0_gml_205_0");
            scr_couchtalk(tetalk, "tenna", 2, 90);
            con = 0;
            su.facing = 3;
            su.visible = true;
            safe_delete(fakesu);
            potevent = 1;
            nointeract = 0;
            kr.cantleave = false;
        }
    }
    if (con == 0 && obj_board_camera.con == 0)
    {
        var triggered = 0;
        if (myinteract == 3)
            triggered = 1;
        if (triggered == 1)
        {
            global.interact = 1;
            con = 1;
        }
    }
    if (con == 1)
    {
        var _skip = 0;
        if (!solved)
        {
            if (read == 0)
            {
                scr_speaker("no_name");
                msgsetloc(0, "HEY FOLKS^1! IT'S SPHINX-TENNA^1!/", "obj_board_event_sphinx_tenna_slash_Step_0_gml_239_0");
                msgnextloc("ANSWER MY RIDDLE AND I'LL GIVE YOU ONE KEY!/", "obj_board_event_sphinx_tenna_slash_Step_0_gml_240_0");
                msgnextloc("..^1. IS WHAT I WOULD SAY^1, BUT^1, YA SEE^1, IT'S A BIT EMBARRASSING.../", "obj_board_event_sphinx_tenna_slash_Step_0_gml_241_0");
                msgnextloc("SEE^1, I'M MISSING MY Q'S^1! BRING TWO OF 'EM HERE AND I'LL QUIZ YA!/%", "obj_board_event_sphinx_tenna_slash_Step_0_gml_242_0");
                read++;
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "I'M MISSING MY Q'S^1! BRING TWO OF 'EM HERE AND I'LL QUIZ YA!/%", "obj_board_event_sphinx_tenna_slash_Step_0_gml_247_0");
            }
        }
        if (_qcount >= 2)
        {
            _skip = true;
            con = 32;
        }
        if (solved == 1)
        {
            if (read == 0)
            {
                msgsetloc(0, "MY NOSE IS THE ONLY NOSE THAT KNOWS./", "obj_board_event_sphinx_tenna_slash_Step_0_gml_262_0");
                msgnextloc("DON'T TRY TO USE THE LONG NOSE OF ANY OTHER SUSPICIOUS CHARACTER!/%", "obj_board_event_sphinx_tenna_slash_Step_0_gml_263_0");
                read++;
            }
            else
            {
                msgsetloc(0, "NOSE-PICKING^1, ER^1, LOCK-PICKING IS NOT ALLOWED!/%", "obj_board_event_sphinx_tenna_slash_Step_0_gml_268_0");
            }
        }
        if (!_skip)
        {
            var d = bw_make();
            d.side = 1;
            if (_qcount < 2 || solved == 1)
                con = 2;
            else
                con = 10;
        }
    }
    if (con == 32)
    {
        scr_pathfind_end("kris");
        scr_pathfind_end("ralsei");
        scr_pathfind_end("susie");
        ralsei.follow = 0;
        global.interact = 0;
        kr.controlled = false;
        with (obj_mainchara_board)
        {
            if (!controlled)
            {
                if (x > 224 && x < 384)
                {
                    if (y < 178)
                        y = 178;
                }
            }
        }
        kr.controlled = 0;
        scr_pathfind_to_point("ralsei", 4.5, 4.25, 2);
        scr_pathfind_to_point("susie", 6.5, 4.25, 2);
        scr_pathfind_to_point("kris", 5.5, 4, 2);
        failsafetimer = 0;
        con = 33;
    }
    if (con == 33)
    {
        failsafetimer++;
        if ((scr_board_checklocation("kris", 5.5, 4, 4) && scr_board_checklocation("ralsei", 4.5, 4.25, 12) && scr_board_checklocation("susie", 6.5, 4.25, 12)) || failsafetimer >= 60)
        {
            kr.controlled = false;
            with (obj_mainchara_board)
                facing = 2;
            scr_speaker("no_name");
            msgsetloc(0, "WOW^1, YOU GOT TWO Q'S JUST FOR ME!?/%", "obj_board_event_sphinx_tenna_slash_Step_0_gml_316_0");
            var d = bw_make();
            face = 1;
            d.side = 1;
            con++;
            timer = 0;
            if (failsafetimer >= 60)
            {
                debug_print("failsafe initiated");
                scr_pathfind_end("ralsei");
                scr_pathfind_end("susie");
                scr_pathfind_end("kris");
                with (obj_mainchara_board)
                {
                    facing = 2;
                    image_speed = 0;
                }
            }
            failsafetimer = 0;
        }
    }
    if (con == 34 && !bw_ex())
    {
        timer++;
        if (timer == 5)
        {
            obj_board_inventory.qcount = 1;
            snd_play_x(snd_item, 1, 1);
            q2 = scr_board_marker(obj_board_inventory.x + 8 + 32, obj_board_inventory.y + 10 + 48, spr_board_inventory_q);
            with (q2)
            {
                image_xscale = -2;
                scr_lerpvar("x", x, board_tilex(8), 20, 3, "out");
                scr_lerpvar("y", y, board_tiley(5), 20, -1, "out");
            }
        }
        if (timer == 20)
        {
            obj_board_inventory.qcount = 0;
            snd_play_x(snd_item, 1, 1.2);
            q1 = scr_board_marker(obj_board_inventory.x + 8, obj_board_inventory.y + 10 + 48, spr_board_inventory_q);
            with (q1)
            {
                scr_lerpvar("x", x, board_tilex(4), 20, 3, "out");
                scr_lerpvar("y", y, board_tiley(5), 20, -1, "out");
            }
        }
        if (timer == 40)
        {
            snd_play(snd_board_shine_get);
            with (q1)
            {
                scr_lerpvar("x", x, x + 37, 8, 2, "in");
                scr_lerpvar("y", y, y - 87, 8, 2, "in");
            }
        }
        if (timer == 49)
        {
            image_index = 1;
            with (q1)
            {
                with (instance_create(x, y, obj_board_smokepuff))
                    image_blend = #7DC3C0;
                instance_destroy();
            }
        }
        if (timer == 70)
        {
            snd_play(snd_board_shine_get);
            with (q2)
            {
                scr_lerpvar("x", x, x - 37, 8, 2, "in");
                scr_lerpvar("y", y, (y - 87) + 1, 8, 2, "in");
            }
        }
        if (timer == 79)
        {
            image_index = 2;
            with (q2)
            {
                with (instance_create(x - 32, y, obj_board_smokepuff))
                    image_blend = #7DC3C0;
                instance_destroy();
            }
        }
        if (timer == 120)
        {
            face = 0;
            scr_speaker("no_name");
            msgsetloc(0, "OH^1, OH^1, THAT'S MUCH BETTER!/", "obj_board_event_sphinx_tenna_slash_Step_0_gml_407_0");
            msgnextloc("NOW THAT I'M DRESSED.../", "obj_board_event_sphinx_tenna_slash_Step_0_gml_408_0");
            msgnextloc("IT'S A QUIZ TO THE DEATH!/%", "obj_board_event_sphinx_tenna_slash_Step_0_gml_409_0");
            var d = bw_make();
            d.side = 1;
            timer = 0;
            con = 10.1;
        }
    }
    if (con == 10.1 && !bw_ex())
    {
        timer++;
        if (timer == 5)
            con = 10;
    }
    if (con == 2 && !bw_ex())
    {
        if (!solved)
            doseq = true;
        global.interact = 0;
        con = 0;
        myinteract = 0;
    }
    if (con == 10 && !bw_ex())
    {
        quiz = instance_create(0, 0, obj_quizsequence);
        quiz.depth = 900000;
        quiz.extflag = "sphinx";
        scr_quizsetup(3, 6);
        global.interact = 1;
        kr.quizmode = true;
        var __myid = id;
        with (obj_board_parent)
        {
            if (id != __myid)
                active = false;
        }
        timer = 0;
        con = 11;
    }
    if (con == 11 && !i_ex(obj_quizsequence))
    {
        global.interact = 1;
        timer++;
        if (timer == 30)
        {
            if (global.flag[1019] > 3)
            {
                msgsetloc(0, "WELL DONE. FOR YOU THAT KNOWS^1, A NOSE!/%", "obj_board_event_sphinx_tenna_slash_Step_0_gml_556_0");
                con = 12;
            }
            else
            {
                msgsetloc(0, "YOU DIDN'T EVEN KNOW THAT!?/", "obj_board_event_sphinx_tenna_slash_Step_0_gml_562_0");
                msgnextloc("HA HA HA HA -- OH NO^1, MY NOSE FELL ASLEEP!/%", "obj_board_event_sphinx_tenna_slash_Step_0_gml_563_0");
                attempt++;
                con = 12;
            }
            var d = bw_make();
            d.side = 1;
            timer = 0;
        }
    }
    if (con == 12 && !bw_ex())
    {
        global.interact = 0;
        with (nose)
            scr_shakeobj();
        with (obj_mainchara_board)
        {
            if (y < 208)
                scr_lerpvar("y", y, 208, 8);
            facing = 2;
        }
        timer = 0;
        con = 13;
    }
    if (con == 13)
    {
        timer++;
        if (timer == 8)
        {
            with (nose)
                scr_lerpvar("y", y, 174, 12, 2, "in");
        }
        if (timer == 20)
            snd_play(snd_impact);
        if (timer == 24)
        {
            with (nose)
                scr_lerpvar("x", x, 75, 45, -1, "in");
        }
        if (timer == 66)
        {
            var puff = instance_create_board(0, 3, obj_board_smokepuff);
            with (puff)
                scr_board_depth();
            puff = instance_create_board(0, 4, obj_board_smokepuff);
            with (puff)
                scr_board_depth();
            snd_play(snd_board_splash);
        }
        if (i_ex(nose))
        {
            with (nose)
            {
                scr_depth_board();
                if (depth > (other.depth - 5))
                    depth = other.depth - 5;
                if (place_meeting(x, y, obj_board_tree_static))
                {
                    var _deadtree = instance_place(x, y, obj_board_tree_static);
                    with (_deadtree)
                        instance_destroy();
                }
            }
        }
        if (timer == 80)
        {
            safe_delete(nose);
            solved = 1;
            read = 0;
            con++;
        }
    }
    if (con == 14)
    {
        con = 0;
        kr.facing = 0;
        kr.controlled = true;
        myinteract = 0;
        scr_pathfind_to_point("ralsei", 2, 4.5, 3);
        scr_pathfind_to_point("susie", 2.5, 3, 3);
    }
}
if (!active)
{
    if (bosstalk == 1)
        bosstalk = 2;
    visitinit = 0;
    if (visitcon > 1 && visitcon < 100)
        visitcon = 15;
    if (visitcon == 100)
        visitcon = -1;
    nointeract = 0;
    suwalk = 0;
    suwalktimer = 0;
}
