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
if (moat == 0)
{
    with (obj_board_lancermoat)
        other.moat = id;
}
if (button == 0)
{
    with (obj_board_lancerswitch)
        other.button = id;
}
if (cactus == 0)
{
    with (obj_board_lancercactus)
        other.cactus = id;
}
everythingIhaveline1 = stringsetloc("I WILL GIVE YOU EVERYTHING I HAVE!...../", "obj_b1lancer_slash_Step_0_gml_12_0");
everythingIhaveline2 = stringsetloc("AND^1, ALL I HAVE^1, IS MYSELF!/%", "obj_b1lancer_slash_Step_0_gml_13_0");
if (loadline == 0)
{
    if (i_ex(obj_b1spring))
    {
        howislancerinthegame = obj_b1spring.howislancerinthegame;
        tennaexpl = obj_b1spring.tennaexpl;
        loadline = true;
    }
}
if (i_ex(cactus))
{
    if (lancer == 0)
    {
        lancer = instance_create(cactus.x + 32, cactus.y - 10, obj_board_marker);
        lancer.sprite_index = spr_board_lancer_down;
        scr_darksize(lancer);
        lancer.depth = cactus.depth - 10;
    }
}
if (active == 1)
{
    var potcount;
    if (potinit == 0 && obj_board_camera.con == 0)
    {
        potinit = 1;
        potcount = 0;
        with (obj_board_grabbleObject)
        {
            if (x >= 128 && x < 512 && y >= 64 && y <= 320)
                potcount++;
        }
    }
    if (solved == 1 && obj_board_camera.con == 0)
    {
        if (wateringholeline == 0)
            wateringholeline = 1;
        if (wateringholeline == 2)
            wateringholeline = 3;
    }
    if (subcon == 0 && solved == 0 && i_ex(cactus) && cactus.triggered == true)
    {
        snd_play(snd_lancerhonk);
        help = false;
        lancereasteregg = -1;
        susiegrabhint = 999;
        sugrahittimer = 999;
        obj_board_lancerswitch.disabled = true;
        con = -999;
        subtimer = 0;
        subcon = 1;
        kris.canfreemove = false;
        solved = 1;
    }
    if (subcon == 1)
    {
        with (cactus)
            scr_shakeobj();
        with (lancer)
            scr_shakeobj();
        scr_delay_var("subcon", subcon + 1, 15);
        subcon = -1;
    }
    if (subcon == 2)
    {
        mudversion = true;
        msgsetloc(0, "OH HAPPY DAY! THE ENDLESS DEPTHS HAVE BEEN DRAINED!/", "obj_b1lancer_slash_Step_0_gml_95_0");
        msgnextloc("YOU HAVE RESCUED ME FROM MY SPINY TORMENT!/%", "obj_b1lancer_slash_Step_0_gml_96_0");
        var bw = bw_make();
        bw.side = 1;
        scr_boardlancer_voice();
        subcon++;
        subtimer = 0;
    }
    if (subcon == 3 && !bw_ex())
    {
        with (lancer)
            scr_depth_board();
        var starttime = 5;
        var jumptime = 20;
        subtimer++;
        if (subtimer == starttime)
        {
            lancer.sprite_index = spr_board_lancer_spin;
            lancer.image_speed = -0.5;
            with (lancer)
                scr_jump_to_point_board(board_tilex(2), board_tiley(5), 24, jumptime);
        }
        if (subtimer == (starttime + round(jumptime / 2)))
        {
            kris.facing = 3;
            susie.facing = 3;
            ralsei.facing = 3;
        }
        if (subtimer == (starttime + jumptime))
        {
            lancer.image_speed = 0;
            lancer.image_index = 0;
        }
        if (subtimer == (starttime + jumptime + 5))
            lancer.image_index = 3;
        if (subtimer == (starttime + jumptime + 5 + 5))
        {
            with (lancer)
                scr_depth_board();
            scr_boardlancer_voice();
            msgset(0, everythingIhaveline1);
            msgnext(everythingIhaveline2);
            var dd = bw_make();
            dd.side = 0;
            solvetimer = 0;
            con = 40;
            subcon++;
        }
    }
    if (subcon == 4)
    {
    }
    if (subcon == 5 && !bw_ex())
    {
        kris.facing = 0;
        susie.facing = 0;
        ralsei.follow = true;
        scr_board_caterpillar_interpolate_ralsei();
        kris.canfreemove = true;
        global.interact = 0;
        subcon = 6;
    }
    if (subcon == 6)
    {
        if (mudversion)
        {
            timer = 0;
            subcon = 7;
        }
    }
    if (susiegrabhint == 0 && global.flag[1020] == 1 && visit > 0 && !i_ex(obj_couchwriter) && !bw_ex())
    {
        susiegrabhint = 1;
        sugrahittimer = 0;
    }
    if (moat.wither == true)
        susiegrabhint = 999;
    if (susiegrabhint == 1)
    {
        sugrahittimer++;
        if (sugrahittimer == 30)
        {
            var sushint = stringsetloc("Can I throw something?", "obj_b1lancer_slash_Step_0_gml_185_0");
            scr_couchtalk(sushint, "susie", 2);
            susiegrabhint = 2;
        }
    }
    if (susietalked == 1)
        ur_timer++;
    if (ralseiwalkinit == 0 && obj_board_camera.con == 0)
    {
        if (visit > 0)
        {
            ralsei.follow = 0;
            scr_script_delayed(scr_pathfind_to_point, 8, "ralsei", 6, 5, 2);
            ralseiwalkinit = 1;
        }
    }
    if (susiewalkcon == 0 && obj_board_camera.con == 0 && visit > 0)
        susiewalkcon = 1;
    if (con == 0 && obj_board_camera.con == 0 && obj_board_camera.shift == "none")
    {
        var triggered = 0;
        var mytrigger = "lancercactus";
        with (kris)
        {
            if (place_meeting(x, y, obj_board_trigger))
            {
                var inst = instance_place(x, y, obj_board_trigger);
                if (inst.extflag == mytrigger)
                    triggered = 1;
            }
        }
        if (solved == 0)
        {
            if (i_ex(moat))
            {
                if (moat.myinteract != 0)
                    triggered = 1;
            }
            if (button.pressed && presscount < 2)
                triggered = 2;
        }
        if (triggered == 1)
        {
            if (i_ex(moat))
                moat.myinteract = 0;
            with (obj_board_trigger)
            {
                if (extflag == mytrigger)
                    instance_destroy();
            }
            if (visit == 0)
            {
                global.interact = 1;
                con = 1;
            }
            else
            {
                global.interact = 1;
                con = 10;
            }
            visit++;
        }
        if (triggered == 2)
        {
            if (global.flag[1020] == 0)
                con = 20;
            else
                con = 30;
        }
    }
    if (con == 1)
    {
        msgsetloc(0, "HELP^1! I'M STUCK IN THE SPINY SEA OF GREEN./", "obj_b1lancer_slash_Step_0_gml_267_0");
        msgnextloc("WON'T ANYONE FREE A POOR INNOCENT BOY?/%", "obj_b1lancer_slash_Step_0_gml_268_0");
        var bw = bw_make();
        bw.side = 1;
        scr_boardlancer_voice();
        con = 1.1;
    }
    if (con == 1.1 && !bw_ex())
    {
        if (global.flag[1020] == 0)
            extalk = 1;
        con = 9999;
        global.interact = 0;
    }
    if (con == 10)
    {
        scr_speaker("no_name");
        msgsetloc(0, "OH^1, COULD ANYONE THROW ME A CERAMIC POT?/", "obj_b1lancer_slash_Step_0_gml_289_0");
        msgnextloc("I'LL EVEN TAKE ONE WITHOUT SALSA AT THIS POINT./%", "obj_b1lancer_slash_Step_0_gml_290_0");
        var bw = bw_make();
        bw.side = 1;
        scr_boardlancer_voice();
        con = 11;
    }
    if (con == 11 && !bw_ex())
        con = 9999;
    if (con == 20)
    {
        if (presscount == 0)
        {
            con = 20.1;
            pctime = 0;
            scr_pathfind_to_point("susie", 2, 5, 3);
            presscount++;
        }
        else
        {
            con = 0;
        }
    }
    if (con == 20.1)
    {
        pctime++;
        if (pctime >= 10)
            con = 21;
    }
    if (con == 21)
    {
        var susiestring = stringsetloc("Do these do anything?", "obj_b1lancer_slash_Step_0_gml_317_0");
        scr_couchtalk(susiestring, "susie", 1);
        con = 22;
    }
    if (con == 22)
    {
        if (button.pressed == 0)
        {
            scr_pathfind_to_point("susie", 4, 5, 2);
            con = 0;
        }
    }
    if (con == 30 && obj_board_lancerswitch.pressed)
    {
        var __proceed = true;
        with (obj_board_trigger)
        {
            if (extflag == "potspawnchecker")
            {
                if (place_meeting(x, y, obj_mainchara_board))
                    __proceed = false;
            }
        }
        if (__proceed)
        {
            pot1 = instance_create_board(11, 3, obj_board_grabbleObject);
            pot2 = instance_create_board(11, 4, obj_board_grabbleObject);
            pot3 = instance_create_board(5, 7, obj_board_grabbleObject);
            pot4 = instance_create_board(6, 7, obj_board_grabbleObject);
            instance_create_board(11, 3, obj_board_smokepuff);
            instance_create_board(11, 4, obj_board_smokepuff);
            instance_create_board(5, 7, obj_board_smokepuff);
            instance_create_board(6, 7, obj_board_smokepuff);
            solvetimer = 0;
            con = 30.1;
        }
    }
    if (con == 30.1)
    {
        if (scr_board_checklocation("susie", 256, 224, 6))
        {
            solvetimer++;
            if (solvetimer == 1)
                susie.facing = 3;
            if (solvetimer == 30)
            {
                help = false;
                solved = 1;
                var susiesolvestring = stringsetloc("Hm...", "obj_b1lancer_slash_Step_0_gml_358_0");
                scr_couchtalk(susiesolvestring, "susie", 2, 60);
            }
            var a = 30;
            var b = 90;
            if (between(solvetimer, a + 5, b))
            {
                if (button3_h())
                    solvetimer = b - 1;
            }
            if (between(solvetimer, a, b))
            {
                if (button1_p())
                    solvetimer = b - 1;
            }
            if (solvetimer == 90)
            {
                timer = 0;
                con = 31;
                solvetimer = 0;
            }
        }
    }
    if (con == 31)
    {
        solvetimer++;
        if (solvetimer == 1)
        {
            var susiesolvestring = stringsetloc("Heh, got it!", "obj_b1lancer_slash_Step_0_gml_374_0");
            scr_couchtalk(susiesolvestring, "susie", 2, 80);
        }
        var a = 1;
        var b = 30;
        if (between(solvetimer, a + 5, b))
        {
            if (button3_h())
                solvetimer = b - 1;
        }
        if (between(solvetimer, a, b))
        {
            if (button1_p())
                solvetimer = b - 1;
        }
        if (solvetimer == 30)
        {
            scr_pathfind_to_point("susie", ralsei.x - 28, ralsei.y, 1);
            solvetimer = 0;
            con = 32;
        }
    }
    if (con == 32)
    {
        if (scr_board_checklocation("susie", ralsei.x - 28, ralsei.y, 4))
            solvetimer++;
        if (solvetimer == 1)
        {
            with (obj_board_lancerswitch)
                aesthetic = true;
            ralsei.visible = false;
            susie.fun = 1;
            susie.sprite_index = spr_board_susie_walk_right_armsup;
            ralmarker = instance_create(susie.x, susie.y - 32, obj_board_marker);
            ralmarker.sprite_index = spr_board_ralsei_walk_down;
            ralmarker.image_speed = 0.125;
            scr_darksize(ralmarker);
            snd_play(snd_board_lift);
            global.flag[1257]++;
            debug_print("ralsei lift: " + string(global.flag[1257]));
            var ralseitext = stringsetloc("M-me!?", "obj_b1lancer_slash_Step_0_gml_396_0");
            scr_couchtalk(ralseitext, "ralsei", 2, 70);
            solvetimer = 0;
            con = 33;
        }
    }
    if (con == 33)
    {
        solvetimer++;
        var a = 1;
        var b = 40;
        if (between(solvetimer, a + 5, b))
        {
            if (button3_h())
                solvetimer = b - 1;
        }
        if (between(solvetimer, a, b))
        {
            if (button1_p())
                solvetimer = b - 1;
        }
        if (solvetimer == 40)
        {
            var walktime = 8;
            scr_lerpvar_instance(susie, "x", susie.x, susie.x - 32, walktime);
            scr_lerpvar_instance(ralmarker, "x", ralmarker.x, ralmarker.x - 32, walktime);
            susie.sprite_index = spr_board_susie_walk_left_armsup;
            susie.image_speed = 0.125;
            with (susie)
                scr_script_delayed(scr_var, walktime, "sprite_index", spr_board_susie_walk_up_armsup);
            with (susie)
                scr_script_delayed(scr_var, walktime, "image_speed", 0);
            con = -19650976;
            scr_script_delayed(scr_var, walktime, "con", 34);
            solvetimer = 0;
        }
    }
    if (con == 34)
    {
        solvetimer++;
        var a = 1;
        var b = 5;
        if (between(solvetimer, a + 5, b))
        {
            if (button3_h())
                solvetimer = b - 1;
        }
        if (between(solvetimer, a, b))
        {
            if (button1_p())
                solvetimer = b - 1;
        }
        if (solvetimer == 5)
        {
            var throwtime = 10;
            with (ralmarker)
                scr_jump_to_point_board(x, 136, 12, throwtime);
            snd_play(snd_board_throw);
            snd_play_delay(snd_board_playerhurt, throwtime);
            susie.sprite_index = spr_board_susie_walk_up;
            solvetimer = 0;
            con = -19650976;
            scr_script_delayed(scr_var, throwtime, "con", 35);
            scr_delay_var("hurtralsei", 1, throwtime);
        }
    }
    if (con == 35)
    {
        var falltime = 10;
        with (cactus)
            scr_shakeobj();
        with (ralmarker)
            scr_jump_to_point_board(x, board_tiley(4), 12, falltime);
        con = 35.1;
        ptime = falltime;
        if (moat.wither == 0)
        {
            snd_play_delay(snd_board_splash, falltime);
            scr_doom(ralmarker, falltime);
        }
        else
        {
            snd_play_delay(snd_board_damage, falltime);
            with (ralsei)
                setxy(260, 192);
            ralsei.facing = 0;
            with (ralsei)
                scr_delay_var("visible", true, falltime);
            with (ralsei)
                scr_delay_var("iframes", 20, falltime);
            scr_doom(ralmarker, falltime);
        }
        solvetimer = 0;
    }
    if (con == 35.1)
    {
        ptime--;
        if (ptime == 0)
            con = 36;
    }
    if (con == 36)
    {
        var waitforrespawntime = 20;
        var lancerjumpdelay = waitforrespawntime + 15;
        solvetimer++;
        if (solvetimer == waitforrespawntime && moat.wither == 0)
        {
            ralsei.visible = true;
            ralsei.facing = 3;
            ralsei.iframes = 20;
        }
        if (solvetimer == lancerjumpdelay)
        {
            ralsei.facing = 3;
            var lancerspinspeed = 0.5;
            snd_play(snd_board_throw);
            var lancerjumptime = 10;
            lancer.sprite_index = spr_board_lancer_spin;
            lancer.image_speed = lancerspinspeed;
            with (lancer)
            {
                with (scr_jump_to_point_board(other.susie.x, other.susie.y - 32, 12, lancerjumptime))
                    board = true;
            }
            con = -19650976;
            solvetimer = 0;
            scr_script_delayed(scr_var, lancerjumptime, "con", 37);
        }
    }
    if (con == 37)
    {
        snd_play(snd_board_lift);
        susie.sprite_index = spr_board_susie_walk_up_armsup;
        lancer.image_speed = 0;
        lancer.image_index = 0;
        scr_boardlancer_voice();
        msgsetloc(0, "HO HO HO^1! YOU HAVE RESCUED ME!/%", "obj_b1lancer_slash_Step_0_gml_498_0");
        var dd = bw_make();
        dd.side = 0;
        global.interact = 1;
        solvetimer = 0;
        con = 38;
    }
    if (con == 38 && !bw_ex())
    {
        var lancerthrowdelay = 15;
        solvetimer++;
        if (solvetimer == 1)
            global.interact = 0;
        if (solvetimer == lancerthrowdelay)
        {
            susie.sprite_index = spr_board_susie_walk_left_armsup;
            lancer.sprite_index = spr_board_lancer_left;
            _target = instance_create_board(2, 5, obj_board_marker);
            _target.sprite_index = spr_board_throw_reticle;
            scr_darksize(_target);
            solvetimer = 0;
            con = 39;
        }
    }
    if (con == 39)
    {
        var lancerthrowdelay = 15;
        var lancerthrowtime = 12;
        var lancerlandingtimedelay = 5;
        solvetimer++;
        if (solvetimer == lancerthrowdelay)
        {
            var lancerspinspeed = 0.5;
            lancer.image_speed = lancerspinspeed;
            susie.facing = 3;
            susie.fun = 0;
            snd_play(snd_board_throw);
            with (lancer)
                scr_jump_to_point_board(other._target.x, other._target.y, 12, lancerthrowtime);
            snd_play_delay(snd_txtlan, lancerthrowtime);
            safe_delete(_target);
        }
        if (solvetimer == (lancerthrowdelay + lancerthrowtime))
        {
            with (lancer)
                scr_depth_board();
            lancer.image_speed = 0;
            lancer.sprite_index = spr_board_lancer_right;
        }
        if (solvetimer == (lancerthrowdelay + lancerthrowtime + lancerlandingtimedelay))
        {
            global.interact = 1;
            scr_boardlancer_voice();
            msgset(0, everythingIhaveline1);
            msgnext(everythingIhaveline2);
            var dd = bw_make();
            dd.side = 0;
            solvetimer = 0;
            con = 40;
        }
    }
    if (con == 40 && !bw_ex())
    {
        var xdest = 88;
        var ydest = 170;
        lancer.depth = 5000;
        lancer.sprite_index = spr_board_lancer_spin;
        snd_play_pitch(snd_board_door_close, 1.4);
        with (lancer)
        {
            scr_lerpvar("x", x, xdest, 45, -1, "in");
            scr_lerpvar("y", y, ydest, 45, -1, "out");
            scr_lerpvar("image_speed", 0.05, 0.25, 30, 2, "out");
            poof = instance_create(x, y, obj_board_smokepuff);
            poof.depth = depth + 20;
        }
        con = -9999;
        scr_delay_var("con", 41, 45);
    }
    if (con == 41)
    {
        var xdest = 88;
        var ydest = 170;
        safe_delete(lancer);
        obj_board_inventory.lancer = 1;
        snd_play(snd_item);
        solved = 1;
        scr_speaker("no_name");
        msgsetloc(0, "YOU GOT \\cYLANCER\\cW x1!\nIS THERE SOMETHING HE CAN DIG?/%", "obj_b1lancer_slash_Step_0_gml_592_0");
        snd_play(snd_link_sfx_itemget);
        var d = bw_make();
        d.side = 0;
        global.interact = 1;
        if (subcon != 4)
        {
            solved = 1;
            susie.graballpots = true;
            ralsei.facing = 0;
            con = 9999;
            scr_pathfind_to_point("ralsei", 7, 5, 0);
        }
        else
        {
            con = -999;
            subcon = 5;
        }
    }
    if (con == 9999 && !bw_ex())
    {
        global.interact = 0;
        con = 0;
    }
    if (ralseiwalkinit == 1)
    {
        if (ralsei.x == board_tilex(5) && ralsei.y == board_tiley(5))
            ralseiwalkinit = 2;
    }
    if (susiewalkcon == 1)
    {
        if (solved == 1 && supotcon == 0 && potcount > 0)
        {
            with (susie)
                graballpots = true;
            supotcon = 1;
            susiewalkcon = 999;
        }
        else
        {
            scr_script_delayed(scr_pathfind_to_point, 4, "susie", 4, 5, 2);
            susiewalkcon = 2;
        }
    }
    if (susiewalkcon == 2)
    {
        if (susie.x == board_tilex(4) && susie.y == board_tiley(5))
            susiewalkcon = 3;
    }
    if (lancereasteregg == 0 && visit > 0 && presscount > 0 && solved == 0)
    {
        ltimer++;
        if (ltimer >= 60)
            lancereasteregg = 1;
    }
}
else
{
    supotcon = 0;
    ur_timer = 0;
    ralseiwalkinit = 0;
    susiewalkcon = 0;
    suwalktimer = 0;
    if (wateringholeline == 1)
        wateringholeline = 2;
    potinit = 0;
    safe_delete(pot1);
    safe_delete(pot2);
    safe_delete(pot3);
    safe_delete(pot4);
}
if (global.flag[1020] == 1)
    lancereasteregg = 999;
