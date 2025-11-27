scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
    if (stolen == 0)
    {
        with (obj_board_trigger)
        {
            if (extflag == "b2moneyholestole")
            {
                if (place_meeting(x, y, obj_mainchara_board))
                {
                    debug_print("too late to turn back");
                    other.stolen = true;
                }
            }
        }
    }
    susie.sleepy = 1;
    if (con == 0 && obj_board_camera.con == 0)
    {
        ralsei.follow = 0;
        con = 1;
    }
    if (con == 1)
    {
        timer++;
        if (timer == 1)
        {
            tenna.bounce = 1;
            var tetalk = stringsetloc("Wait! That's *MY* secret bonus zone!", "obj_b2_moneyhole_slash_Step_0_gml_23_0");
            if (!global.flag[1022])
                scr_couchtalk(tetalk, "tenna", 2, 90);
            scr_play_recording("susie", "0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0LD0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0RD0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R");
        }
        if (timer == 70)
        {
            var sutalk = stringsetloc("Wow. Looks like mine, dude.", "obj_b2_moneyhole_slash_Step_0_gml_30_0");
            if (!global.flag[1022])
                scr_couchtalk(sutalk, "susie", 2, 80);
        }
        if (timer == 200)
        {
            scr_play_recording("susie", "0L0L0L0L0L0L0L0L0U0U");
            scr_play_recording("ralsei", "0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0W0W0W0W0W0W0W0W0W0W0W0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0W0W0W0W0W0W0W0W0W0W0W0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R");
        }
        if (timer == 220)
        {
            tenna.bounce = 1;
            var tetalk = stringsetloc("Well, haha, good luck reaching those!", "obj_b2_moneyhole_slash_Step_0_gml_43_0");
            if (!global.flag[1022])
                scr_couchtalk(tetalk, "tenna", 2, 80);
        }
        if (timer == 280)
        {
            tenna.bounce = 1;
            if (!global.flag[1022])
            {
                var tetalk = stringsetloc("I keep my investments SHORT-proof!", "obj_b2_moneyhole_slash_Step_0_gml_52_0");
                scr_couchtalk(tetalk, "tenna", 2, 90);
            }
            else
            {
                var sutalk = stringsetloc("Hm...", "obj_b2_moneyhole_slash_Step_0_gml_57_0");
                scr_couchtalk(sutalk, "susie", 2, 60);
            }
        }
        if (timer == 360)
        {
            susie.facing = 3;
            var ratalk = stringsetloc("Umm, let's just go, Susie...", "obj_b2_moneyhole_slash_Step_0_gml_64_0");
            scr_couchtalk(ratalk, "ralsei", 2, 90);
        }
        if (timer == 430)
        {
            scr_shakeobj(ra_real);
            snd_play(snd_noise);
            var ratalk = stringsetloc("W-wait!", "obj_b2_moneyhole_slash_Step_0_gml_71_0");
            scr_couchtalk(ratalk, "ralsei", 2, 70);
            extrareach = 1;
            susie.facing = 2;
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
        if (timer == 460)
            scr_play_recording("susie", "0W0W0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0W0D0D");
        if (timer == 490)
        {
            var ratalk = stringsetloc("I... I'm covered in ill-gotten gains!", "obj_b2_moneyhole_slash_Step_0_gml_114_0");
            scr_couchtalk(ratalk, "ralsei", 2, 90);
            ralsei.facing = 3;
            ra_real.sprite_index = spr_ralsei_walk_left_sad;
            scr_resetgameshowcharacter_delay("ralsei", 101);
            scr_board_forcethrow();
        }
        if (timer == 504)
        {
            scr_play_recording("susie", "0L0L0L0L0L0L0L0D0D");
            susie.sleepy = true;
        }
        if (timer == 591)
        {
            if (tennahere())
            {
                tenna.bounce = 1;
                var tetalk = stringsetloc("He told me digital currency was SECURE!!!", "obj_b2_moneyhole_slash_Step_0_gml_122_0");
                scr_couchtalk(tetalk, "tenna", 2, 90);
                snd_play_delay(snd_laughtrack_short_temp, 30);
            }
            con = 10;
        }
    }
    if (con == 15 && obj_board_camera.con == 0)
    {
        if (!global.flag[1022])
        {
            tenna.bounce = 1;
            var tetalk = stringsetloc("Sigh... Can't a guy have just one bonus zone to himself...? ", "obj_b2_moneyhole_slash_Step_0_gml_141_0");
            scr_couchtalk(tetalk, "tenna", 2, 150);
        }
        con = 9999;
    }
}
else
{
    if (con > 0 && con < 10)
        con = 20;
    if (con == 10)
        con = 15;
    timer = 0;
    extrareach = 0;
}
if (con == 20 && !active)
    con = 21;
if (con == 21)
{
    outtimer++;
    if (!global.flag[1022] && !stolen)
    {
        if (outtimer == 1)
        {
            var ratalk = stringsetloc("Good idea, Kris. That bonus wasn't ours.", "obj_b2_moneyhole_slash_Step_0_gml_174_0");
            scr_couchtalk(ratalk, "ralsei", 1, 90);
        }
        if (outtimer == 90)
        {
            tenna.bounce = 1;
            var tetalk = stringsetloc("That's right Ralsei!! Honesty and kindness pay!!!", "obj_b2_moneyhole_slash_Step_0_gml_180_0");
            scr_couchtalk(tetalk, "tenna", 2, 90);
        }
        if (outtimer == 180)
        {
            tenna.bounce = 1;
            var tetalk = stringsetloc("Here, have a single point!!!", "obj_b2_moneyhole_slash_Step_0_gml_185_0");
            scr_couchtalk(tetalk, "tenna", 2, 90);
        }
        if (outtimer == 220)
        {
            var pointsDisplay = instance_create(360, 398, obj_board_pointsGetDisplay);
            pointsDisplay.amount = 1;
            pointsDisplay.outofboard = 1;
            pointsDisplay.depth = 50;
        }
        if (active)
        {
            con = 99999;
            tenna.bounce = 1;
            var tetalk = stringsetloc("Hey hey hey what happened to respecting my zone!?!?", "obj_b2_moneyhole_slash_Step_0_gml_197_0");
            scr_couchtalk(tetalk, "tenna", 2, 80);
        }
    }
    else
    {
        con = 99999;
    }
}
if (extrareach == 1)
{
    with (obj_board_pointsGet)
    {
        if (place_meeting(x, y + 32, other.susie))
            event_user(0);
    }
}
