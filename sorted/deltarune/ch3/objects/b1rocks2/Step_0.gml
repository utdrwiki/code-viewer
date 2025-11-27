if (player == 0)
{
    with (obj_mainchara_board)
    {
        if (name == "kris")
            other.player = id;
    }
}
scr_board_populatevars();
if (active == 1)
{
    if (sucon != 0 && obj_board_camera.con != 0)
        sucon = 0;
    if (sucon == 0 && obj_board_camera.con == 0)
    {
        if (obj_b1rocks1.sulazy == 1)
            sulazy = 1;
        if (obj_b1rocks1.sucomplain == 1)
            sucomplain = 1;
        if (obj_b1rocks1.supickup == 1)
            supickup = 1;
        ralsei.follow = 0;
        scr_pathfind_end("susie");
        scr_pathfind_end("ralsei");
        if (susie.x == 480)
            sudir = "left";
        else
            sudir = "right";
        sucon = -1;
        if (global.flag[1020])
            scr_var_delay("sucon", 20, 15);
        else if (sulazy == 0)
            scr_var_delay("sucon", 40, 12 + irandom(8));
        else
            scr_var_delay("sucon", 48, 12 + irandom(8));
    }
    if (sucon == 48)
    {
        if (sulazy == 1 && !i_ex(obj_tennatalkbubble) && !i_ex(obj_couchwriter))
        {
            var sutalk = stringsetloc("Whatever, I'm just going to wait for Kris to pull us to the next screen.", "obj_b1rocks2_slash_Step_0_gml_53_0");
            scr_couchtalk(sutalk, "susie", 2);
            sulazy = 2;
        }
        scr_play_susie_recording("0D0D0D");
    }
    if (sucon == 40)
    {
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
        sucon = 41;
    }
    if (sucon == 41)
    {
        if (susie.iframes > 0)
        {
            if (sucomplain == 0)
            {
                var sutalk = stringsetloc("Stupid rocks!!", "obj_b1rocks2_slash_Step_0_gml_77_0");
                scr_couchtalk(sutalk, "susie", 2);
                sucomplain = 1;
            }
            sucon = 42;
        }
    }
    if (sucon == 41 || sucon == 42)
    {
        if (sudir == "right" && susie.x >= 480)
        {
            scr_stop_susie_recording();
            susie.x = 480;
            susie.facing = 0;
            sulazy = true;
        }
        if (sudir == "left" && susie.x <= 128)
        {
            scr_stop_susie_recording();
            susie.x = 128;
            susie.facing = 0;
            sulazy = true;
        }
    }
    if (sucon == 20)
    {
        sucon = -1;
        scr_delay_var("sucon", 21, irandom(15) + 5);
        if (supickup == 0 && !i_ex(obj_tennatalkbubble) && !i_ex(obj_couchwriter))
        {
            var sutalk = stringsetloc("It's easy if you hold something over your head", "obj_b1rocks2_slash_Step_0_gml_112_0");
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
    if (sucon == 21)
    {
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
        sucon = 22;
    }
    if (sucon == 22)
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
            suhitbuff = 20;
            snd_play(snd_board_playerhurt);
            if (ralsei.myhealth > 1)
                ralsei.myhealth -= 1;
        }
        if (i_ex(grabmarker))
        {
            if (suhitbuff > 0 && ((suhitbuff / 2) % 2) == 0)
                grabmarker.visible = 1 - grabmarker.visible;
            if (suhitbuff <= 0)
                grabmarker.visible = true;
        }
        susie.iframes = 100;
        if (sudir == "right" && susie.x >= 480)
        {
            scr_play_susie_recording("0D0D0D");
            susie.x = 480;
            susie.facing = 0;
            sucon = 23;
            susie.iframes = 0;
        }
        if (sudir == "left" && susie.x <= 128)
        {
            scr_play_susie_recording("0D0D0D");
            susie.x = 128;
            susie.facing = 0;
            sucon = 23;
            susie.iframes = 0;
        }
    }
    if (talkcon == 0 && obj_board_camera.con == 0)
    {
        talkcon = -1;
        scr_delay_var("talkcon", 1, 10);
    }
    if (talkcon == 1)
    {
        var tentalk = stringsetloc("Uh oh!#Watch out#for falling#peaches!!", "obj_b1rocks2_slash_Step_0_gml_218_0");
        scr_tennabubble_xytail(tentalk, 576 + camerax(), 116 + cameray(), 584 + camerax(), 182 + cameray(), 1, -1, 8);
        talkcon = -1;
        scr_delay_var("talkcon", 2, 60);
    }
    if (talkcon == 2)
    {
        var couchtalk = stringsetloc("Peaches?#But I thought#that they were#rocks.", "obj_b1rocks2_slash_Step_0_gml_225_0");
        scr_couchtalk(couchtalk, "ralsei", 1, -1, -1, -1);
        talkcon = 3;
    }
    if (talkcon == 3 && !i_ex(obj_tennatalkbubble))
    {
        var talk = stringsetloc("I don't know where you got that idea.", "obj_b1rocks2_slash_Step_0_gml_232_0");
        var tentalk = stringsetloc("I have no#clue where you#got that idea.", "obj_b1rocks2_slash_Step_0_gml_233_0");
        scr_tennabubble_xytail(tentalk, 562 + camerax(), 122 + cameray(), 572 + camerax(), 172 + cameray(), 1, -1, 8);
        talkcon = 4;
    }
    if (!i_ex(boulderdropper))
    {
        boulderdropper = instance_create(x, y, obj_boulderDropper);
        boulderdropper.daddy = id;
        boulderdropper.timer = 90;
        if (player.x < 320)
            boulderdropper.premake = "right";
        else
            boulderdropper.premake = "left";
    }
}
else
{
    sucon = 0;
    grabmarker = 0;
    suhitbuff = 0;
    sudir = "none";
    if (i_ex(boulderdropper))
    {
        con = 0;
        roomvisit++;
        safe_delete(boulderdropper);
        boulderdropper = 0;
        dialogued = 0;
    }
}
