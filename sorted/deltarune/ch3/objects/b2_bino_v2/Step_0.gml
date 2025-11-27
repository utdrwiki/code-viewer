var view = stringsetloc("VIEW", "obj_b2_bino_v2_slash_Step_0_gml_5_0");
var donot = stringsetloc("DO#NOT", "obj_b2_bino_v2_slash_Step_0_gml_6_0");
scr_board_populatevars();
scr_gameshow_populatevars();
if (active)
{
    if (con == 0)
    {
        if (buffer > 0)
            buffer--;
        scr_depth_board();
    }
    if (con == 1)
    {
        timer = 0;
        if (kris.boat == true)
        {
            if (sunk == 0)
                con = 72;
            else
                con = 50;
        }
        else
        {
            con = 2;
        }
        buffer = 3;
    }
    if (con == 2)
    {
        global.interact = 1;
        global.msc = -99;
        global.choice = -1;
        global.choicemsg[0] = view;
        global.choicemsg[1] = donot;
        global.choicemsg[2] = stringset("");
        global.choicemsg[3] = stringset("");
        scr_speaker("no_name");
        var viewprompt = stringsetloc("BINOCULARS. 10 POINTS TO TAKE A VIEW OF ATLANTIS STADIUM!", "obj_b2_bino_v2_slash_Step_0_gml_45_0");
        if (wondertalk == 1)
            viewprompt += "/";
        msgset(0, viewprompt);
        msgnext("\\C2 ");
        with (bw_make())
            stay = 10;
        if (wondertalk == 0)
            con = 2.1;
        else
            con = 3;
    }
    if (con == 2.1)
    {
        wondertalk = 1;
        if (instance_exists(obj_writer))
        {
            if (scr_msgno_end(0))
            {
                con = 2.2;
                timer = 0;
            }
        }
        else
        {
            wondertalkfailsafe++;
            if (wondertalkfailsafe >= 15)
            {
                con = 2.2;
                timer = 0;
            }
        }
    }
    if (con == 2.2)
    {
        timer++;
        var starttime = 15;
        if (timer < starttime)
        {
            if ((timer > 5 && button1_p()) || button3_h())
                timer = starttime;
        }
        if (timer == starttime)
        {
            var ratalk = stringsetloc("It must be beautiful...", "obj_b2_bino_v2_slash_Step_0_gml_82_0");
            scr_couchtalk(ratalk, "ralsei", 2, 80);
        }
        var endcon = 0;
        if (timer > (starttime + 5) && (button3_h() || button1_p()))
            endcon = 1;
        if (timer >= (starttime + 80 + 11) || endcon == 1)
        {
            safe_delete(obj_couchwriter);
            con = 2.3;
            timer = 0;
        }
    }
    if (con == 2.3)
    {
        if (tennahere())
        {
            timer++;
            if (timer == 1)
            {
                var tetalk = stringsetloc("Trust me, it's a sight to behold!!!", "obj_b2_bino_v2_slash_Step_0_gml_106_0");
                tenna.bounce = true;
                scr_couchtalk(tetalk, "tenna", 2, 80);
            }
            var endcon = 0;
            if (timer > 5 && (button3_h() || button1_p() || !instance_exists(obj_couchwriter)))
                endcon = 1;
            if (timer >= 92 || endcon == 1)
            {
                safe_delete(obj_couchwriter);
                timer = 0;
                con = 2.4;
            }
        }
        else
        {
            timer = 0;
            con = 2.4;
        }
    }
    if (con == 2.4)
    {
        with (obj_writer)
            instance_destroy();
        msgset(0, "\\C2 ");
        with (bw_make())
        {
            skip = true;
            stay = 1;
        }
        con = 3;
    }
    if (con == 3 && global.choice != -1)
    {
        if (global.choice == 0)
        {
            if (global.flag[1044] >= 10)
            {
                scorer = scr_board_score(-10);
                con = 4;
            }
            else
            {
                snd_play(snd_error);
                msgsetloc(0, "YOU DON'T EVEN HAVE 10 POINTS!/%", "obj_b2_bino_v2_slash_Step_0_gml_150_0");
                with (bw_make())
                    skip = true;
                con = 99;
            }
        }
        else
        {
            con = 99;
        }
    }
    if (con == 4 && !i_ex(obj_board_scoreAdder))
    {
        timer = 0;
        snd_play_pitch(snd_item, 1.2);
        binoimage = instance_create_depth(x, y, 100000, obj_b2_binoimage);
        con = 5;
    }
    if (con == 5)
    {
        timer++;
        susie.sleepy = false;
        var starttime = 30;
        if ((timer < starttime && button3_h()) || (timer > 5 && timer < starttime && button1_p()))
            timer = starttime;
        if (timer == starttime)
        {
            var sutalk = stringsetloc("ANOTHER pyramid!?", "obj_b2_bino_v2_slash_Step_0_gml_182_0");
            scr_couchtalk(sutalk, "susie", 2, 90);
        }
        var endcon = 0;
        if (timer > (starttime + 5) && (button3_h() || button1_p()))
            endcon = 1;
        if (timer >= (starttime + 90 + 11) || endcon == 1)
        {
            safe_delete(obj_couchwriter);
            con = 5.1;
            timer = 0;
        }
    }
    if (con == 5.1)
    {
        timer++;
        var starttime = 1;
        var bublength = 110;
        if (timer == starttime && tennahere())
        {
            var tetalk = stringsetloc("What? What? We have a budget to keep in mind you know!!!", "obj_b2_bino_v2_slash_Step_0_gml_207_0");
            tenna.bounce = true;
            scr_couchtalk(tetalk, "tenna", 2, bublength);
        }
        var endcon = 0;
        if (timer > (starttime + 5) && (button3_h() || button1_p()))
            endcon = 1;
        if (!tennahere())
            endcon = 1;
        if (timer >= (starttime + bublength + 11) || endcon == 1)
        {
            safe_delete(obj_couchwriter);
            con = 5.2;
            timer = 0;
        }
    }
    if (con == 5.2)
    {
        timer++;
        var endcon = 0;
        if (timer > 3 && (button1_p() || button2_p()))
            endcon = 1;
        if (timer > 5 && button3_h())
            endcon = 1;
        if (endcon == 1)
        {
            timer = 0;
            safe_delete(binoimage);
            snd_play_pitch(snd_equip, 1.4);
            con = 6;
            global.interact = 0;
            kris.cantleave = true;
            with (obj_board_boat)
                disembark = -48;
        }
    }
    if (con == 6)
    {
        timer++;
        if (timer == 1)
        {
        }
        if (timer == 5)
            scr_pathfind_to_point("susie", x, y + 32, 2);
        if (timer == 15)
        {
            var sutalk = stringsetloc("What a rip-off.", "obj_b2_bino_v2_slash_Step_0_gml_263_0");
            scr_couchtalk(sutalk, "susie", 2, 91);
            con = 7;
            timer = 0;
        }
    }
    if (con == 7 && scr_board_checklocation("susie", x, y + 32, 4))
        con = 7.1;
    if (con == 7.1)
    {
        timer++;
        if (timer == 5)
        {
            snd_play(snd_board_lift);
            susie.fun = 1;
            susie.sprite_index = susie.usprite_carry;
            y = susie.y + 8;
            image_yscale = -2;
            depth = susie.depth - 1;
            updatedepth = false;
            if (!tennahere())
            {
                timer = 0;
                con = 8;
            }
        }
        if (timer == 20)
        {
            tenna.bounce = 1;
            var tetalk = stringsetloc("H-HEY!!", "obj_b2_bino_v2_slash_Step_0_gml_302_0");
            scr_couchtalk(tetalk, "tenna", 2, 91);
            con = 8;
            timer = 0;
        }
    }
    if (con == 8)
    {
        timer++;
        if (timer == 5)
            susie.sprite_index = susie.lsprite_carry;
        var throwtime = 16;
        if (timer == 10)
        {
            snd_play(snd_board_throw);
            scr_jump_to_point_board(board_tilex(4), susie.y + 32, 12, throwtime, 1);
            snd_play_delay(snd_board_splash, throwtime);
        }
        if (timer == 11)
        {
            susie.facing = 3;
            susie.fun = 0;
        }
        if (timer == (11 + throwtime))
        {
            sunk = 1;
            updatedepth = true;
            kris.cantleave = false;
            with (obj_board_boat)
                disembark = 0;
            con = 0;
            timer = 0;
        }
    }
    if (con == 50)
    {
        global.interact = 1;
        global.msc = -99;
        global.choice = -1;
        global.choicemsg[0] = view;
        global.choicemsg[1] = donot;
        global.choicemsg[2] = stringset("");
        global.choicemsg[3] = stringset("");
        scr_speaker("no_name");
        msgsetloc(0, "BINOCULARS. LOOK INSIDE?/", "obj_b2_bino_v2_slash_Step_0_gml_355_0");
        msgnext(" \\C2");
        bw_make();
        con = 51;
    }
    if (con == 51 && global.choice != -1)
    {
        if (global.choice == 0)
        {
            binoimage = instance_create_depth(x, y, 100000, obj_b2_binoimage);
            binoimage.ver = 1;
            con = 52;
            timer = 0;
        }
        if (global.choice == 1)
        {
            with (obj_board_writer)
                instance_destroy();
            con = 99;
        }
    }
    if (con == 52)
    {
        if (sunktalk == 0)
        {
            timer++;
            if (timer == 30)
            {
                var sutalk = stringsetloc("...dunno what I expected.", "obj_b2_bino_v2_slash_Step_0_gml_384_0");
                scr_couchtalk(sutalk, "susie", 2, 80);
                con = 59;
                timer = 0;
                sunktalk = 1;
            }
        }
        else
        {
            con = 59;
            timer = 0;
        }
    }
    if (con == 59)
    {
        timer++;
        if (timer > 3)
        {
            if (button1_p() || button2_p() || button3_h())
            {
                safe_delete(binoimage);
                timer = 0;
                con = 99;
            }
        }
    }
    if (con == 72)
    {
        scr_speaker("no_name");
        msgsetloc(0, "BINOCULARS. THEY CANNOT BE VIEWED FROM THIS SIDE./%", "obj_b2_bino_v2_slash_Step_0_gml_414_0");
        bw_make();
        con = 73;
    }
    if (con == 73 && !bw_ex())
    {
        timer++;
        with (obj_board_boat)
        {
            if (engaged)
            {
                canfreemove = false;
                updateplayerdepth = false;
            }
        }
        susie.depth -= 500;
        kris.depth = susie.depth + 10;
        if (timer == 1)
        {
            var sutalk = stringsetloc("How about THIS side?", "obj_b2_bino_v2_slash_Step_0_gml_437_0");
            scr_couchtalk(sutalk, "susie", 2, 80);
            susie.fun = true;
        }
        if (timer == 10)
        {
            snd_play(snd_board_lift);
            susie.fun = 1;
            if (susie.facing == 0)
                susie.sprite_index = susie.dsprite_carry;
            else
                susie.sprite_index = susie.rsprite_carry;
            y = susie.y + 8;
            x = susie.x;
            image_yscale = -2;
            depth = susie.depth - 1;
            updatedepth = false;
            if (tennahere())
            {
                var tetalk = stringsetloc("HEY!!", "obj_b2_bino_v2_slash_Step_0_gml_457_0");
                scr_couchtalk(tetalk, "tenna", 2, 60);
            }
        }
        if (timer == 25)
            susie.sprite_index = susie.lsprite_carry;
        var throwtime = 16;
        if (timer == 30)
        {
            snd_play(snd_board_throw);
            var yloc = round((susie.y + 32) / 32) * 32;
            scr_jump_to_point_board(board_tilex(4), yloc, 12, throwtime, 1);
            snd_play_delay(snd_board_splash, throwtime);
            susie.sprite_index = susie.lsprite;
        }
        if (timer == (30 + throwtime))
        {
            susie.fun = 0;
            sunk = 1;
            updatedepth = true;
            with (obj_board_boat)
            {
                if (engaged)
                {
                    canfreemove = true;
                    updateplayerdepth = true;
                }
            }
            con = 99;
        }
    }
    if (con == 99 && !bw_ex())
    {
        with (obj_board_writer_stay)
            instance_destroy();
        global.interact = 0;
        con = 0;
        buffer = 3;
        timer = 0;
    }
}
else
{
    con = 0;
    timer = 0;
}
