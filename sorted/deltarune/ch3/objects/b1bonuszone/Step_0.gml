scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
    if (obj_board_camera.con == 0)
    {
        if (suwalk == 0)
        {
            ralsei.follow = true;
            if (con == 0)
            {
                scr_pathfind_to_point("susie", irandom_range(3, 8), 5, 0);
                suwalk = 1;
            }
            else
            {
                suwalktimer++;
                if (suwalktimer == 1)
                    ralsei.follow = true;
                if (suwalktimer == 8)
                {
                    scr_pathfind_to_point("susie", irandom_range(4, 6), 1, 0);
                    suwalk = 1;
                    susie.sleepy = true;
                }
            }
        }
    }
    if (con == 0)
    {
        if (tennaintro == 0)
        {
            timer++;
            if (timer == 1)
            {
                tenna.bounce = 1;
                var tetalk = stringsetloc("As a reward, a BONUS ZONE!!!", "obj_b1bonuszone_slash_Step_0_gml_41_0");
                scr_couchtalk(tetalk, "tenna", 2, 100);
            }
            if (timer == 81)
            {
                var sutalk = stringsetloc("Hell yeah!", "obj_b1bonuszone_slash_Step_0_gml_46_0");
                scr_couchtalk(sutalk, "susie", 2, 70);
                tennaintro = 1;
            }
        }
        if (i_ex(obj_board_pointsGetDisplay))
        {
            con = 1;
            timer = 0;
        }
    }
}
else
{
    suwalk = 0;
}
if (con == 1)
{
    if (global.interact == 0)
    {
        timer++;
        if (timer == 1)
        {
            scr_pathfind_end("susie");
            scr_play_recording("susie", "0W0W0W");
        }
        if (timer == 5)
        {
            global.flag[1024] = 1;
            su_real.sprite_index = spr_susie_exasperated;
            scr_shakeobj(su_real);
            snd_play(snd_wing);
            var sutalk = stringsetloc("What? Only 1 point!?", "obj_b1bonuszone_slash_Step_0_gml_82_0");
            scr_couchtalk(sutalk, "susie", 2, 90);
        }
        if (timer == 95)
        {
            global.flag[1024] = 0;
            su_real.sprite_index = spr_susie_walk_right_dw_unhappy;
            scr_resetgameshowcharacter_delay("susie", 90);
            tenna.bounce = 1;
            var tetalk = stringsetloc("Hey hey!! We've got a budget!", "obj_b1bonuszone_slash_Step_0_gml_91_0");
            scr_couchtalk(tetalk, "tenna", 2, 90);
        }
        if (timer == 185)
        {
            susie.sleepy = true;
            scr_pathfind_to_point("susie", irandom_range(3, 8), 6, 0);
        }
    }
    else
    {
        global.flag[1024] = 0;
        con = 99;
        timer = 0;
    }
}
