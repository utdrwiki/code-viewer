if (init == 0)
    init = 1;
if (player == 0)
{
    with (obj_mainchara_board)
    {
        if (name == "kris")
            other.player = id;
    }
}
scr_board_populatevars();
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
if (trigger1 == 0)
{
    with (obj_b1rockstrigger)
    {
        if (extflag == 1)
            other.trigger1 = id;
    }
}
if (trigger2 == 0)
{
    with (obj_b1rockstrigger)
    {
        if (extflag == 2)
            other.trigger2 = id;
    }
}
var activeroom = 0;
if (trigger1.active)
    activeroom = trigger1;
if (trigger2.active)
    activeroom = trigger2;
if (activeroom != 0)
    active = true;
else
    active = false;
if (active == 1)
{
    if (global.interact == 0)
    {
        if (splatside == 0 && obj_board_camera.con == 0)
        {
            if (kris.x < 320)
                splatside = 1;
            else
                splatside = 2;
        }
        if (roomvisit == 0)
        {
            firstroom = trigger1;
            if (trigger2.active == true)
                firstroom = trigger2;
            eventchosen = 1;
            tenna.bounce = 1;
            global.flag[1124] = 1;
            var tetalk = stringsetloc("Watch it! Falling rocks!", "obj_b1rocks1_slash_Step_0_gml_50_0");
            scr_couchtalk(tetalk, "tenna", 2, 60);
            scr_var_delay("eventchosen", 0, 80);
            roomvisit = 1;
        }
        if (roomvisit == 2)
        {
            if (firstroom != activeroom)
            {
                tenna.bounce = 1;
                eventchosen = 1;
                global.flag[1124] = 2;
                var tetalk = stringsetloc("Watch it! Falling peaches!!", "obj_b1rocks1_slash_Step_0_gml_62_0");
                scr_couchtalk(tetalk, "tenna", 2, 80);
                roomvisittimer = 0;
                roomvisit = 3;
            }
        }
        if (roomvisit == 3)
        {
            roomvisittimer++;
            if (roomvisittimer == 60)
            {
                ralsei_real.sprite_index = spr_ralsei_walk_right;
                ralsei_real.image_speed = 0;
                ralsei_real.image_index = 0;
                with (ralsei_real)
                    scr_delay_var("sprite_index", usprite, 120);
                var ratalk = stringsetloc("Didn't you say rocks, before?", "obj_b1rocks1_slash_Step_0_gml_77_0");
                scr_couchtalk(ratalk, "ralsei", 2, 80);
            }
            if (roomvisittimer == 120)
            {
                tenna.bounce = 1;
                ralsei_real.sprite_index = spr_ralsei_walk_right_unhappy;
                var tetalk = stringsetloc("What?", "obj_b1rocks1_slash_Step_0_gml_84_0");
                scr_couchtalk(tetalk, "tenna", 2, 80);
            }
            if (roomvisittimer == 220)
            {
                eventchosen = 0;
                roomvisit = -1;
            }
        }
        if (!i_ex(boulderdropper))
        {
            var locx = trigger1.x;
            var locy = trigger1.y;
            if (trigger2.active)
            {
                locx = trigger2.x;
                locy = trigger2.y;
            }
            boulderdropper = instance_create(locx, locy, obj_boulderDropper);
            boulderdropper.daddy = id;
            boulderdropper.timer = 90;
            if (player.x < 320)
                boulderdropper.premake = "right";
            else
                boulderdropper.premake = "left";
        }
        if (npcwalk == 0 && obj_board_camera.con == 0)
        {
            ralsei.follow = false;
            scr_pathfind_end("susie");
            if (eventchosen == 0)
            {
                if (global.flag[1020] == 0)
                {
                    if (ralseicharge == 0)
                    {
                        npcwalk = 1;
                        ralseicharge = 1;
                        eventchosen = 1;
                    }
                    else if (sulazy == 0)
                    {
                        sulazy = 1;
                        npcwalk = 99;
                        snd_play(snd_wing);
                        var sutalk = stringsetloc("Forget this. Kris, you cross the bridge.", "obj_b1rocks1_slash_Step_0_gml_136_0");
                        with (susie_real)
                        {
                            scr_shakeobj();
                            sprite_index = rsprite;
                            scr_var_delay("sprite_index", usprite, 90);
                        }
                        scr_couchtalk(sutalk, "susie", 2, 80);
                    }
                    else if (sulazy == 1)
                    {
                        sulazy = 2;
                        npcwalk = 99;
                        with (ralsei_real)
                        {
                            sprite_index = spr_ralsei_smile_up;
                            scr_var_delay("sprite_index", usprite, 90);
                        }
                        var ratalk = stringsetloc("I believe in you, Kris!", "obj_b1rocks1_slash_Step_0_gml_154_0");
                        scr_couchtalk(ratalk, "ralsei", 2, 80);
                    }
                }
                else
                {
                    npcwalk = 20;
                    eventchosen = 1;
                }
            }
        }
        if (npcwalk == 1)
        {
            var radir = "right";
            if (ralsei.x == 480)
                radir = "left";
            rastart = ralsei.x;
            var rawalk = "";
            if (radir == "right")
            {
                repeat (800)
                    rawalk += "0R";
            }
            if (radir == "left")
            {
                repeat (800)
                    rawalk += "0L";
            }
            scr_play_ralsei_recording(rawalk);
            rahit = 0;
            npcwalk = 2;
            npcwalktimer = 0;
            var ratalk = stringsetloc("Kris! I'll protect you!", "obj_b1rocks1_slash_Step_0_gml_182_0");
            scr_couchtalk(ratalk, "ralsei", 2, 60);
        }
        if (npcwalk == 2)
        {
            npcwalktimer++;
            if (npcwalktimer > 30)
            {
                if (ralsei.x == 480 || ralsei.x == 128)
                {
                    scr_play_ralsei_recording("0W");
                    if (ralsei.x == 480)
                    {
                        with (ralsei)
                            scr_var_delay("facing", 3, 1);
                    }
                    else
                    {
                        with (ralsei)
                            scr_var_delay("facing", 1, 1);
                    }
                    npcwalk = 3;
                    npcwalktimer = -90;
                }
            }
        }
        if (npcwalk == 3)
        {
            npcwalktimer++;
            if (npcwalktimer == 30)
            {
                var radir = "right";
                if (susie.x == 480)
                    radir = "left";
                var rawalk = "";
                if (radir == "right")
                {
                    repeat (800)
                        rawalk += "0R";
                }
                if (radir == "left")
                {
                    repeat (800)
                        rawalk += "0L";
                }
                scr_play_susie_recording(rawalk);
                var sutalk = stringsetloc("Sweet.", "obj_b1rocks1_slash_Step_0_gml_219_0");
                scr_couchtalk(sutalk, "susie", 2, 60);
            }
            if (npcwalktimer > 60)
            {
                if (susie.iframes > 0 && suhit == 0)
                {
                    suhit = 1;
                    var sutalk = stringsetloc("$@&!", "obj_b1rocks1_slash_Step_0_gml_227_0");
                    scr_couchtalk(sutalk, "susie", 2, 60);
                }
                if (susie.x == 480 || susie.x == 128)
                {
                    scr_play_susie_recording("0W");
                    if (susie.x == 480)
                    {
                        with (susie)
                            scr_var_delay("facing", 3, 1);
                    }
                    else
                    {
                        with (susie)
                            scr_var_delay("facing", 1, 1);
                    }
                    npcwalk = 4;
                    npcwalktimer = 0;
                }
            }
        }
        if (npcwalk == 20)
        {
            npcwalk = -1;
            scr_delay_var("npcwalk", 21, 10);
            if (supickup == 0)
            {
                var sutalk = stringsetloc("It's easy if you hold something over your head.", "obj_b1rocks1_slash_Step_0_gml_252_0");
                scr_couchtalk(sutalk, "susie", 2);
                supickup = 1;
            }
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
                    visible = false;
                    frozen = true;
                    setxy(board_tilex(-1), board_tiley(-1));
                    if (object_index == obj_mainchara_board)
                        canfreemove = 0;
                }
            }
        }
        if (npcwalk == 21)
        {
            sudir = "right";
            if (susie.x == 480)
                sudir = "left";
            var suwalk = "";
            if (sudir == "right")
            {
                repeat (800)
                    suwalk += "0R";
            }
            if (sudir == "left")
            {
                repeat (800)
                    suwalk += "0L";
            }
            scr_play_susie_recording(suwalk);
            suhitbuff = 0;
            npcwalk = 22;
        }
        if (npcwalk == 22)
        {
            suhitbuff--;
            if (grabmarker == 0)
            {
                with (obj_board_grabobject)
                    other.grabmarker = id;
            }
            var _hit = 0;
            with (susie)
            {
                if (place_meeting(x, y, obj_board_hazard))
                    _hit = 1;
            }
            if (_hit == 1 && suhitbuff <= 0)
            {
                if (ralseihitwhine == 0)
                {
                    var raltalk = stringsetloc("HEY!!!", "obj_b1rocks1_slash_Step_0_gml_316_0");
                    scr_couchtalk(raltalk, "ralsei", 2, 60);
                    ralseihitwhine = 1;
                    with (ralsei_real)
                    {
                        sprite_index = spr_ralsei_shocked_left;
                        scr_shakeobj();
                        scr_delay_var("x", x, 60);
                        scr_delay_var("y", y, 60);
                        setxy(x - 18, y - 8);
                        scr_delay_var("sprite_index", usprite, 60);
                    }
                }
                suhitbuff = 20;
                snd_play(snd_board_playerhurt);
                with (ralsei)
                {
                    iframes = 20;
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
            if (i_ex(grabmarker))
            {
                if (suhitbuff > 0 && ((suhitbuff / 2) % 2) == 0)
                    grabmarker.visible = 1 - grabmarker.visible;
                if (suhitbuff <= 0)
                    grabmarker.visible = true;
            }
            susie.iframes = 2;
            if (sudir == "right" && susie.x >= 480)
            {
                scr_play_susie_recording("0W");
                susie.x = 480;
                susie.facing = 3;
                ralsei.facing = 3;
                npcwalk = 23;
                susie.iframes = 0;
                ralsei.iframes = 0;
                if (i_ex(grabmarker))
                    grabmarker.visible = true;
            }
            if (sudir == "left" && susie.x <= 128)
            {
                scr_play_susie_recording("0W");
                susie.x = 128;
                susie.facing = 1;
                npcwalk = 23;
                susie.iframes = 0;
                ralsei.iframes = 0;
                ralsei.facing = 1;
                if (i_ex(grabmarker))
                    grabmarker.visible = true;
            }
        }
    }
}
else
{
    splatside = 0;
    if (i_ex(boulderdropper))
    {
        safe_delete(boulderdropper);
        boulderdropper = 0;
    }
    eventchosen = 0;
    if (roomvisit == 1)
        roomvisit = 2;
    if (roomvisit > 2)
        roomvisit = -1;
    if (npcwalk != 0)
    {
        ralsei.iframes = 0;
        susie.iframes = 0;
        npcwalk = 0;
    }
    npcwalktimer = 0;
    safe_delete(grabmarker);
    grabmarker = 0;
}
if (!active && ralseiwashit == 1)
{
    if (!instance_exists(obj_board_splattered_ralsei))
    {
        ralseiwashit = 2;
        with (obj_mainchara_board)
        {
            if (name == "ralsei")
            {
                visible = true;
                iframes = 0;
            }
        }
    }
}
