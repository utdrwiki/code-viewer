scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
    var flowerspot = stringsetloc("Oh! A flower cut in half! This is a photo spot!", "obj_b2enrichmentenclosure_slash_Step_0_gml_42_0");
    var prettyflower = stringsetloc("Oh!! A pretty flower!", "obj_b2enrichmentenclosure_slash_Step_0_gml_10_0");
    if (con == 0 && obj_board_camera.con == 0)
    {
        if (global.flag[1190] == 0)
        {
            susie.controlled = 0;
            kris.controlled = 0;
            susie.controlled = 1;
            kris.camera = true;
            ralsei.controlled = 0;
            kris.allow_diagonals = false;
            obj_b2ralseichoose.con = 10;
            obj_b2ralseichoose.timer = 0;
            global.flag[1024] = 0;
            scr_resetgameshowcharacter("all");
            timer = 0;
            con = 1;
        }
        else
        {
            con = 20;
        }
    }
    if (con == 1)
    {
        timer++;
        if (timer == 15)
        {
            kriswobblecon = 1;
            scr_pathfind_to_point("kris", 4, 3, 0);
            scr_script_delayed(scr_pathfind_to_point, 15, "ralsei", 1, 3, 0);
            con = 1.1;
            timer = 0;
        }
    }
    if (con == 1.1)
    {
        if (scr_board_checklocation("kris", 4, 3, 2))
        {
            ratalkd = 1;
            var ratalk = flowerspot;
            if (ralseiknows == 0)
                ratalk = prettyflower;
            scr_couchtalk(ratalk, "ralsei", 2, 60);
            con = 1.2;
            timer = 0;
        }
    }
    if (con == 1.2)
    {
        timer++;
        if ((timer > 5 && button3_h()) || timer == 71)
        {
            with (obj_couchwriter)
                instance_destroy();
            var ratalk = stringsetloc("Umm, h... how do you take a photo?", "obj_b2enrichmentenclosure_slash_Step_0_gml_47_0");
            scr_couchtalk(ratalk, "ralsei", 2, 60);
            timer = 0;
            con = 1.3;
        }
    }
    if (con == 1.3)
    {
        timer++;
        if ((timer > 5 && button3_h()) || timer == 71)
        {
            with (kris)
            {
                takephoto = false;
                canfreemove = false;
                var playxround = round(x / 32) * 32;
                var playyround = round(y / 32) * 32;
                playxround -= ((camwidth / 2) * 32);
                playyround -= ((camheight / 2) * 32);
                playxround = round(playxround / 32) * 32;
                playyround = round(playyround / 32) * 32;
                mycam = instance_create(playxround, playyround, obj_board_playercamera);
                mycam.camwidth = camwidth;
                mycam.camheight = camheight;
                mycam.controllable = false;
            }
            con = 1.4;
            timer = 0;
        }
    }
    if (con == 1.4)
    {
        timer++;
        if ((timer > 5 && button3_h()) || timer == 70)
        {
            with (obj_board_playercamera)
                event_user(1);
            con = 1.5;
            timer = 0;
        }
    }
    if (con == 1.5)
    {
        timer++;
        if ((timer > 5 && button3_h() && !i_ex(obj_board_playercamera)) || timer == 20)
        {
            var ratalk = stringsetloc("Oops.", "obj_b2enrichmentenclosure_slash_Step_0_gml_74_0");
            scr_couchtalk(ratalk, "ralsei", 2, 60);
            timer = 0;
            con = 1.6;
        }
    }
    if (con == 1.6)
    {
        timer++;
        if ((timer > 5 && button3_h()) || timer == 60)
        {
            with (kris)
            {
                takephoto = false;
                canfreemove = false;
                var playxround = round(x / 32) * 32;
                var playyround = round(y / 32) * 32;
                playxround -= ((camwidth / 2) * 32);
                playyround -= ((camheight / 2) * 32);
                playxround = round(playxround / 32) * 32;
                playyround = round(playyround / 32) * 32;
                mycam = instance_create(playxround, playyround, obj_board_playercamera);
                mycam.camwidth = camwidth;
                mycam.camheight = camheight;
                mycam.controllable = false;
            }
            timer = 0;
            con = 1.7;
        }
    }
    if (con == 1.7)
    {
        timer++;
        var delaytime = 12;
        for (var i = 0; i < 6; i++)
        {
            if (timer == (20 + (delaytime * i)))
            {
                with (obj_board_playercamera)
                    remoted = true;
            }
        }
        if (timer == (20 + (delaytime * 7)))
        {
            with (obj_board_playercamera)
                remoter = true;
        }
        if (timer == (20 + round(delaytime * 7.5)))
        {
            with (obj_board_playercamera)
                event_user(1);
            timer = 0;
            con = 1.8;
        }
    }
    if (con == 1.8 && !i_ex(obj_board_playercamera))
    {
        var ratalk = stringsetloc("Haha, look, I got it!", "obj_b2enrichmentenclosure_slash_Step_0_gml_119_0");
        scr_couchtalk(ratalk, "ralsei", 2, 70);
        timer = 0;
        con = 1.9;
    }
    if (con == 1.9)
    {
        timer++;
        if (timer == 50 || (timer > 5 && button3_h()))
        {
            scr_play_recording("kris", "0D0D0D0D0D0D0D0D0D0D0W0W0W0R0R0R0R0R0R0R0R0W0W0W0W0W0W0W0W0D0D0D0D0D0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W");
            con = 2;
            timer = 0;
        }
    }
    if (con == 2)
    {
        timer++;
        if ((timer > 5 && button3_h()) || timer == 30)
        {
            if (button3_h())
                scr_play_recording("kris", "00");
            timer = 0;
            con = 10;
        }
    }
    if (con == 10)
    {
        var ratalk = stringsetloc("Taking photos is fun!", "obj_b2enrichmentenclosure_slash_Step_0_gml_135_0");
        scr_couchtalk(ratalk, "ralsei", 2, 60);
        scr_pathfind_to_point("kris", 0, 3, 3);
        timer = 0;
        con = 11;
    }
    if (con == 11 && scr_board_checklocation("kris", 0, 3, 2))
    {
        timer++;
        if (timer == 4)
        {
            global.interact = 1;
            with (obj_mainchara_board)
                controlled = 0;
            kris.controlled = 1;
            obj_board_camera.shift = "left";
            con = 12;
            timer = 0;
        }
    }
    if (con == 20)
    {
        if (ratalkd == 0)
        {
            rtim++;
            if (rtim == 40)
            {
                ratalkd = 1;
                var ratalk = flowerspot;
                if (ralseiknows == 0)
                    ratalk = prettyflower;
                scr_couchtalk(ratalk, "ralsei", 2, 60);
            }
        }
        if (suwalk == 0 && obj_board_camera.con == 0)
        {
            suwalktimer++;
            if (suwalktimer == 1)
                ralsei.follow = true;
            if (suwalktimer == 18)
            {
                scr_pathfind_to_point("susie", scr_even(irandom_range(200, 312)), scr_even(irandom_range(156, 222)), 0);
                susie.sleepy = true;
                suwalktimer = 0;
                suwalk = 1;
            }
        }
    }
}
else
{
    if (con == 12)
        con = 20;
    suwalk = 0;
    suwalktimer = 0;
    rtim = 0;
}
