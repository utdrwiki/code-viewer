scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
    if (obj_board_camera.con == 0 && suwalk == 0)
    {
        scr_pathfind_to_point("susie", choose(1, 2, 9, 10), 6, 0);
        suwalk = 6;
    }
    if (pippins.grabbed)
    {
        textcomplete = true;
        texttimer = 999;
        drawtext = false;
    }
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
    if (con == 0 && obj_board_camera.con == 0)
    {
        if (visitinit == 0)
        {
            visitinit = 1;
            shopstring = string1;
            if (!i_ex(bow))
                shopstring = string3;
            if (kris.stink == true || susie.stink == true)
                shopstring = string4;
        }
        if (shopstring == string1 && !i_ex(bow))
        {
            shopstring = string2;
            texttimer = 0;
        }
        if (bowtalk == 0)
        {
            if (global.flag[1022] == 0)
            {
                if (textcomplete)
                {
                    if (i_ex(bow))
                    {
                        if (bow.con == 2)
                        {
                            sutalktimer++;
                            if (sutalktimer == 30)
                            {
                                tenna.bounce = 1;
                                var tetalk = stringsetloc("Susie, wanna buy it?!", "obj_b2fashionshop1_slash_Step_0_gml_77_0");
                                scr_couchtalk(tetalk, "tenna", 2, 80);
                            }
                            if (sutalktimer == 110)
                            {
                                su_real.sprite_index = spr_susie_walk_right_dw_unhappy;
                                scr_shakeobj(su_real);
                                snd_play(snd_wing);
                                var sutalk = stringsetloc("What? No way in hell!", "obj_b2fashionshop1_slash_Step_0_gml_91_0");
                                scr_couchtalk(sutalk, "susie", 2, 80);
                            }
                            if (sutalktimer == 200)
                                scr_resetgameshowcharacter("susie");
                        }
                    }
                }
            }
            if ((i_ex(bow) && bow.con > 2) || !i_ex(bow))
            {
                with (obj_couchwriter)
                    instance_destroy();
                sutalktimer = 0;
                bowtalk = 1;
            }
        }
        if (bowtalk == 1)
        {
            sutalktimer++;
            if (sutalktimer == 80)
            {
                ra_real.sprite_index = spr_ralsei_smile_up;
                var ratalk = stringsetloc("Oh, Susie, doesn't Kris look nice?", "obj_b2fashionshop1_slash_Step_0_gml_114_0");
                scr_couchtalk(ratalk, "ralsei", 2, 90);
            }
            if (sutalktimer == 170)
            {
                su_real.sprite_index = su_real.rsprite;
                ra_real.sprite_index = spr_ralsei_walk_left_unhappy;
                var sutalk = stringsetloc("Maybe for a 2nd grader.", "obj_b2fashionshop1_slash_Step_0_gml_120_0");
                scr_couchtalk(sutalk, "susie", 2, 90);
            }
            if (sutalktimer == 270)
            {
                scr_resetgameshowcharacter("susie");
                scr_resetgameshowcharacter("ralsei");
                bowtalk = 2;
            }
        }
    }
}
else
{
    suwalk = 0;
    timer = 0;
    texttimer = 0;
    visitinit = 0;
    textcomplete = false;
}
