if (init == 0)
{
    if (i_ex(obj_board_tree_static))
    {
        var image_ind = obj_board_tree_static.image_index;
        hazard[0] = instance_create(x + 288, y + 128, obj_board_tree_static);
        hazard[1] = instance_create(x + 128, y + 192, obj_board_tree_static);
        hazard[2] = instance_create(x + 160, y + 192, obj_board_tree_static);
        hazard[0].image_index = image_ind;
        hazard[1].image_index = image_ind;
        hazard[2].image_index = image_ind;
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
if (tenna == 0)
{
    with (obj_actor_tenna)
        other.tenna = id;
}
if (active == 1 && obj_board_camera.con == 0)
{
    if (eventactive)
    {
        eventtimer++;
        if (scr_debug())
        {
            if (keyboard_check_pressed(vk_f5))
                con = 100;
        }
    }
    sutime++;
    if (susiewalkcon == 0)
    {
        if (solved == 0)
        {
            ralsei.follow = 0;
            if (sutime >= 30)
            {
                with (obj_mainchara_board)
                {
                    if (name == "susie")
                        sleepy = true;
                }
                scr_pathfind_to_point("ralsei", 6, 4, 0);
                scr_pathfind_to_point("susie", 4, 4, 0);
                susiewalkcon = -1;
            }
        }
        else
        {
            ra.follow = 1;
            if (sutime >= 10)
            {
                scr_pathfind_end("susie");
                with (obj_mainchara_board)
                {
                    if (name == "susie")
                        sleepy = true;
                }
                susiewalkcon = -1;
                var side = choose(0, 1);
                if (side == 1)
                    scr_pathfind_to_point("susie", choose(3, 4), choose(3, 4), 0);
                else
                    scr_pathfind_to_point("susie", choose(6, 7), choose(3, 4), 0);
            }
        }
    }
    if (con == 0)
    {
        with (obj_caterpillarchara)
            fun = 1;
        timer++;
        if (timer == 10)
        {
            timer = 0;
            con = 1;
            tenna.bounce = 1;
            var tetalk = stringsetloc("Can you solve the puzzle of desert?", "obj_bpush1_slash_Step_0_gml_109_0");
            scr_couchtalk(tetalk, "tenna", 2, 75);
            eventactive = true;
        }
    }
    if (con == 1)
    {
        timer++;
        if (timer == 50)
        {
            with (susiereal)
            {
            }
        }
        if (timer == 60)
        {
            timer = 0;
            con = 2;
            var sutalk = stringsetloc("No. Eating yogurt.", "obj_bpush1_slash_Step_0_gml_130_0");
            scr_couchtalk(sutalk, "susie", 2, 60);
        }
    }
    if (con == 2)
    {
        timer++;
        var pushed = 0;
        with (obj_pushableblock_board)
        {
            if (extflag == "push1")
                pushed += pushcount;
        }
        if (pushed > 0)
        {
            timer = 0;
            con = 10;
        }
        if (timer == 120 && pushed == 0)
        {
            var ratalk = stringsetloc("Kris, perhaps we can use that block?", "obj_bpush1_slash_Step_0_gml_149_0");
            scr_couchtalk(ratalk, "ralsei", 2, 75);
            ralseireal.sprite_index = spr_ralsei_walk_left;
            with (ralseireal)
                scr_var_delay("sprite_index", spr_ralsei_walk_up, 75);
        }
        var intheway = false;
        if (pushed > 0)
            intheway = true;
        with (obj_board_trigger)
        {
            if (extflag == "yogurteasteregg")
            {
                if (place_meeting(x, y, obj_mainchara_board))
                    intheway = true;
            }
        }
        if (intheway == true && timer > 120)
            timer--;
        if (timer == 300 && !intheway)
        {
            kr.cantleave = true;
            with (susiereal)
                sprite_index = rsprite;
            susiereal.image_speed = 0;
        }
        if (timer == 320 && !intheway)
        {
            var sutalk = stringsetloc("Kris stay still.", "obj_bpush1_slash_Step_0_gml_183_0");
            scr_couchtalk(sutalk, "susie", 2, 60);
            with (obj_mainchara_board)
            {
                if (name == "kris")
                    canfreemove = 0;
            }
        }
        if (timer == 330 && !intheway)
        {
            with (obj_mainchara)
            {
                fun = 1;
                sprite_index = spr_krisl_dark;
            }
        }
        if (timer == 350 && !intheway)
            ralseireal.sprite_index = ralseireal.lsprite;
        if (timer == 380 && !intheway)
        {
            var _su = 0;
            with (obj_caterpillarchara)
            {
                if (name == "susie")
                    _su = id;
            }
            snd_play(snd_wing);
            var throwtime = 24;
            var yogurt = scr_dark_marker(_su.x + 8, _su.y + 40, spr_gameshow_yogurttube);
            with (yogurt)
            {
                with (obj_caterpillarchara)
                    other.depth = depth + 100;
                vspeed = -10;
                gravity = 1;
                hspeed = 10;
                friction = 0.24;
                snd_play_delay(snd_splat, 11);
                scr_var_delay("hspeed", -3, 11);
                scr_doom(id, throwtime);
            }
        }
        if (timer == 420 && !intheway)
        {
            susiereal.sprite_index = spr_susieu_dark_faceleft_concerned;
            var sutalk = stringsetloc("Open your mouth, idiot.", "obj_bpush1_slash_Step_0_gml_227_0");
            scr_couchtalk(sutalk, "susie", 2, 60);
        }
        if (timer == 430 && !intheway)
        {
            var raltalk = stringsetloc("...", "obj_bpush1_slash_Step_0_gml_232_0");
            scr_couchtalk(raltalk, "ralsei", 2, 40);
        }
        if (timer == 470 && !intheway)
        {
            ralseireal.sprite_index = ralseireal.usprite;
            kr.controlled = 0;
            ra.controlled = 1;
            ra.caninteract = true;
            scr_play_ralsei_recording("0D0D0D0D0D0R0R0R0R0R0R0R0R0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0L0L0L0L0L0L0L0L0L0L0L0L10L0L0L0L0L0L0L0L0L0L0L0L0L10L0L0L0L0L0L0LU0U0U0U0U0U0U0L0L0L0L0L0L0L0L0L0D0D0D10D0D0D0D0D0D0D0D0D10D0D0D0D0D0D0D0D0D10D0D0D0D0D0D0L0L0L0L0L0L0L0L0D0D0D0D0D0D0D0D0D0R0R0R10R0R0R0R0R0R0R0R0R10W0W0W0W0W0W");
        }
        if (timer == 480 && !intheway)
            susiereal.sprite_index = susiereal.rsprite;
    }
    if (con > 2 && con < 100)
    {
        if (!i_ex(obj_board_event_push1_blocktrigger))
        {
            ra.caninteract = false;
            eventactive = false;
            safe_delete(obj_couchwriter);
            timer = 0;
            con = 100;
        }
    }
    if (con == 100)
    {
        solved = true;
        timer++;
        ra.controlled = 0;
        if (timer >= 16)
        {
            kr.controlled = 1;
            kr.canfreemove = true;
            kr.cantleave = false;
            obj_mainchara.sprite_index = obj_mainchara.usprite;
            susiereal.image_speed = 0;
            susiereal.image_index = 0;
            susiereal.sprite_index = susiereal.usprite;
            scr_shakescreen();
            for (var i = 0; i < array_length(hazard); i++)
            {
                with (hazard[i])
                {
                    var puff = instance_create(x, y, obj_board_smokepuff);
                    puff.depth = depth - 100;
                    instance_destroy();
                }
            }
            with (obj_pushableblock_board)
            {
                if (extflag == "push1")
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
            snd_play_pitch(snd_impact_bc, 1.2);
            snd_play_pitch(snd_impact_bc, 0.6);
            con = 101;
            timer = 0;
        }
    }
    if (con == 101)
    {
        timer++;
        if (timer == 5)
        {
            var seconds = round(eventtimer / 30);
            timestring = stringsetsubloc("Wow, a ~1S time!", seconds, "obj_bpush1_slash_Step_0_gml_322_0");
            var earlytime = 13;
            var latetime = 30;
            if (eventtimer < (earlytime * 30))
            {
                timeresult = 1;
                secondstring = stringsetloc("Impressive!", "obj_bpush1_slash_Step_0_gml_330_0");
            }
            if (eventtimer >= (earlytime * 30) && eventtimer <= (latetime * 30))
            {
                timeresult = 2;
                secondstring = stringsetloc("That's concerning!!", "obj_bpush1_slash_Step_0_gml_335_0");
            }
            if (eventtimer >= (latetime * 30))
            {
                timeresult = 3;
                secondstring = stringsetloc("The audience is crying!", "obj_bpush1_slash_Step_0_gml_340_0");
            }
            tenna.bounce = 1;
            scr_couchtalk(timestring, "tenna", 2, 70);
        }
        if (timer == 75)
        {
            tenna.bounce = 1;
            scr_couchtalk(secondstring, "tenna", 2, 70);
            con = 102;
        }
    }
}
if (active == false)
{
    sutime = 0;
    susiewalkcon = 0;
    timer = 0;
    if (con == 1)
        con = 2;
    if (con >= 100)
        con = 900;
}
