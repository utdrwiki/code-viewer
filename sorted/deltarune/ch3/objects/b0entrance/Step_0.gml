scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
    if (con == 0 && obj_board_camera.con == 0 && i_ex(ralsei) && i_ex(kris) && i_ex(susie))
    {
        timer++;
        if (timer == 1)
        {
            snd_free_all();
            global.interact = 0;
            with (ralsei)
            {
                setxy_board(272, 384);
                follow = 0;
            }
        }
        if (timer == 1)
        {
            con = 1;
            timer = 0;
        }
    }
    if (con == 1)
    {
        timer++;
        if (timer == 1)
        {
            global.interact = 0;
            tenna.bounce = 1;
            var tennacouchtalk = stringsetloc("Now begin! Our state of the art... adventure!!!", "obj_b0entrance_slash_Step_0_gml_40_0");
            scr_couchtalk(tennacouchtalk, "tenna", 2, 95);
        }
        if (timer == 80)
        {
            scr_play_recording("susie", "0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0L0L0L0L0L0L0L0L0L0L0W0W0W0W0W0W0W0W0W0W0W0W0L0L0L0L0L0L0L0L0L0L0L0L0W0W0W0W0W0W0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0W0W0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0W0W0W0W0W0W0W0W0W0W0D0D0W0W0W0W0W0W0W0W0W0W0W0W0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0W0W0W0W0W0W0W0W0W0W0W0W0W0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0D0D0D0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0R0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W");
            with (obj_mainchara_board)
            {
                if (name == "susie")
                    sleepy = true;
            }
        }
        if (timer == 95)
        {
            var sutalk = stringsetloc("Hey, I can#move. Cool.", "obj_b0entrance_slash_Step_0_gml_54_0");
            scr_couchtalk(sutalk, "susie", 2, 60);
        }
        if (timer == 125)
            scr_play_recording("ralsei", "0U0U0U0U0U0U0U0U0U0U0U");
        if (timer == 130)
        {
            var ratalk = stringsetloc("U-umm, wait!#How do I...", "obj_b0entrance_slash_Step_0_gml_65_0");
            scr_couchtalk(ratalk, "ralsei", 2, 60);
        }
        if (timer == 320)
        {
            with (su_real)
            {
                sprite_index = spr_susie_walk_right_dw_unhappy;
                scr_resetgameshowcharacter_delay("susie", 80);
            }
            var susiecouchtalk = stringsetloc("Looks like crap.", "obj_b0entrance_slash_Step_0_gml_58_0");
            scr_couchtalk(susiecouchtalk, "susie", 2, 80);
            scr_play_recording("susie", "0D0W0W");
        }
        if (timer == 350)
        {
            with (ra_real)
            {
                sprite_index = spr_ralsei_shocked_left;
                x -= 16;
                y -= 6;
                scr_shakeobj();
                scr_resetgameshowcharacter_delay("ralsei", 60);
            }
            var ralseicouchtalk = stringsetloc("SUSIE!", "obj_b0entrance_slash_Step_0_gml_71_0");
            scr_couchtalk(ralseicouchtalk, "ralsei", 2, 60);
        }
        if (timer == 380)
        {
            tenna.bounce = 1;
            var tennacouchtalk = stringsetloc("It's cutting edge!!!", "obj_b0entrance_slash_Step_0_gml_77_0");
            scr_couchtalk(tennacouchtalk, "tenna", 2, 80);
            con++;
        }
    }
    if (suwalk == 0)
    {
        suwalktimer++;
        if (suwalktimer == 1)
            ralsei.follow = true;
        if (suwalktimer == 30)
        {
            susie.sleepy = true;
            var xloc = choose(4, 5, 6, 7);
            var yloc = choose(1, 2, 3, 4, 5);
            scr_pathfind_to_point("susie", xloc, yloc, irandom(4));
        }
    }
}
else
{
    suwalktimer = 0;
    suwalk = 0;
    con = 99;
}
