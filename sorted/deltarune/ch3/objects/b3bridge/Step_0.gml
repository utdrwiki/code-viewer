scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
    if (!i_ex(boulderdropper))
    {
        var locx = x;
        var locy = y;
        boulderdropper = instance_create(locx, locy, obj_boulderDropper);
        boulderdropper.daddy = id;
        boulderdropper.timer = 80;
        if (kris.x < 320)
            boulderdropper.premake = "right";
        else
            boulderdropper.premake = "left";
    }
    if (con == 0 && obj_board_camera.con == 0)
    {
        var yloc = 292;
        if (visit == 0)
            timer++;
        if (visit == 1)
        {
            timer++;
            if (timer == 1)
            {
                tenna.bounce = 1;
                var tetalk = stringsetloc("Watch out! Falling rocks!", "obj_b3bridge_slash_Step_0_gml_79_0");
                scr_couchtalk(tetalk, "tenna", 2, 60, 474, yloc);
            }
            if (global.flag[1124] == 2)
            {
            }
        }
    }
    if (suwalk == 0 && obj_board_camera.con == 0)
    {
        suwalktimer++;
        if (suwalktimer == 30)
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
                    visible = false;
                    frozen = true;
                    setxy(board_tilex(-1), board_tiley(-1));
                    if (object_index == obj_mainchara_board)
                        canfreemove = 0;
                }
            }
            suwalk = 1;
            var walkstring = "";
            for (var i = 0; i < irandom(14); i++)
                walkstring += "0W";
            if (susie.x < 320)
            {
                for (var i = 0; i < 96; i++)
                    walkstring += "0R";
            }
            else
            {
                for (var i = 0; i < 96; i++)
                    walkstring += "0L";
            }
            scr_play_recording("susie", walkstring);
        }
    }
    suhitbuff--;
    var suhit = false;
    susie.iframes = 20;
    if (suhitbuff <= 0)
    {
        with (susie)
        {
            if (place_meeting(x, y, obj_board_hazard))
            {
                var hurt = instance_place(x, y, obj_board_hazard);
                if (hurt.active_hitbox == true)
                {
                    suhit = true;
                    snd_play(snd_board_damage);
                }
                safe_delete(hurt);
            }
        }
        with (obj_board_grabobject)
        {
            if (place_meeting(x, y, obj_board_hazard))
            {
                var hurt = instance_place(x, y, obj_board_hazard);
                if (hurt.active_hitbox == true)
                {
                    suhit = true;
                    snd_play(snd_board_damage);
                }
                safe_delete(hurt);
            }
        }
    }
    if (suhit == true)
    {
        suhitbuff = 20;
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
    if (i_ex(obj_board_grabobject))
    {
        if (suhitbuff > 0 && ((suhitbuff / 2) % 2) == 0)
        {
            with (obj_board_grabobject)
                visible = 1 - visible;
        }
        if (suhitbuff <= 0)
        {
            with (obj_board_grabobject)
                visible = true;
        }
    }
}
else
{
    safe_delete(boulderdropper);
    suwalk = 0;
    suwalktimer = 0;
    if (timer > 0)
    {
        visit++;
        timer = 0;
    }
}
if (active && obj_board_camera.con != 0)
    susie.iframes = 0;
