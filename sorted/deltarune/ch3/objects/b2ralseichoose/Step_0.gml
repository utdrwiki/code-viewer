scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
    if (con == 0 && obj_board_camera.con == 0)
    {
        if (global.flag[1190] == 0)
        {
            timer = 0;
            kris.controlled = 0;
            susie.controlled = 1;
            ralsei.follow = 0;
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
        if (timer == 1)
        {
            global.flag[1024] = 0;
            scr_resetgameshowcharacter("all");
        }
        if (timer == 15)
            scr_pathfind_to_point("ralsei", 5, 2, 0);
        if (timer == 30)
            scr_pathfind_to_point("kris", 5.5, 5.5, 2);
        if (timer == 80)
            scr_pathfind_to_point("kris", 5.5, 3.5, 2);
        if (scr_board_checklocation("kris", 5.5, 3.5, 2))
        {
            if (timer > 80 && timer < 150)
            {
                if ((timer % 20) == 0)
                {
                    if (kris.facing == 1)
                        kris.facing = 2;
                    else
                        kris.facing = 1;
                }
            }
        }
        if (timer == 150)
        {
            kris.facing = 0;
            ra_real.sprite_index = ra_real.lsprite;
            var ratalk = stringsetloc("So... um...", "obj_b2ralseichoose_slash_Step_0_gml_56_0");
            scr_couchtalk(ratalk, "ralsei", 2, 60);
        }
        if (timer == 215)
        {
            ra_real.y -= 4;
            ra_real.sprite_index = spr_ralsei_walk_left_blush;
            var ratalk = stringsetloc("K-Kris, which way should I...", "obj_b2ralseichoose_slash_Step_0_gml_63_0");
            scr_couchtalk(ratalk, "ralsei", 2, 90);
        }
        checkskip(215, 295);
        if (timer == 295)
        {
            scr_shakeobj(su_real);
            snd_play(snd_wing);
            scr_resetgameshowcharacter("ralsei");
            su_real.sprite_index = spr_susie_walk_right_dw_unhappy;
            ra_real.sprite_index = spr_ralsei_shocked_left;
            ra_real.x -= 16;
            ra_real.y -= 6;
            var sutalk = stringsetloc("You got the controller, YOU choose.", "obj_b2ralseichoose_slash_Step_0_gml_76_0");
            scr_couchtalk(sutalk, "susie", 1, 100);
        }
        checkskip(295, 395);
        if (timer == 335)
        {
            scr_resetgameshowcharacter("ralsei");
            ra_real.y -= 4;
            ra_real.sprite_index = spr_ralsei_walk_left_blush;
        }
        checkskip(295, 395);
        if (timer == 395)
        {
            scr_resetgameshowcharacter("ralsei");
            scr_resetgameshowcharacter("susie");
            var ratalk = stringsetloc("This way... seems nice.", "obj_b2ralseichoose_slash_Step_0_gml_91_0");
            scr_couchtalk(ratalk, "ralsei", 2, 100);
            scr_pathfind_to_point("kris", 11, 4, 1);
            con = 2;
            timer = 0;
        }
    }
    if (con == 2)
    {
        if (scr_board_checklocation("kris", 11, 4, 2))
            timer++;
        if (timer == 4)
        {
            timer = 0;
            con = 3;
            with (obj_mainchara_board)
                controlled = 0;
            kris.controlled = 1;
            global.interact = 1;
            obj_board_camera.shift = "right";
        }
    }
    if (con == 10 && obj_board_camera.con == 0)
    {
        kris.controlled = 0;
        susie.controlled = 1;
        ralsei.follow = 0;
        timer = 0;
        con = 10.1;
    }
    if (con == 10.1)
    {
        ralsei.follow = 0;
        scr_pathfind_to_point("kris", 5.5, 3, 0);
        scr_pathfind_to_point("ralsei", 7, 4, 3);
        con = 11;
    }
    if (con == 11)
    {
        if (scr_board_checklocation("kris", 5.5, 3, 4))
            timer++;
        if (timer == 4)
            con++;
    }
    if (con == 12)
    {
        timer++;
        if (timer == 5)
        {
            scr_play_recording("kris", "0D0D0D0D0D0D0D0D0R0R0R0R0R0U0U0U0U0U0U0U0U0L0L0L0L0L0D0D0D0D0D0D0D0D0R0R0R0R0R0U0U0U0U0U0U0U0U0L0L0L0L0L0D0D0D0D0D0D0D0D0R0R0R0R0R0U0U0U0U0U0U0U0U0L0L0L0L0L0D0D0D0D0D0D0D0D0R0R0R0R0R0U0U0U0U0U0U0U0U0L0L0L0L0L0D0D0D0D0D0D0D0D0R0R0R0R0R0U0U0U0U0U0U0U0U0L0L0L0L0L0D0D0D0D0D0D0D0D0R0R0R0R0R0U0U0U0U0U0U0U0U0L0L0L0L0L0D0D0D0D0D0D0D0D0R0R0R0R0R0U0U0U0U0U0U0U0U0L0L0L0L0L0D0D0D0D0D0D0D0D0R0R0R0R0R0U0U0U0U0U0U0U0U0L0L0L0L0L0D0D0D0D0D0D0D0D0R0R0R0R0R0U0U0U0U0U0U0U0U0L0L0L0L0L0D0D0D0D0D0D0D0D0R0R0R0R0R0U0U0U0U0U0U0U0U0L0L0L0L0L0D0D0D0D0D0D0D0D0R0R0R0R0R0U0U0U0U0U0U0U0U0L0L0L0L0L0D0D0D0D0D0D0D0D0R0R0R0R0R0U0U0U0U0U0U0U0U0L0L0L0L0L0D0D0D0D0D0D0D0D0R0R0R0R0R0U0U0U0U0U0U0U0U0L0L0L0L0L");
            var ratalk = stringsetloc("It's fun... just moving around. Haha.", "obj_b2ralseichoose_slash_Step_0_gml_148_0");
            scr_couchtalk(ratalk, "ralsei", 2, 90);
        }
        if (timer == 125)
        {
            kris.susierecordcon = 0;
            su_real.sprite_index = spr_susie_walk_right_dw;
            var sutalk = stringsetloc("Y'know you can do that whenever, right.", "obj_b2ralseichoose_slash_Step_0_gml_154_0");
            scr_couchtalk(sutalk, "susie", 2, 90);
        }
        if (timer == 185)
        {
            scr_play_recording("kris", "0L0L0L0L0L0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U");
            scr_resetgameshowcharacter("susie");
            var ratalk = stringsetloc("I... I guess so.", "obj_b2ralseichoose_slash_Step_0_gml_161_0");
            scr_couchtalk(ratalk, "ralsei", 2, 90);
            timer = 0;
            con = 13;
        }
    }
    if (con == 13)
    {
        if (kris.y <= 65)
            timer++;
        if (timer == 2)
        {
            kris.x = scr_even(kris.x);
            kris.y = 64;
            timer = 0;
            con++;
            global.interact = 1;
            with (obj_mainchara_board)
                controlled = 0;
            kris.controlled = 1;
            obj_board_camera.shift = "up";
        }
    }
    if (con == 20)
    {
        if (suwalk == 0 && obj_board_camera.con == 0)
        {
            suwalktimer++;
            if (suwalktimer == 1)
                ralsei.follow = true;
            if (suwalktimer == 16)
            {
                susie.sleepy = true;
                scr_pathfind_to_point("susie", choose(8, 9, 10), choose(3, 4), 0);
                suwalktimer = 0;
                suwalk = 1;
            }
        }
    }
}
else
{
    if (con == 14)
    {
        timer = 0;
        con = 20;
    }
    suwalk = 0;
    suwalktimer = 0;
}