if (lancereasteregg == 1)
{
    reallancer = instance_create(62, 438, obj_marker);
    reallancer.sprite_index = spr_lancer_ut;
    reallancer.depth = 95010;
    scr_darksize(reallancer);
    scr_lerpvar_instance(reallancer, "y", 438, 406, 8, -1, "out");
    lancereasteregg = 2;
    ltimer = 0;
    lbub = 0;
}
if (lancereasteregg == 2)
{
    ltimer++;
    if (ltimer == 75)
    {
        var lancereastereggtext = stringsetloc("That guy looks cute!#You should save him!", "obj_b1lancer_slash_Step_0_gml_754_0");
        lbub = scr_couchtalk(lancereastereggtext, "lancer", 0, 90, 100, 368, 134);
        lbub.mycolor = hexcolor(#BD8555);
    }
    if (ltimer == 180)
        scr_lerpvar_instance(reallancer, "y", 406, 480, 8, -1, "in");
    if (ltimer == 188)
    {
        safe_delete(reallancer);
        lancereasteregg = 4;
        ltimer = 0;
    }
}
if (lancereasteregg == 4)
{
    if (active)
    {
        ltimer++;
        if (ltimer == 15)
        {
            var ralseitext = stringsetloc("Hmm... looks like we#can't do anything#for now...", "obj_b1lancer_slash_Step_0_gml_777_0_b");
            scr_couchtalk(ralseitext, "ralsei", 2, 120);
        }
        if (ltimer == 135)
        {
            var susietext = stringsetloc("Yeah...#guess so...", "obj_b1lancer_slash_Step_0_gml_782_0");
            scr_couchtalk(susietext, "susie", 2, 90);
            lancereasteregg = 99;
        }
    }
    else
    {
        lancereasteregg = 99;
    }
}
if (extalk == 1)
{
    extimer++;
    if (extimer == 1)
    {
        var susiestring = stringsetloc("Damn, it's Lancer!#We gotta save him!", "obj_b1lancer_slash_Step_0_gml_777_0");
        scr_couchtalk(susiestring, "susie", 1, 120);
        susietalked = 1;
    }
}
if (wateringholeline == 3)
{
    wattimer++;
    if (wattimer < 14)
    {
        if (obj_board_inventory.lancer == 0)
        {
            wateringholeline = 999;
            wattimer = 9999;
        }
    }
    if (wattimer == 14)
    {
        lancmarker = scr_dark_marker(60, 470, spr_lancer_ut);
        lancmarker.depth = 94990;
        with (lancmarker)
            scr_lerpvar("y", 438, 406, 8, -1, "out");
    }
    if (wattimer == 30)
    {
        var lancertalk = stringsetloc("NOSTALGIC.#MY OLD WATERING#HOLE...", "obj_b1lancer_slash_Step_0_gml_814_0");
        if (obj_board_oasis.wither != 0)
            lancertalk = stringsetloc("NOSTALGIC. MY#OLD MUD HOLE...", "obj_b1lancer_slash_Step_0_gml_815_0");
        lbub = scr_couchtalk(lancertalk, "lancer", 1, 90, 96, 356, 134);
        lbub.mycolor = hexcolor(#BD8555);
    }
    if (wattimer < 150)
    {
        var trig = false;
        with (obj_b1spring)
        {
            if (active)
                trig = true;
        }
        if (trig)
        {
            wattimer = 150;
            with (lbub)
                instance_destroy();
        }
    }
    if (wattimer == 150)
    {
        with (lancmarker)
            scr_lerpvar("y", 406, 478, 20, -1, "in");
    }
    if (wattimer == 170)
    {
        safe_delete(lancmarker);
        wateringholeline = 999;
    }
}
if (hurtralsei == 1)
{
    hurtralsei = 0;
    with (obj_mainchara_board)
    {
        if (name == "ralsei")
        {
            if (myhealth > 1)
                myhealth--;
            with (obj_board_healthbar)
            {
                if (target == other.id)
                {
                    scr_shakeobj();
                    scr_delay_var("mycolor", mycolor, 2);
                    mycolor = c_red;
                }
            }
        }
    }
}
