scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
    if (con == 0 && obj_board_camera.con == 0)
    {
    }
    if (con == 1)
    {
        msgsetloc(0, "WELCOME TO OUR ENTERTAINMENT DISTRICT!/", "obj_b3entertainmentdistrict_slash_Step_0_gml_65_0");
        bw_make();
        con = 1.1;
    }
    if (con == 1.1)
    {
        with (obj_board_writer)
        {
            if (halt)
                other.con = 1.2;
        }
    }
    if (con == 1.2)
    {
        timer++;
        if (timer == 1)
            safe_delete(obj_couchwriter);
        if (timer == 5)
        {
            snd_play(snd_suslaugh);
            su_real.sprite_index = spr_susier_dark_laugh;
            su_real.image_speed = 0.16;
            with (su_real)
                scr_delay_var("image_speed", 0, 42);
        }
        if (timer == 51)
        {
            var sutalk = stringsetloc("HAHAHA!!! Fun? There's nothing here!", "obj_b3entertainmentdistrict_slash_Step_0_gml_38_0");
            scr_couchtalk(sutalk, "susie", 2, 60);
        }
        if (timer == 115)
        {
            su_real.sprite_index = spr_susie_right_dw;
            ra_real.sprite_index = spr_ralsei_head_down_sad_right;
            ra_real.y -= 6;
            kr_real.sprite_index = spr_krisr_dark;
            tenna.bounce = 1;
            var tetalk = stringsetloc("It's, it's... Tenna, tell 'em!", "obj_b3entertainmentdistrict_slash_Step_0_gml_48_0");
            scr_couchtalk(tetalk, "tenna", 2, 80);
        }
        if (timer == 195)
        {
            safe_delete(obj_board_writer);
            safe_delete(obj_writer);
            with (obj_board_npc)
            {
                if (extflag == "b3entertainment")
                    image_speed = 0;
            }
            scr_resetgameshowcharacter("kris");
            scr_resetgameshowcharacter("susie");
            scr_resetgameshowcharacter("ralsei");
            scr_speaker("noone");
            msgsetloc(0, "^1.../", "obj_b3entertainmentdistrict_slash_Step_0_gml_66_0");
            msgnextloc("OKAY MAN EVEN I HAVE TROUBLE DEFENDING THIS ONE.", "obj_b3entertainmentdistrict_slash_Step_0_gml_67_0");
            bw_make();
            timer = 0;
            con = 2;
        }
    }
    if (con == 2 && i_ex(obj_writer))
    {
        if (obj_writer.reachedend && obj_writer.msgno > 0)
        {
            con = 3;
            timer = 0;
        }
    }
    if (con == 3)
    {
        timer++;
        if (timer == 30)
        {
            tenna.bounce = 1;
            var tetalk = stringsetloc("You can't say that! You're me!", "obj_b3entertainmentdistrict_slash_Step_0_gml_88_0");
            scr_couchtalk(tetalk, "tenna", 2, 70);
        }
        if (timer == 100)
        {
            tenna.bounce = 1;
            var tetalk = stringsetloc("Get out of here!", "obj_b3entertainmentdistrict_slash_Step_0_gml_94_0");
            scr_couchtalk(tetalk, "tenna", 2, 70);
        }
        if (timer == 130)
        {
            with (obj_board_npc)
            {
                if (extflag == "b3entertainment")
                {
                    instance_create(x, y, obj_board_smokepuff);
                    snd_play(snd_board_splash);
                    instance_destroy();
                }
            }
            global.interact = 0;
            safe_delete(obj_board_writer);
            safe_delete(obj_writer);
            con = 4;
            timer = 0;
        }
    }
    if (suwalk == 0)
    {
        suwalktimer++;
        if (suwalktimer == 1)
            ralsei.follow = true;
        if (suwalktimer == 15)
        {
            scr_pathfind_to_point("susie", 6, 4, 0);
            suwalk = 1;
        }
    }
}
else
{
    suwalk = 0;
    suwalktimer = 0;
}
