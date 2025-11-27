var favflag = global.flag[1017];
scr_board_populatevars();
scr_gameshow_populatevars();
if (init == 0)
    init = 1;
if (rouxls_board == 0 && ready)
{
    rouxls_board = scr_board_marker(-999, -999, spr_board_rouxls, 0, 999990, 2, false);
    with (rouxls_board)
        setxy_board(1824, 2496);
    angryfriendo = scr_board_marker(-999, -999, spr_board_lanino_sad_right);
    if (global.flag[1017] == 1)
        angryfriendo.sprite_index = spr_board_elnina_sad_right;
    with (angryfriendo)
        setxy_board(1760, 2496);
}
if (active)
{
    if (ready && tempblock == 0)
    {
        tempblock = 1;
        with (instance_create(1824, 2624, obj_board_solid))
        {
            setxy_board();
            scr_size(2, 1);
            scr_doom(id, 90);
        }
    }
    if (con == 0 && obj_board_camera.con == 0)
    {
        if (kris.boat == true)
            suwalk = 1;
        if (ready)
        {
            suwalk = 1;
            for (var i = 0; i < array_length(obj_b2lovershallway.block); i++)
                safe_delete(obj_b2lovershallway.block[i]);
            with (obj_mainchara_board)
                controlled = false;
            scr_pathfind_to_point("kris", 5.5, 5.5, 2);
            scr_pathfind_to_point("ralsei", 4.5, 6, 2);
            scr_pathfind_to_point("susie", 6.5, 6, 2);
            snd_stop_all();
            snd_play_delay(snd_crowd_gasp, 4);
            safe_delete(obj_b2pyramidrouxlsstore);
            con = 1;
            timer = 0;
            rouxls = scr_dark_marker(camerax() + 640, 264, spr_rouxls_handsbehindback);
            obj_b2_ninfriendo_wiremanagement.rouxls = rouxls;
            rouxls.depth = 96200;
            favored.sprite_index = spr_elnina_shame_left_nowand;
            if (global.flag[1017] == 1)
                favored.sprite_index = spr_lanino_sadconfused_left_nowand;
            unfavored.sprite_index = spr_lanino_shocked_right_nowand;
            if (global.flag[1017] == 1)
                unfavored.sprite_index = spr_elnina_shocked_right_nowand;
            with (obj_board_overlookfriendo)
            {
                other.favoredfriend = scr_board_marker(x, y, sprite_index, image_speed, depth, image_xscale, false);
                instance_destroy();
            }
        }
        else
        {
            if (loverline == 0)
            {
                if (obj_board_overlookfriendo.spoke == 1)
                {
                    obj_board_overlookfriendo.spoke = 2;
                    loverline = 1;
                    lovertimer = 0;
                }
            }
            if (loverline == 1)
            {
                lovertimer++;
                if (lovertimer == 1)
                {
                    tenna.bounce = 1;
                    var tetalk = stringsetloc("You know what that means, kids!!!", "obj_b2loverscliff_slash_Step_0_gml_87_0");
                    scr_couchtalk(tetalk, "tenna", 2, 60);
                }
                if (lovertimer == 60)
                {
                    su_real.sprite_index = su_real.rsprite;
                    scr_resetgameshowcharacter_delay("susie", 80);
                    var sutalk = stringsetloc("Ralsei, get on the heart. We're gonna find you a lover.", "obj_b2loverscliff_slash_Step_0_gml_94_0");
                    if (obj_board_inventory.lancer == true)
                    {
                        sutalk = stringsetloc("Yeah. If we could get 2 Lancers, and make them stand there...", "obj_b2loverscliff_slash_Step_0_gml_96_0");
                    }
                    else
                    {
                        loverline = 10;
                        lovestand = 1;
                        lovertimer = 0;
                    }
                    scr_couchtalk(sutalk, "susie", 2, 80);
                }
                if (lovertimer == 140)
                {
                    tenna.bounce = 1;
                    var tetalk = stringsetloc("Nevermind, folks!", "obj_b2loverscliff_slash_Step_0_gml_107_0");
                    scr_couchtalk(tetalk, "tenna", 2, 80);
                    snd_play_delay(snd_laughtrack_short_temp, 15);
                    loverline = 10;
                    lovertimer = 0;
                }
            }
            if (loverline == 11 && obj_board_camera.con == 0)
            {
                lovertimer++;
                if (lovertimer == 15)
                {
                    tenna.bounce = 1;
                    var tetalk = stringsetloc("Still only one lover!", "obj_b2loverscliff_slash_Step_0_gml_121_0");
                    scr_couchtalk(tetalk, "tenna", 2, 60);
                }
                if (lovertimer == 75)
                {
                    ra_real.sprite_index = ra_real.rsprite;
                    scr_resetgameshowcharacter_delay("ralsei", 60);
                    var ratalk = stringsetloc("Is one... \"lover\"... still a \"lover?\"", "obj_b2loverscliff_slash_Step_0_gml_128_0");
                    scr_couchtalk(ratalk, "ralsei", 2, 60);
                }
            }
        }
    }
    if (loverline == 11)
    {
        if (lovertimer > 1 && obj_board_camera.con != 0)
            loverline = 12;
    }
    if (con == 1)
    {
        timer++;
        if (timer == 61)
        {
            with (rouxls)
                scr_lerpvar("x", x, 480, 30);
        }
        if (timer == 66)
        {
            if (global.flag[1017] == 1)
            {
                with (favored)
                    scr_lerpvar("x", x, 442, 25);
            }
        }
        if (timer == 105)
        {
            snd_play(snd_noise);
            rouxls.depth = 97020;
            rouxls.sprite_index = spr_rouxls_righthandup;
            if (global.flag[1017] == 1)
                rouxls.sprite_index = spr_rouxls_lefthandup;
        }
        if (timer == 110)
        {
            hands = instance_create(0, 0, obj_rouxls_facehands);
            hands.depth = 0;
            scr_speaker("rouxls");
            msgsetloc(0, "* So you must be..^1. the ex./%", "obj_b2loverscliff_slash_Step_0_gml_178_0");
            d_make();
            timer = 0;
            con++;
        }
    }
    if (con == 2 && !d_ex())
    {
        scr_speaker("no_name");
        if (favflag == 0)
        {
            msgsetloc(0, "* WHO THE HELL IS THAT!?/", "obj_b2loverscliff_slash_Step_0_gml_196_0");
            msgnextloc("* I..^1. I'm sorry^1, I thought we were..^1. you didn't..^1. so I.../%", "obj_b2loverscliff_slash_Step_0_gml_197_0");
        }
        else
        {
            msgsetloc(0, "* WHO THE HELL IS THAT!?/", "obj_b2loverscliff_slash_Step_0_gml_212_0");
            msgnextloc("* I..^1. I'm sorry^1, I thought we were..^1. you didn't..^1. so I.../%", "obj_b2loverscliff_slash_Step_0_gml_213_0");
        }
        d = d_make();
        con++;
        timer = 0;
    }
    if (con == 3 && i_ex(d))
    {
        if (i_ex(d.writer))
        {
            if (txtcon == 0 && d.writer.msgno == 0)
            {
                scr_shakeobj(unfavored);
                snd_play(snd_wing);
                unfavored.sprite_index = spr_lanino_angrypose_right_nowand;
                if (global.flag[1017] == 1)
                    unfavored.sprite_index = spr_elnina_angrypose_right_nowand;
                if (global.flag[1017] == 0)
                {
                    obj_b2_ninfriendo_wiremanagement.xoff[0] = 70;
                    obj_b2_ninfriendo_wiremanagement.yoff[0] = 70;
                }
                else
                {
                    obj_b2_ninfriendo_wiremanagement.xoff[0] = 76;
                    obj_b2_ninfriendo_wiremanagement.yoff[0] = 56;
                }
                txtcon = 1;
            }
            if (txtcon == 1 && d.writer.msgno == 1)
            {
                scr_shakeobj_ext(favored, 0, 6);
                txtcon = 0;
            }
        }
    }
    if (con == 3 && !d_ex())
    {
        timer++;
        if (timer == 20)
        {
            con = 4;
            scr_speaker("rouxls");
            msgsetloc(0, "\\E4* Let me sayeth...", "obj_b2loverscliff_slash_Step_0_gml_229_0");
            hands.con = 1;
            rouxls.depth = 95710;
            rouxls.sprite_index = spr_rouxls_handposes;
            rouxls.image_index = 0;
            d = d_make();
            d.stay = 6;
        }
    }
    if (con == 4)
    {
        var trig = 0;
        if (i_ex(obj_writer))
        {
            if (obj_writer.reachedend == true)
            {
                con = 5;
                snd_play(snd_crowd_ooh);
                timer = 0;
            }
        }
    }
    if (con == 5)
    {
        timer++;
        if (timer == 70)
        {
            k_d();
            scr_speaker("rouxls");
            msgsetloc(0, "\\E1* Let me SAYETH^1,/", "obj_b2loverscliff_slash_Step_0_gml_259_0");
            msgnextloc("\\E4* I know. I can readeth^1, the room./", "obj_b2loverscliff_slash_Step_0_gml_260_0");
            msgnextloc("\\E4* Please. Come hither./%", "obj_b2loverscliff_slash_Step_0_gml_261_0");
            d = d_make();
            con = 6;
            timer = 0;
        }
    }
    if (con == 6 && i_ex(d))
    {
        if (i_ex(d.writer))
        {
            if (txtcon == 0 && d.writer.msgno == 0)
            {
                hands.con = 3;
                scr_shakeobj(rouxls);
                rouxls.image_index = 1;
                txtcon = 1;
            }
            if (txtcon == 1 && d.writer.msgno == 1)
            {
                hands.con = 10;
                rouxls.sprite_index = spr_rouxls_handstogether;
                txtcon = 2;
            }
            if (txtcon == 2 && d.writer.msgno == 2)
            {
                unfavored.sprite_index = spr_lanino_angry_right_nowand;
                if (global.flag[1017] == 1)
                    unfavored.sprite_index = spr_elnina_angry_right_nowand;
                if (global.flag[1017] == 0)
                {
                    obj_b2_ninfriendo_wiremanagement.xoff[0] = 62;
                    obj_b2_ninfriendo_wiremanagement.yoff[0] = 44;
                }
                else
                {
                    obj_b2_ninfriendo_wiremanagement.xoff[0] = 74;
                    obj_b2_ninfriendo_wiremanagement.yoff[0] = 44;
                }
                hands.con = 15;
                rouxls.sprite_index = spr_rouxls_armposes;
                txtcon = 0;
            }
        }
    }
    if (con == 6 && !d_ex())
    {
        timer++;
        if (timer == 30)
        {
            with (unfavored)
                scr_lerpvar("x", x, x + 120, 20);
        }
        if (timer == 80)
        {
            with (unfavored)
            {
                if (global.flag[1017] == 0)
                    scr_lerpvar("x", x, 442, 40);
                else
                    scr_lerpvar("x", x, 542, 40);
            }
        }
        if (timer == 120)
        {
            timer = 0;
            con = 6.5;
        }
    }
    if (con == 6.5)
    {
        timer++;
        if (timer == 1)
        {
            unfavored.sprite_index = spr_lanino_angry_right_nowand;
            favored.sprite_index = spr_elnina_sadconfused_left_nowand;
            if (global.flag[1017] == 1)
            {
                unfavored.sprite_index = spr_elnina_angry_left_nowand;
                favored.sprite_index = spr_lanino_sadconfused_right_nowand;
                with (obj_b2_ninfriendo_wiremanagement)
                {
                    xoff[0] = 76;
                    yoff[0] = 60;
                    xoff[1] = 62;
                    yoff[1] = 44;
                }
            }
        }
        if (timer == 30)
        {
            con = 7;
            timer = 0;
        }
    }
    if (con == 7)
    {
        scr_speaker("rouxls");
        msgsetloc(0, "\\E4* I don't thinkest thoust two..^1. shouldst be Aparte./", "obj_b2loverscliff_slash_Step_0_gml_345_0");
        msgnextloc("\\E4* Instead^1, thou shouldst be..^1. Togethere./%", "obj_b2loverscliff_slash_Step_0_gml_346_0");
        d = d_make();
        con = 8;
    }
    if (con == 8 && i_ex(d))
    {
        if (i_ex(d.writer))
        {
            if (txtcon == 0 && d.writer.msgno == 0)
            {
                if (global.flag[1017] == 0)
                {
                    favored.sprite_index = spr_elnina_shocked_left_nowand;
                    unfavored.sprite_index = spr_lanino_shocked_right_nowand;
                }
                if (global.flag[1017] == 1)
                {
                    favored.sprite_index = spr_lanino_shocked_right_nowand;
                    unfavored.sprite_index = spr_elnina_shocked_left_nowand;
                }
                hands.con = 20;
                txtcon = 1;
            }
            if (txtcon == 1 && d.writer.msgno == 1)
            {
                hands.con = 25;
                favored.sprite_index = spr_elnina_smileembarassed_left_nowand;
                unfavored.sprite_index = spr_lanino_smileembarassed_right_nowand;
                if (global.flag[1017] == 1)
                {
                    favored.sprite_index = spr_lanino_smileembarassed_right_nowand;
                    unfavored.sprite_index = spr_elnina_smileembarassed_left_nowand;
                }
                rouxls.sprite_index = spr_rouxls_handstogether;
                txtcon = 0;
            }
        }
    }
    if (con == 8 && !d_ex())
    {
        timer++;
        if (timer == 30)
        {
            scr_speaker("rouxls");
            msgsetloc(0, "\\E4* ..^1. with Me./", "obj_b2loverscliff_slash_Step_0_gml_396_0");
            msgnextloc("\\E4* Because Three..^1. art stronger..^1. than One./%", "obj_b2loverscliff_slash_Step_0_gml_397_0");
            d = d_make();
            timer = 0;
            con = 9;
        }
    }
    if (con == 9 && i_ex(d))
    {
        if (i_ex(d.writer))
        {
            if (txtcon == 0 && d.writer.msgno == 0)
            {
                rouxls.sprite_index = spr_rurus_idle;
                hands.con = 30;
                favored.sprite_index = spr_elnina_shocked_left_nowand;
                unfavored.sprite_index = spr_lanino_shocked_right_nowand;
                if (global.flag[1017] == 1)
                {
                    favored.sprite_index = spr_lanino_shocked_right_nowand;
                    unfavored.sprite_index = spr_elnina_shocked_left_nowand;
                }
                snd_play(snd_noise);
                rouxls.depth = 97020;
                txtcon = 1;
            }
            if (txtcon == 1 && d.writer.msgno == 1)
            {
                rouxls.depth = 95710;
                hands.con = 35;
                rouxls.sprite_index = spr_rouxls_handposes;
                rouxls.image_index = 3;
                txtcon = 3;
            }
        }
    }
    if (con == 9 && !d_ex())
    {
        con++;
        timer = 0;
    }
    if (con == 10)
    {
        timer++;
        if (timer == 10)
        {
            favored.sprite_index = spr_elnina_sadconfused_left_nowand;
            unfavored.sprite_index = spr_lanino_sadconfused_right_nowand;
            if (global.flag[1017] == 1)
            {
                favored.sprite_index = spr_lanino_sadconfused_right_nowand;
                unfavored.sprite_index = spr_elnina_sadconfused_left_nowand;
            }
            global.flag[6] = 1;
            scr_speaker("no_name");
            if (favflag == 0)
                msgsetloc(0, "* But there's two of/%", "obj_b2loverscliff_slash_Step_0_gml_524_0");
            else
                msgsetloc(0, "* But there's two of/%", "obj_b2loverscliff_slash_Step_0_gml_465_0");
            d = d_make();
            d.skippable = false;
        }
        if (timer > 30)
        {
            con = 10.25;
            timer = 0;
        }
    }
    if (con == 10.25)
    {
        var proceed = false;
        timer++;
        if (timer > 5 && !d_ex())
            proceed = true;
        if (instance_exists(obj_dialoguer))
        {
            if (instance_exists(obj_writer))
            {
                if (obj_writer.halt != 0)
                    proceed = true;
            }
        }
        if (proceed == true)
        {
            timer = 0;
            con = 10.5;
        }
    }
    if (con == 10.5)
    {
        timer++;
        if (timer == 10)
        {
            safe_delete(obj_dialoguer);
            safe_delete(obj_writer);
            timer = 0;
            con = 11;
        }
    }
    if (con == 11)
    {
        global.flag[6] = 0;
        scr_speaker("rouxls");
        msgsetloc(0, "\\E1* Because^1, sure^1, Three art stronger than Two./", "obj_b2loverscliff_slash_Step_0_gml_498_0");
        msgnextloc("\\E6* And many other numbers^1, et cetera^1, et cetera./", "obj_b2loverscliff_slash_Step_0_gml_499_0");
        msgnextloc("\\E1* Everyone in agreemenst?/", "obj_b2loverscliff_slash_Step_0_gml_500_0");
        scr_anyface_next("no_name", 0);
        if (favflag == 0)
        {
            msgnextloc("* ..^1. y..^1. you'll be with me again^1, if I...?/", "obj_b2loverscliff_slash_Step_0_gml_568_0");
            msgnextloc("* You'll..^1. be with me again if I?/", "obj_b2loverscliff_slash_Step_0_gml_569_0");
        }
        else
        {
            msgnextloc("* ..^1. y..^1. you'll be with me again^1, if I...?/", "obj_b2loverscliff_slash_Step_0_gml_502_0");
            msgnextloc("* You'll..^1. be with me again if I?/", "obj_b2loverscliff_slash_Step_0_gml_503_0");
        }
        scr_anyface_next("rouxls", 0);
        msgnextloc("\\E1* Yea^1, yea^1, Okaye^1, we get it^1, We Good^1, let's go./", "obj_b2loverscliff_slash_Step_0_gml_505_0");
        msgnextloc("\\E4* Cue Rainbowe./%", "obj_b2loverscliff_slash_Step_0_gml_506_0");
        d = d_make();
        txtcon = 0;
        timer = 0;
        con++;
    }
    if (con == 12 && i_ex(d))
    {
        if (i_ex(d.writer))
        {
            if (txtcon == 0 && d.writer.msgno == 0)
            {
                hands.con = 40;
                snd_play(snd_wing);
                scr_shakeobj(rouxls);
                rouxls.image_index = 4;
                favored.sprite_index = spr_elnina_shocked_left_nowand;
                unfavored.sprite_index = spr_lanino_shocked_right_nowand;
                if (global.flag[1017] == 1)
                {
                    favored.sprite_index = spr_lanino_shocked_right_nowand;
                    unfavored.sprite_index = spr_elnina_shocked_left_nowand;
                }
                txtcon++;
            }
            if (txtcon == 1 && d.writer.msgno == 1)
            {
                hands.con = 45;
                rouxls.sprite_index = spr_rurus_idle;
                txtcon++;
            }
            if (txtcon == 2 && d.writer.msgno == 2)
            {
                hands.con = 50;
                rouxls.sprite_index = spr_rouxls_handstogether;
                txtcon = 4;
            }
            if (txtcon == 4 && d.writer.msgno == 4)
            {
                hands.con = 55;
                rouxls.depth = 97020;
                favored.sprite_index = spr_elnina_idle_left_alt;
                if (global.flag[1017] == 0)
                {
                    obj_b2_ninfriendo_wiremanagement.xoff[1] = 58;
                    obj_b2_ninfriendo_wiremanagement.yoff[1] = 80;
                }
                if (global.flag[1017] == 1)
                {
                    favored.sprite_index = spr_lanino_idle_right_alt;
                    with (favored)
                        scr_lerpvar("x", x, x + 14, 2);
                    obj_b2_ninfriendo_wiremanagement.xoff[1] = 42;
                    obj_b2_ninfriendo_wiremanagement.yoff[1] = 62;
                }
                else
                {
                    with (favored)
                        scr_lerpvar("x", x, x - 20, 5);
                }
                txtcon++;
            }
            if (txtcon == 5 && d.writer.msgno == 5)
            {
                unfavored.sprite_index = spr_lanino_idle_right_alt;
                with (unfavored)
                    scr_lerpvar("x", x, x + 14, 2);
                if (global.flag[1017] == 0)
                {
                    obj_b2_ninfriendo_wiremanagement.xoff[0] = 42;
                    obj_b2_ninfriendo_wiremanagement.yoff[0] = 62;
                }
                if (global.flag[1017] == 1)
                {
                    unfavored.sprite_index = spr_elnina_idle_left_alt;
                    with (unfavored)
                        scr_lerpvar("x", x, x - 20, 5);
                    obj_b2_ninfriendo_wiremanagement.xoff[0] = 58;
                    obj_b2_ninfriendo_wiremanagement.yoff[0] = 80;
                }
                else
                {
                    unfavored.x += 4;
                }
                with (angryfriendo)
                    scr_lerpvar("x", x, x + 32, 8);
                txtcon++;
            }
            if (txtcon == 6 && d.writer.msgno == 7)
            {
                hands.con = 60;
                favored.visible = false;
                unfavored.visible = false;
                rouxls.sprite_index = spr_rouxls_hugfriends;
                rouxls.image_index = 0;
                rouxls.depth = 99800;
                with (obj_b2_ninfriendo_wiremanagement)
                {
                    stick[0] = false;
                    stick[1] = false;
                }
                with (rouxls)
                {
                    for (var i = 0; i < 7; i++)
                    {
                        scr_delay_var("image_index", i, 3 * i);
                        if (i == 2)
                        {
                            snd_play_delay(snd_wing, 3 * i);
                            with (obj_b2_ninfriendo_wiremanagement)
                                scr_delay_var("drop0", 1, 3 * i);
                        }
                        if (i == 5)
                        {
                            snd_play_delay(snd_wing, 3 * i, 1, 1.2);
                            with (obj_b2_ninfriendo_wiremanagement)
                                scr_delay_var("drop1", 1, 3 * i);
                        }
                    }
                }
                txtcon++;
            }
            if (txtcon == 7 && d.writer.msgno == 8)
            {
                hands.con = 70;
                txtcon++;
            }
        }
    }
    if (con == 12 && !d_ex())
    {
        if (angryfriendo.x == 256)
        {
            timer = 0;
            con++;
        }
    }
    if (con == 13)
    {
        timer++;
        if (timer == 1)
        {
            with (obj_b2_badbridge)
                con = 1;
            snd_play_pitch(snd_board_splat, 0.8);
        }
        var jumptime = 10;
        if (timer == 15)
        {
            var angrymod = 0;
            if (angryfriendo.image_xscale == -2)
                angrymod = 32;
            var angrytargx = (rouxls_board.x - 26) + angrymod;
            var angrytargy = rouxls_board.y - 30;
            var favoredx = rouxls_board.x + 26;
            var favoredy = rouxls_board.y - 30;
            with (angryfriendo)
                scr_jump_to_point(angrytargx, angrytargy, 12, jumptime);
            with (favoredfriend)
                scr_jump_to_point(favoredx, favoredy, 12, jumptime);
        }
        if (timer == (15 + jumptime))
        {
            locktorouxls = true;
            with (rouxls_board)
                scr_depth_board();
        }
        if (timer == (15 + jumptime + 30))
        {
            with (rouxls_board)
                scr_lerpvar("x", x, x + 16, 4);
        }
        if (timer == (15 + jumptime + 38))
        {
            rouxls.hspeed = 4;
            favored.hspeed = 4;
            unfavored.hspeed = 4;
            with (unfavored)
                scr_delay_var("hspeed", 0, 60);
            rouxls_board.vspeed = -4;
            rouxls_board.friction = -0.01;
        }
        if (timer == (15 + jumptime + 42))
        {
            hands.con = 80;
            scr_speaker("rouxls");
            msgsetloc(0, "\\E3* (Thoust Worms aren't the only Battle Throuple in town Nowe...)/%", "obj_b2loverscliff_slash_Step_0_gml_697_0");
            d_make();
            con++;
            timer = 0;
        }
    }
    if (con == 14 && !d_ex())
    {
        con = 15;
        global.interact = 0;
        with (obj_mainchara_board)
        {
            if (name == "kris")
                controlled = 1;
            canfreemove = true;
        }
        var sutalk = stringsetloc("...What did he say? What?", "obj_b2loverscliff_slash_Step_0_gml_712_0");
        scr_couchtalk(sutalk, "susie", 2, 60);
        scr_delay_var("cleanup", true, 40);
    }
    if (suwalk == 0 && obj_board_camera.con == 0)
    {
        suwalktimer++;
        if (suwalktimer == 15)
        {
            suwalk = 1;
            scr_pathfind_to_point("susie", 10, choose(5, 6), 1);
            susie.sleepy = true;
        }
    }
}
else
{
    suwalktimer = 0;
    suwalk = 0;
    if (loverline > 0 && loverline != 1 && loverline != 10 && loverline != 11)
    {
        loverline = 999;
        lovertimer = 0;
    }
    if (loverline == 10 || loverline == 1)
    {
        lovertimer = 0;
        loverline = 11;
    }
}
if (cleanup == true)
{
    locktorouxls = false;
    safe_delete(favoredfriend);
    safe_delete(rouxls_board);
    safe_delete(angryfriendo);
    cleanup = false;
}
if (active)
{
    if (ready)
        lovestand = -1;
    if (lovestand == 1)
    {
        var lovestandtrig = 0;
        with (obj_board_trigger)
        {
            if (extflag == "b2lovestand")
                lovestandtrig = id;
        }
        with (lovestandtrig)
        {
            if (!place_meeting(x, y, obj_mainchara_board))
                other.lovestand = 2;
        }
    }
    if (lovestand == 2)
    {
        var lovestandtrig = 0;
        with (obj_board_trigger)
        {
            if (extflag == "b2lovestand")
                lovestandtrig = id;
        }
        var krmet = 0;
        var ramet = 0;
        with (kris)
        {
            if (place_meeting(x, y, lovestandtrig))
                krmet = 1;
        }
        if (krmet)
            lvkrtime++;
        else
            lvkrtime = 0;
        with (ralsei)
        {
            if (place_meeting(x, y, lovestandtrig))
                ramet = 1;
        }
        if (ramet)
            lvratime++;
        else
            lvratime = 0;
        if (lvratime >= 90 || lvkrtime >= 120)
        {
            lvtimer = 0;
            if (ramet && krmet)
                lovestand = 3;
            else if (ramet && !krmet)
                lovestand = 4;
            else if (!ramet && krmet)
                lovestand = 5;
        }
    }
}
else
{
    lvtime = 0;
}
if (lovestand == 3)
{
    lvtimer++;
    if (lvtimer == 1)
    {
        var sutalk = stringsetloc("Done. Just gotta move the other guy.", "obj_b2loverscliff_slash_Step_0_gml_893_0");
        scr_couchtalk(sutalk, "susie", 2, 90);
    }
    if (lvtimer == 61)
    {
        tenna.bounce = 1;
        var tetalk = stringsetloc("YOU CAN'T USE KRIS AND RALSEI!!", "obj_b2loverscliff_slash_Step_0_gml_899_0");
        scr_couchtalk(tetalk, "tenna", 2, 80);
        lovestand = 99;
    }
}
if (lovestand == 4)
{
    lvtimer++;
    if (lvtimer == 1)
    {
        var sutalk = stringsetloc("Got two people.", "obj_b2loverscliff_slash_Step_0_gml_909_0");
        scr_couchtalk(sutalk, "susie", 2, 80);
    }
    if (lvtimer == 51)
    {
        tenna.bounce = 1;
        var tetalk = stringsetloc("RALSEI DOESN'T COUNT!!!", "obj_b2loverscliff_slash_Step_0_gml_915_0");
        scr_couchtalk(tetalk, "tenna", 2, 80);
        lovestand = 99;
    }
}
if (lovestand == 5)
{
    lvtimer++;
    if (lvtimer == 1)
    {
        var sutalk = stringsetloc("Okay, got two people.", "obj_b2loverscliff_slash_Step_0_gml_925_0");
        scr_couchtalk(sutalk, "susie", 2, 80);
    }
    if (lvtimer == 51)
    {
        tenna.bounce = 1;
        var tetalk = stringsetloc("KRIS DOESN'T COUNT!!!", "obj_b2loverscliff_slash_Step_0_gml_931_0");
        scr_couchtalk(tetalk, "tenna", 2, 80);
        lovestand = 99;
    }
}
