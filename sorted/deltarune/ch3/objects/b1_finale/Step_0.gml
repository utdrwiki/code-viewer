scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
    if (blocker == 0)
    {
        with (instance_create(x, y, obj_board_solid))
        {
            setxy_board(4512, 576);
            image_xscale = 2;
        }
        blocker = 1;
    }
    if (con == 0 && obj_board_camera.con == 0)
    {
        con++;
        timer = 0;
    }
    if (con == 1)
    {
        timer++;
        if (timer == 1)
        {
            tenna.bounce = 1;
            var tetalk = stringsetloc("Behold... The door to... The physical challenge!!!", "obj_b1_finale_slash_Step_0_gml_36_0");
            scr_couchtalk(tetalk, "tenna", 2, 90);
        }
        if (timer == 5)
            scr_pathfind_to_point("susie", 4, 2, 1);
        if (timer == 15)
            scr_pathfind_to_point("ralsei", 7, 2, 3);
        if (timer == 90)
        {
            var sutalk = stringsetloc("So that's where that goes.", "obj_b1_finale_slash_Step_0_gml_50_0");
            scr_couchtalk(sutalk, "susie", 2, 90);
            timer = 0;
            con = 2;
        }
    }
    if (con == 10)
    {
        with (obj_mainchara_board)
            controlled = 0;
        scr_pathfind_end("susie");
        scr_pathfind_end("ralsei");
        ralsei.follow = 0;
        scr_pathfind_to_point("susie", 5, 2, 2);
        scr_pathfind_to_point("ralsei", 6, 2, 2);
        scr_pathfind_to_point("kris", 5.5, 1, 2);
        con++;
    }
    if (con == 11 && scr_board_checklocation("kris", 5.5, 1, 2) && scr_board_checklocation("ralsei", 6, 2, 2) && scr_board_checklocation("susie", 5, 2, 2))
        con = 12;
    if (con == 12)
    {
        global.msc = 20000;
        scr_text(global.msc);
        scr_speaker("no_name");
        global.choicemsg[0] = stringsetloc("YES", "obj_b1_finale_slash_Step_0_gml_81_0");
        global.choicemsg[1] = stringsetloc("LET ME#THINK", "obj_b1_finale_slash_Step_0_gml_82_0");
        global.choicemsg[2] = stringset("");
        global.choicemsg[3] = stringset("");
        msgsetloc(0, "BEYOND THIS DOOR LIES THE PHYSICAL CHALLENGE./", "obj_b1_finale_slash_Step_0_gml_85_0");
        msgnextloc("A GRUELING ENCOUNTER THAT WILL TEST ALL OF YOUR SKILLS./", "obj_b1_finale_slash_Step_0_gml_86_0");
        msgnextloc("ARE YOU PREPARED..^1. FOR THE WORST?/", "obj_b1_finale_slash_Step_0_gml_87_0");
        msgnextloc(" \\C2", "obj_b1_finale_slash_Step_0_gml_88_0");
        var b = bw_make();
        b.side = 1;
        con++;
    }
    if (con == 13 && !i_ex(obj_choicer_neo) && !i_ex(obj_board_writer))
    {
        timer = 0;
        if (global.choice == 0)
            con = 20;
        if (global.choice == 1)
            con = 30;
    }
    if (con == 20)
    {
        timer++;
        if (timer == 1)
        {
            su_real.sprite_index = spr_susie_right_dw;
            kr_real.sprite_index = spr_krisr_dark;
            ra_real.sprite_index = spr_ralsei_right;
            var sutalk = stringsetloc("Yeah, okay I guess.", "obj_b1_finale_slash_Step_0_gml_120_0");
            scr_couchtalk(sutalk, "susie", 2, 60);
        }
        checkskip(1, 60);
        if (timer == 60)
        {
            ra_real.sprite_index = spr_ralsei_walk_right_unhappy;
            tenna.bounce = 1;
            var tetalk = stringsetloc("And so, our contestants' have spoken...", "obj_b1_finale_slash_Step_0_gml_128_0");
            scr_couchtalk(tetalk, "tenna", 2, 90);
        }
        checkskip(60, 150);
        if (timer == 150)
        {
            su_real.sprite_index = spr_susie_walk_right_dw_unhappy;
            ra_real.sprite_index = spr_ralsei_shocked_right;
            ra_real.x += 14;
            ra_real.y -= 8;
            scr_shakeobj(ra_real);
            snd_play(snd_wing);
            tenna.bounce = 1;
            var tetalk = stringsetloc("What may be their final words!!", "obj_b1_finale_slash_Step_0_gml_141_0");
            scr_couchtalk(tetalk, "tenna", 2, 90);
        }
        checkskip(150, 240);
        if (timer == 240)
        {
            tenna.bounce = 1;
            var tetalk = stringsetloc("Kids, cover your parents' eyes!!!", "obj_b1_finale_slash_Step_0_gml_147_0");
            scr_couchtalk(tetalk, "tenna", 2, 90);
        }
        checkskip(240, 330);
        if (timer == 330)
        {
            tenna.bounce = 1;
            var tetalk = stringsetloc("Because after this... There's no turning back!!!", "obj_b1_finale_slash_Step_0_gml_153_0");
            scr_couchtalk(tetalk, "tenna", 2, 90);
        }
        checkskip(330, 431);
        if (timer == 431)
        {
            con = 60;
            timer = 0;
        }
    }
    if (con == 30)
    {
        timer++;
        checkskip(1, 10);
        if (timer == 10)
        {
            su_real.sprite_index = spr_susie_right_dw;
            kr_real.sprite_index = spr_krisr_dark;
            ra_real.sprite_index = spr_ralsei_right;
            var ratalk = stringsetloc("Umm, well, couldn't we just--", "obj_b1_finale_slash_Step_0_gml_171_0");
            scr_couchtalk(ratalk, "ralsei", 2, 80);
        }
        checkskip(10, 90);
        if (timer == 90)
        {
            tenna.bounce = 1;
            scr_shakeobj_ext(tenna, 2, 10);
            su_real.sprite_index = spr_susie_walk_right_dw_unhappy;
            ra_real.sprite_index = spr_ralsei_shocked_right;
            ra_real.x += 14;
            ra_real.y -= 8;
            scr_shakeobj(ra_real);
            snd_play(snd_wing);
            var tetalk = stringsetloc("You kidding?! We budgeted too much to not use this!!!", "obj_b1_finale_slash_Step_0_gml_186_0");
            scr_couchtalk(tetalk, "tenna", 1, 100);
        }
        checkskip(90, 190);
        if (timer == 190)
        {
            tenna.bounce = 1;
            var tetalk = stringsetloc("Mike, roll the tape!!!", "obj_b1_finale_slash_Step_0_gml_192_0");
            scr_couchtalk(tetalk, "tenna", 2, 90);
        }
        checkskip(190, 280);
        if (timer == 291)
        {
            con = 60;
            timer = 0;
        }
    }
    if (con == 60)
    {
        timer++;
        if (timer == 10)
        {
            snd_play(snd_impact);
            with (scr_marker(0, 0, spr_pxwhite))
            {
                depth = -999;
                image_blend = c_black;
                image_xscale = 640;
                image_yscale = 480;
            }
            with (obj_border_controller)
                hide_border();
        }
        checkskip(10, 120);
        if (timer == 120)
        {
            global.plot = 99;
            global.flag[6] = 0;
            global.flag[7] = 0;
            global.hp[1] = global.maxhp[1];
            global.hp[2] = global.maxhp[2];
            global.hp[3] = global.maxhp[3];
            room_goto(room_dw_chef);
        }
    }
}
else
{
}
