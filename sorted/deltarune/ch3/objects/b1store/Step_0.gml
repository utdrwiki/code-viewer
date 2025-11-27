if (pointcount < global.flag[1044])
    pointcount = global.flag[1044];
scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
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
    if (global.interact == 0)
        susietimer++;
    if (writerinit == 0 && obj_board_camera.con == 0)
    {
        shopstring = stringsetloc("NEED HEALING IN#BATTLE? TRY OUR#IN-GAME PURCHASES!", "obj_b1store_slash_Step_0_gml_29_0");
        if (susieshoplift != 0 && i_ex(key))
            shopstring = stringsetloc("HEY THIEF!GET A KEY!#JUST 250 POINTS!", "obj_b1store_slash_Step_0_gml_34_0");
        shopwriter = instance_create(x, y, obj_board_shopwriter);
        shopwriter.shopstring = shopstring;
        writerinit = 1;
    }
    if (made == 0 && obj_board_camera.con == 0)
    {
        instance_create_board(3, 4.5, obj_board_smokepuff);
        instance_create_board(8, 4.5, obj_board_smokepuff);
        key = instance_create_board(3, 4.5, obj_board_store_key);
        key.cost = 250;
        heal = instance_create(x + board_tilex(3), y + board_tiley(1.5), obj_board_tvdinner);
        heal.active = true;
        tennamarker = instance_create_board(5.5, 1.25, obj_board_marker);
        tennamarker.sprite_index = spr_board_npc_tenna;
        tennamarker.image_speed = 0.05;
        with (tennamarker)
            scr_depth_board();
        scr_darksize(tennamarker);
        tennasolid = instance_create_board(5.5, 1.25, obj_board_solid);
        tennasolid.sprite_index = spr_board_npc_tenna;
        scr_darksize(tennasolid);
        instance_create(304, 88, obj_board_smokepuff);
        made = 1;
    }
    if (susieshoplift == 0)
    {
        if (i_ex(heal))
        {
            if (heal.con > 1)
            {
                safe_delete(shopwriter);
                shopwriter = -2;
            }
        }
        if (shopwriter == -2)
        {
            if (!i_ex(heal))
            {
                shopwriter = instance_create(x, y, obj_board_shopwriter);
                shopwriter.shopstring = stringsetloc("BUY MORE LATER!!", "obj_b1store_slash_Step_0_gml_85_0");
            }
        }
    }
    if (con == 0 && obj_board_camera.con == 0)
    {
        var picked = 0;
        if (susieshoplift == 0 && global.flag[1020] == 1 && i_ex(key))
        {
            con = 1;
            timer = 0;
            picked = 1;
        }
        if (susieshoplift == 1)
        {
            con = 5;
            timer = 0;
            picked = true;
        }
        if (!picked && visit == 0)
        {
            con = 10;
            timer = 0;
            picked = true;
        }
        if (!picked && visit == 1)
        {
            con = 15;
            timer = 0;
            picked = true;
        }
        if (!picked && visit > 1)
        {
            con = 20;
            timer = 0;
            picked = true;
        }
    }
    var _blocked = false;
    if (i_ex(key) && key.myinteract >= 3)
        _blocked = true;
    if (global.interact != 0)
        _blocked = true;
    with (obj_board_tvdinner)
    {
        if (myinteract >= 3)
            _blocked = true;
    }
    if (con == 1 && !_blocked)
    {
        timer++;
        if (timer == 15)
        {
            susie.allow_diagonals = false;
            scr_pathfind_to_point("susie", 256, 208, 3);
        }
        if (timer > 8 && scr_board_checklocation("susie", 256, 208, 4))
        {
            timer = 0;
            con = 1.1;
        }
    }
    if (con == 1.1 && !_blocked && obj_board_camera.shift == "none")
    {
        timer++;
        if (timer == 25)
            debug_print("five frames!!");
        if (timer == 30)
        {
            kris.cantleave = true;
            with (key)
                tempblock = true;
            with (obj_board_tvdinner)
                tempblock = true;
            safe_delete(shopwriter);
            with (susie)
            {
                freeroam = true;
                grabbed = other.key;
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
                    setxy(board_tilex(-1), board_tiley(-1));
            }
        }
        if (timer == 40)
        {
            with (su_real)
                scr_shakeobj();
            snd_play(snd_wing);
            susieshoplift = 1;
            var sustring = stringsetloc("Oops. You didn't see that.", "obj_b1store_slash_Step_0_gml_202_0");
            scr_couchtalk(sustring, "susie", 2, 80);
            scr_play_recording("susie", "0L0L0L0R0R0R0L0L0LR0R0R0L0L0L0R0L0L0L0L0L0R0R0LR0L0L0L0R0R0R0R0R0R0R0R0R0L0L0L0L0L0L0L0LU0U0U0U0U02010D0D0D0D0RD0RD0RD0RD0R0R0R0R0R0R0R0R0R0RD0RD0RD0RD0RD0RD0R0R0R0R0R0R0R0R0R0R0R0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D");
        }
        if (timer == 50)
        {
            shopwriter = instance_create(x, y, obj_board_shopwriter);
            shopwriter.shopstring = stringsetloc("THIEF!!", "obj_b1store_slash_Step_0_gml_217_0");
        }
        if (timer > 60)
        {
            var krisblocked = false;
            with (key)
            {
                if (place_meeting(x, y, other.kris))
                {
                    with (other)
                    {
                        krisblocked = true;
                        kris.y += 4;
                        kris.y = scr_even(kris.y);
                    }
                }
            }
            if (key.x == 224 && key.y == 96 && susie.y >= 320 && krisblocked == false)
            {
                timer = 0;
                con = 3;
                key.tempblock = false;
                with (obj_board_tvdinner)
                    tempblock = false;
                kris.cantleave = false;
            }
        }
    }
    if (con == 1 || con == 1.1 || con == 2)
    {
        if (!i_ex(key) || (i_ex(key) && key.myinteract >= 3))
        {
            scr_pathfind_to_point("susie", 3, 6, 0);
            timer = 0;
            con = 3;
            key.tempblock = false;
            with (obj_board_tvdinner)
                tempblock = false;
            kris.cantleave = false;
        }
    }
    if (con == 5 && !_blocked)
    {
        timer++;
        if (timer == 1)
        {
            susie.facing = 2;
            if (!i_ex(key))
                con = 20;
        }
        if (timer == 80)
        {
            susie.freeroam = true;
            scr_play_recording("susie", "0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D");
        }
    }
    if (con == 10 && !_blocked)
    {
        timer++;
        if (timer == 8)
            scr_play_recording("susie", "0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0RU0RU0RU0R0R0R0R0R0R0R0R0RU0RU0RU0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0LU0L0L0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0D0D0D0D0D0D0D0D0D0D0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0LU0U0U0U0U0U0U0U0W0W0W0R0R0R0W0W0W0W0W0W0W0W0W0W0W0W0L0L0L0L0D0D0D0D0D0D0D0D0RD0RD0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0RU0U0U0U0U0U0U0U0U0LU0L0L0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0LD0LD00L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D");
        if (timer == 130)
        {
            visit = 1;
            var sutalk = stringsetloc("How do I kill this guy?", "obj_b1store_slash_Step_0_gml_125_0");
            scr_couchtalk(sutalk, "susie", 2, 80);
        }
        var time2 = 203;
        if (timer == time2)
        {
            var tetalk = stringsetloc("Get in line, kid!", "obj_b1store_slash_Step_0_gml_135_0");
            scr_couchtalk(tetalk, "tenna", 2, 90);
            tenna.bounce = 1;
        }
        if (timer == (time2 + 20))
        {
            timer = 0;
            snd_play(snd_laughtrack_short_temp);
            con++;
        }
    }
    if (con == 15 && !_blocked)
    {
        timer++;
        if (timer == 8)
            scr_pathfind_to_point("susie", 4, 6, 0);
        var starttime = 60;
        if (timer == starttime)
        {
            visit++;
            tenna.bounce = 1;
            var tetalk = stringsetloc("Are you crying for a buying!?", "obj_b1store_slash_Step_0_gml_237_0");
            scr_couchtalk(tetalk, "tenna", 2, 100);
        }
        if (timer == (starttime + 100 + 11))
        {
            tenna.bounce = 1;
            var tetalk = stringsetloc("Then save up your points, folks!", "obj_b1store_slash_Step_0_gml_243_0");
            scr_couchtalk(tetalk, "tenna", 2, 120);
        }
        if (timer == (starttime + 222 + 120))
        {
            ra_real.sprite_index = ra_real.lsprite;
            var ratalk = stringsetloc("POINTs can be exchanged for goods and services.", "obj_b1store_slash_Step_0_gml_254_0");
            scr_couchtalk(ratalk, "ralsei", 2, 145);
        }
        if (timer == (starttime + 222 + 120 + 145 + 11))
        {
            ra_real.sprite_index = ra_real.usprite;
            con++;
        }
    }
    if (con == 20)
    {
        timer++;
        if (timer == 8)
            scr_pathfind_to_point("susie", 4, 6, 0);
    }
}
else
{
    timer = 0;
    texttimer = 0;
    activeinit = 0;
    con = 0;
    susiewalkcon = 0;
    susietimer = 0;
    pocketcheck = 0;
    if (i_ex(shopwriter))
    {
        writerinit = 0;
        safe_delete(shopwriter);
        susie.freeroam = false;
    }
    if (made == 1)
    {
        if (!i_ex(heal))
            heal = instance_create(x + board_tilex(3), y + board_tiley(1.5), obj_board_tvdinner);
    }
    if (i_ex(key))
    {
        if (susieshoplift > 0)
        {
            if (i_ex(key))
            {
                with (key)
                    setxy_board(1760, 208);
            }
        }
    }
}
