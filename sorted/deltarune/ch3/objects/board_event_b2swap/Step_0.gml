scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
    if (con == 0 && obj_board_camera.con == 0)
    {
        with (kris)
        {
            if (place_meeting(x, y, obj_board_trigger))
            {
                var trig = instance_place(x, y, obj_board_trigger);
                if (trig.extflag == "b2swap")
                {
                    global.interact = 1;
                    other.con = 1;
                }
            }
        }
    }
    if (con == 1)
    {
        timer++;
        if (timer == 1)
        {
            tenna.bounce = true;
            var tetalk = stringsetloc("What!? My beeper!? Zapper got stuck again!? Darnit!", "obj_board_event_b2swap_slash_Step_0_gml_35_0");
            scr_couchtalk(tetalk, "tenna", 2, 90);
            global.flag[1024] = 1;
        }
        if (timer == 90)
        {
            tenna.bounce = true;
            var tetalk = stringsetloc("I have to go. Don't have too much fun without me!", "obj_board_event_b2swap_slash_Step_0_gml_46_0");
            bubbletrack = scr_couchtalk(tetalk, "tenna", 2, 90);
        }
        if (timer == 160)
        {
            with (tenna)
                scr_lerpvar("x", x, x + 300, 30, -1, "in");
            with (bubbletrack)
                scr_lerpvar("x", x, x + 300, 30, -1, "in");
            snd_play_delay(snd_slidewhistle, 4);
        }
        if (timer == 220)
        {
            timer = 0;
            con = 2;
        }
    }
    if (con == 2)
    {
        timer++;
        if (timer == 1)
        {
            su_real.sprite_index = su_real.usprite;
            var sutalk = stringsetloc("...", "obj_board_event_b2swap_slash_Step_0_gml_67_0");
            scr_couchtalk(sutalk, "susie", 2, 60);
        }
        if (timer == 30)
            ra_real.sprite_index = ra_real.lsprite;
        if (timer == 55)
            kr_real.sprite_index = kr_real.lsprite;
        if (timer == 60)
        {
            var ratalk = stringsetloc("So, um, should be easy for you, right?", "obj_board_event_b2swap_slash_Step_0_gml_80_0");
            scr_couchtalk(ratalk, "ralsei", 2, 80);
        }
        if (timer == 120)
        {
            scr_shakeobj(su_real, 4);
            su_real.sprite_index = spr_susieb_attackready_unarmed;
            snd_play(snd_whip_crack_only);
            var sutalk = stringsetloc("Look over there!", "obj_board_event_b2swap_slash_Step_0_gml_88_0");
            scr_couchtalk(sutalk, "susie", 2, 45);
        }
        if (timer == 160)
        {
            var ratalk = stringsetloc("Huh?", "obj_board_event_b2swap_slash_Step_0_gml_93_0");
            scr_couchtalk(ratalk, "ralsei", 2, 50);
            ra_real.sprite_index = ra_real.rsprite;
        }
        if (timer == 175)
        {
            with (su_real)
                sprite_index = usprite;
            con++;
            timer = 0;
        }
    }
    if (con == 3)
    {
        su_real.depth = kr_real.depth + 1;
        timer++;
        if (timer == 1)
        {
            kr_real.sprite_index = kr_real.usprite;
            with (su_real)
            {
                image_speed = 0.25;
                scr_move_to_point_over_time(274, 288, 8);
            }
        }
        if (timer == 14)
            su_real.sprite_index = spr_susieu_dark_benddown;
        if (timer == 20)
        {
            scr_shakeobj(su_real, 8);
            snd_play(snd_wing);
        }
        if (timer == 26)
        {
            scr_shakeobj(su_real, 8);
            snd_play(snd_equip);
        }
        if (timer == 32)
        {
            with (su_real)
            {
                sprite_index = usprite;
                image_index = 0;
                image_speed = 0;
                snd_play(snd_wing);
            }
        }
        if (timer == 38)
        {
            var ratalk = stringsetloc(" ? ", "obj_board_event_b2swap_slash_Step_0_gml_135_0");
            scr_couchtalk(ratalk, "ralsei", 2, 30, -1, -1, 14);
            scr_resetgameshowcharacter_delay("ralsei", 30);
            with (su_real)
            {
                image_speed = 0.25;
                sprite_index = dsprite;
                scr_move_to_point_over_time(140, 392, 8);
            }
        }
        if (timer == 47)
        {
            with (su_real)
            {
                image_speed = 0;
                sprite_index = usprite;
                scr_shakeobj(id, 4);
            }
            con = 4;
            timer = 0;
        }
    }
    if (con == 4)
    {
        timer++;
        if (timer == 1)
        {
            var sutalk = stringsetloc("Alright, this puzzle should be easy.", "obj_board_event_b2swap_slash_Step_0_gml_165_0");
            scr_couchtalk(sutalk, "susie", 2, 60);
        }
    }
}
else
{
}
