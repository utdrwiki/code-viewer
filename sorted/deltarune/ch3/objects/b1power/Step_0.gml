if (kris == 0)
{
    with (obj_mainchara_board)
    {
        if (name == "kris")
            other.kris = id;
    }
}
if (ralsei == 0)
{
    with (obj_mainchara_board)
    {
        if (name == "ralsei")
            other.ralsei = id;
    }
}
if (susie == 0)
{
    with (obj_mainchara_board)
    {
        if (name == "susie")
            other.susie = id;
    }
}
if (powerup == 0)
{
    with (obj_board_pickup)
    {
        if (type == "power")
            other.powerup = id;
    }
}
if (kris_real == 0)
    kris_real = 1185;
if (susie_real == 0)
{
    with (obj_caterpillarchara)
    {
        if (name == "susie")
            other.susie_real = id;
    }
}
if (ralsei_real == 0)
{
    with (obj_caterpillarchara)
    {
        if (name == "ralsei")
            other.ralsei_real = id;
    }
}
if (tenna == 0)
{
    with (obj_actor_tenna)
        other.tenna = id;
}
if (active == 1)
{
    if (firstvisitdialogue == 0 && obj_board_camera.con == 0)
    {
        var sutalk = stringsetloc("Woah, what is that?", "obj_b1power_slash_Step_0_gml_18_0");
        scr_couchtalk(sutalk, "susie", 2, 60);
        firstvisitdialogue = 1;
    }
    if (con == 0 && obj_board_camera.con == 0)
    {
        timer++;
        if (timer == 1)
        {
            ralsei.follow = 0;
            scr_pathfind_end("ralsei");
            scr_pathfind_end("susie");
        }
        if (timer == 5)
            scr_pathfind_to_point("ralsei", 5, 4, 0);
        if (timer == 15)
        {
            scr_pathfind_to_point("susie", 8, 2);
            con = 1;
        }
    }
    if (con == 1)
    {
        if (powerup.con == 22)
        {
            scr_pathfind_end("susie");
            with (susie)
            {
                scr_script_delayed(scr_var, 1, "x", round(x));
                scr_script_delayed(scr_var, 1, "y", round(y));
                scr_script_delayed(scr_var, 1, "facing", 0);
            }
            con = 10;
        }
        if (powerup.con == 32)
        {
            timer = 0;
            con = 14;
        }
    }
    if (con == 10)
    {
        kris.facing = 0;
        kris.canfreemove = 0;
        ralsei.canfreemove = 0;
        ralsei.facing = 0;
        global.interact = 0;
        con = 11;
        timer = 0;
    }
    if (con == 11)
    {
        timer++;
        if (timer == 3)
        {
            scr_speaker("no_name");
            msgsetloc(0, "KRIS GOT THE \\cYPOWER CROISSANT\\cW", "obj_b1power_slash_Step_0_gml_79_0");
            var d = bw_make();
            d.side = 1;
        }
        if (timer == 15)
        {
            susie.x = floor(susie.x);
            susie.y = floor(susie.y);
        }
        if (timer == 16)
        {
            scr_pathfind_to_point("susie", kris.x - 32, kris.y);
            con++;
        }
    }
    if (con == 12)
    {
        if (susie.is_moving == false)
            susiefail++;
        susiefail2++;
        if (susiefail > 3 || (susiefail2 > 30 && susie.is_moving == false))
        {
            var targx = kris.x - 32;
            var targy = kris.y;
            with (susie)
            {
                path_end();
                susierecordstring = "";
                susierecordcon = 0;
                susierecordcount = 0;
                x = scr_even(lerp(x, targx, 0.16666666666666666));
                y = scr_even(lerp(y, targy, 0.16666666666666666));
                if (point_distance(x, y, xprevious, yprevious) > 4)
                {
                    var _facing = point_direction(xprevious, yprevious, x, y);
                    _facing += 90;
                    if (_facing > 360)
                        _facing -= 360;
                    _facing = round(_facing / 90);
                    if (_facing == 4)
                        _facing = 0;
                    facing = _facing;
                }
            }
        }
        if ((abs(kris.x - 32 - susie.x) < 8 && abs(kris.y - susie.y) < 8) || susiefail2 >= 60)
        {
            with (susie)
            {
                path_end();
                susierecordstring = "";
                susierecordcon = 0;
                susierecordcount = 0;
            }
            susie.x = kris.x - 32;
            susie.y = kris.y;
            susie.facing = 1;
            safe_delete(obj_board_writer);
            safe_delete(obj_writer);
            kris.fun = 0;
            kris.facing = 0;
            with (kris)
                scr_shakeobj();
            snd_play(snd_board_playerhurt);
            con = 13;
            timer = 0;
        }
    }
    if (con == 13)
    {
        timer++;
        if (timer == 2)
        {
            with (powerup)
                scr_jump_to_point_board(other.susie.x, other.susie.y - 32 - 8, 4, 10);
            timer = 0;
            con = 14;
        }
    }
    if (con == 14)
    {
        timer++;
        if (timer == 10)
        {
            if (!skipredo)
            {
                scr_pathfind_end("susie");
                with (susie)
                {
                    var transitiontime = 12;
                    var spintime = 1;
                    var spindelay = 3;
                    fun = 1;
                    sprite_index = dsprite;
                    scr_delay_var("sprite_index", lsprite, spintime * 3);
                    scr_delay_var("sprite_index", usprite, spintime * 4);
                    scr_delay_var("sprite_index", rsprite, spintime * 5);
                    scr_delay_var("sprite_index", dsprite, spintime * 6);
                    scr_delay_var("sprite_index", lsprite, spintime * 7);
                    scr_delay_var("sprite_index", usprite, spintime * 8);
                    scr_delay_var("sprite_index", rsprite, spintime * 9);
                    scr_delay_var("sprite_index", dsprite_item, spintime * 10);
                }
                snd_play_delay(snd_link_sfx_itemget, 12);
                powerup.makestars = false;
                powerup.makestarstimer = 0;
                with (powerup)
                    scr_delay_var("makestars", true, 12);
            }
            scr_speaker("no_name");
            msgsetloc(0, "SUSIE GOT THE \\cYPOWER CROISSANT\\cW/", "obj_b1power_slash_Step_0_gml_154_0");
            msgnextloc("SHE CAN NOW PICK UP POTS AND WEEDS./%", "obj_b1power_slash_Step_0_gml_155_0");
            var d = bw_make();
            d.side = 1;
            con = 15;
        }
    }
    if (con == 15 && !bw_ex())
    {
        powerup.con = 99999;
        powerup.depth = susie.depth + 1;
        scr_lerpvar_instance(powerup, "y", powerup.y, susie.y, 10, 2, "in");
        snd_play_delay(snd_item, 10);
        scr_doom(powerup, 10);
        con = -999;
        scr_script_delayed(scr_var, 10, "con", 16);
        timer = 0;
    }
    if (con == 16)
    {
        timer++;
        if (timer == 1)
        {
            susie_real.sprite_index = susie_real.rsprite;
            with (susie_real)
                scr_var_delay("sprite_index", usprite, 40);
            var susietalk = stringsetloc("Whoa, really?", "obj_b1power_slash_Step_0_gml_180_0");
            scr_couchtalk(susietalk, "susie", 2, 60);
            scr_pathfind_end("susie");
            susie.fun = 0;
            susie.facing = 0;
            scr_pathfind_end("ralsei");
            scr_pathfind_to_point("ralsei", 5, 4, 0);
            global.interact = 0;
            with (obj_mainchara_board)
                canfreemove = 1;
            global.flag[1020] = 1;
        }
        if (timer == 10)
        {
            timer = 0;
            scr_pathfind_to_point("susie", 416, 194, 0);
            con = 16.5;
        }
    }
    if (con == 16.5)
    {
        if (abs(susie.x - 416) < 6 && abs(susie.y - 194) < 6)
        {
            scr_pathfind_end("susie");
            debug_message("before: susiexy=" + string(susie.x) + "|" + string(susie.y));
            with (susie)
                setxy(416, 194);
            debug_message("after: susiexy=" + string(susie.x) + "|" + string(susie.y));
            susie.facing = 0;
            susie.grabbablelist[5] = 0;
            makesuretoreset = 1;
            scr_play_susie_recording("010W0W0W0W0W0W0W0W0U0U0W0W0W0W0W0W0W010W0W0W0W0W0W0W0W0W0W0W0L0L0L0L0L0L0L0L0L0L0D0D0D0W0W0W010W0W0W0U0U0U0W0L0L0W0W0W0W0W0W010W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0U0U0U0U0U0U0U0U0U0U0U0U0LU0LU0LU0LU0LU0LU0LU0LU0LU0LU0LU0LU0LU0LU0L0L0L0L0L0L0L0L010W0W0W0W0W0W0W0W0R0R0R0R0W0W010W0W0W0W0W0W0W0W0W0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L10L0W0W0W0W0W0W0W0D0D0D0W0W010W0W0W0W0W0W0W0W0W");
            con = 17;
        }
    }
    if (con == 17 && obj_board_camera.shift == "none")
    {
        timer++;
        if (timer == 36)
        {
            scr_pathfind_end("ralsei");
            var sutalk = stringsetloc("Finally, some goddamn GAMEPLAY.", "obj_b1power_slash_Step_0_gml_228_0");
            scr_couchtalk(sutalk, "susie", 2, 90);
        }
        if (timer == 79)
        {
            ralsei_real.sprite_index = spr_ralsei_surprise_left;
            with (ralsei_real)
                scr_var_delay("sprite_index", usprite, 90);
            var ratalk = stringsetloc("Watch what you're throwing!", "obj_b1power_slash_Step_0_gml_235_0");
            var bub = scr_couchtalk(ratalk, "ralsei", 2, 90);
            bub.depth -= 10;
            snd_play(snd_board_damage);
            with (ralsei)
            {
                if (myhealth > 1)
                    myhealth--;
                iframes = 20;
            }
        }
        if (timer == 105)
            restrain = true;
        if (timer == 152)
            restrain = false;
        if (timer == 106)
        {
            ralsei.fun = 1;
            ralsei.sprite_index = ralsei.usprite;
        }
        if (timer == 189)
            ralsei.sprite_index = ralsei.lsprite;
        if (timer == 205)
            scr_pathfind_to_point("susie", 4, 4);
        if (timer == 230)
        {
            debug_print("now kris can't leave");
            kris.cantleave = true;
            susie.facing = 1;
        }
        if (timer == 233)
            ralsei.sprite_index = ralsei.dsprite;
        if (timer == 234 && obj_board_camera.con == 0)
        {
            with (susie)
            {
                grabbed = other.ralsei;
                grab = 1;
                grabmarker = instance_create(x, y, obj_board_grabobject);
                with (grabmarker)
                {
                    drawreticle = false;
                    snd_play(snd_board_lift);
                    grabdaddy = other.id;
                    grabbedid = other.grabbed;
                    sprite_index = grabbedid.sprite_index;
                    image_xscale = grabbedid.image_xscale;
                    image_yscale = grabbedid.image_yscale;
                    image_speed = grabbedid.image_speed;
                    sourcex = grabbedid.x;
                    sourcey = grabbedid.y;
                }
                with (grabbed)
                {
                    fun = 0;
                    frozen = true;
                    setxy(board_tilex(-1), board_tiley(-1));
                    if (object_index == obj_mainchara_board)
                        canfreemove = 0;
                }
            }
        }
        if (timer == 234)
            ralsei.visible = false;
        if (timer == 236)
        {
            ralsei_real.sprite_index = spr_ralsei_shocked_left;
            ralsei_real.y -= 14;
            var ratalk = stringsetloc("H-hey!", "obj_b1power_slash_Step_0_gml_323_0");
            var bub = scr_couchtalk(ratalk, "ralsei", 2, 60);
        }
        if (timer == 240)
            scr_pathfind_to_point("susie", 3, 3, 1);
        if (timer == 275)
        {
            var sutalk = stringsetloc("Watch THIS!", "obj_b1power_slash_Step_0_gml_332_0");
            var bub = scr_couchtalk(sutalk, "susie", 2, 60);
            bub.depth -= 10;
        }
        if (timer == 300)
        {
            grabbedralsei = instance_create(obj_board_grabobject.x, obj_board_grabobject.y - 28, obj_board_marker);
            grabbedralsei.sprite_index = spr_board_ralsei_hurt;
            grabbedralsei.image_index = 1;
            grabbedralsei.image_speed = 0;
            grabbedralsei.depth = susie.depth - 1;
            scr_darksize(grabbedralsei);
            with (grabbedralsei)
                scr_jump_to_point_board(board_tilex(5.5), board_tiley(3), 12, 16);
            obj_board_grabobject.visible = false;
            snd_play(snd_board_throw);
        }
        if (timer == 302)
        {
            susie.fun = true;
            susie.sprite_index = spr_board_susie_walk_right;
        }
        if (timer == 316)
        {
            with (grabbedralsei)
                scr_board_depth();
            grabbedralsei.image_speed = 0.125;
            snd_play(snd_board_splash);
        }
        if (timer == 320)
        {
            with (ralsei_real)
                scr_shakeobj();
            snd_play(snd_wing);
            scr_resetgameshowcharacter("ralsei");
            ralsei_real.sprite_index = spr_ralsei_up;
            var ratalk = stringsetloc("I... I'm drowning!!", "obj_b1power_slash_Step_0_gml_367_0");
            if (obj_board_oasis.wither)
                ratalk = stringsetloc("It... It's quicksand!", "obj_b1power_slash_Step_0_gml_368_0");
            var bub = scr_couchtalk(ratalk, "ralsei", 2, 60);
        }
        if (timer == 324)
            ad = instance_create(x, y, obj_gameshow_drowningRalsei_ad);
        if (timer == 370)
        {
            with (tenna)
                scr_lerpvar("image_yscale", 2.4, 2, 8, 2, "in");
            with (tenna)
                scr_lerpvar("image_xscale", 1.8, 2, 6, 2, "in");
            var tetalk = stringsetloc("Ralsei plush! Fill him with liquid, throw him against the wall!", "obj_b1power_slash_Step_0_gml_379_0");
            if (obj_board_oasis.wither)
                tetalk = stringsetloc("I hope the class was paying attention to the physics of quicksand!", "obj_b1power_slash_Step_0_gml_380_0");
            scr_couchtalk(tetalk, "tenna", 2, 180);
        }
        if (timer == 508)
        {
            ralsei_real.sprite_index = spr_ralsei_shocked_right;
            ralsei_real.y -= 12;
            var ratalk = stringsetloc("Stop advertising me! I'm dying!", "obj_b1power_slash_Step_0_gml_387_0");
            if (obj_board_oasis.wither)
                ratalk = stringsetloc("Won't someone please help me?", "obj_b1power_slash_Step_0_gml_388_0");
            var bub = scr_couchtalk(ratalk, "ralsei", 2, 120);
        }
        if (timer > 470 && timer < 530)
        {
            if ((timer % 2) == 0)
                grabbedralsei.image_alpha = 1 - grabbedralsei.image_alpha;
        }
        if (timer == 530)
        {
            safe_delete(grabbedralsei);
            with (susie)
            {
                with (grabmarker)
                {
                    with (grabbedid)
                    {
                        setxy(other.sourcex, other.sourcey);
                        visible = true;
                        frozen = false;
                    }
                    grabdaddy.grabbed = 0;
                    grabdaddy.grab = 0;
                    grabdaddy.canfreemove = 1;
                    instance_destroy();
                }
            }
            kris.cantleave = false;
            ralsei.iframes = 20;
            ralsei.canfreemove = true;
            ralsei.fun = 0;
            ralsei.facing = 0;
            susie.fun = 0;
        }
        if (timer == 542)
        {
            scr_pathfind_to_point("susie", 4, 4);
            suchase = 0;
        }
        if (timer > 550 && suchase == 0)
        {
            if (abs(susie.x - board_tilex(4)) < 8 && abs(susie.y - board_tiley(4)) < 8)
            {
                scr_pathfind_end("susie");
                debug_message("_____chase section");
                debug_message("before: susiexy=" + string(susie.x) + "|" + string(susie.y));
                with (susie)
                    setxy(board_tilex(4), board_tiley(4));
                debug_message("after: susiexy=" + string(susie.x) + "|" + string(susie.y));
                suchase = 1;
                ralsei_real.sprite_index = spr_ralsei_walk_up;
                scr_resetgameshowcharacter("ralsei");
                susie.sleepy = true;
                ralsei.sleepy = true;
                var circlestring = "0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0RU0RU0U0U0U0U0U0U0U0U0U0U0U0U0U0U0LU0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0LD0D0D0D0D0D0D0D0D0D0D0D0D0D0D0RD0RD0R0R0R0R0R0R0R0R";
                for (var i = 0; i < 10; i++)
                    circlestring += circlestring;
                var suwalkstring = "0R0R0R0R0R0R0R0R0R0R" + circlestring;
                scr_play_ralsei_recording(circlestring);
                scr_play_susie_recording(suwalkstring);
            }
        }
        if (timer == 700)
        {
            tenna.bounce = 1;
            var tetalk = stringsetloc("Hey kid, let's keep this show rolling!", "obj_b1power_slash_Step_0_gml_461_0");
            scr_couchtalk(tetalk, "tenna");
        }
    }
    if (con == 200 && obj_board_camera.con == 0)
    {
        ralsei.follow = 1;
        susie.graballpots = false;
        var potcount = 0;
        with (obj_board_grabbleObject)
        {
            if (x >= 128 && x < 512 && y >= 64 && y <= 320)
                potcount++;
        }
        if (potcount > 0)
            susie.graballpots = true;
        con = 201;
    }
    if (con == 201)
    {
        if (susie.graballpots == false)
        {
            susie.sleepy = true;
            scr_pathfind_to_point("susie", choose(5, 6), 4, 0);
            con = 202;
        }
    }
    if (restrain == true && obj_board_camera.con == 0)
    {
        if (susie.y < 80)
            susie.y = 80;
    }
}
else
{
    restrain = false;
    if (makesuretoreset == true)
        makesuretoreset = false;
    if (i_ex(powerup))
    {
        timer = 0;
        con = 0;
        if (powerup.con != 2)
            powerup.con = 2;
        if (i_ex(powerup))
        {
            powerup.x = x + 192;
            powerup.y = y + 32;
        }
    }
    else
    {
        con = 200;
    }
}
