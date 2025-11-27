scr_board_populatevars();
scr_gameshow_populatevars();
var favflag = global.flag[1017];
if (active == 1)
{
    if (obj_board_inventory.ninfriendo == true)
        tetalker = 99;
    if (tetalker == 0 && obj_board_camera.con == 0)
    {
        tetimer++;
        if (tetimer == 15)
        {
            tetalker = 1;
            tetimer = 0;
        }
    }
    if (tetalker == 1)
    {
        tetimer++;
        if (tetimer == 1)
        {
            var ratalk = stringsetloc("Looks kind of like the desert board.", "obj_b2lovershallway_slash_Step_0_gml_26_0");
            scr_couchtalk(ratalk, "ralsei", 2, 60);
        }
        if (tetimer == 60)
        {
            tenna.bounce = 1;
            var tetalk = stringsetloc("What!? The trees are green! Green!!!", "obj_b2lovershallway_slash_Step_0_gml_32_0");
            scr_couchtalk(tetalk, "tenna", 2, 60);
            tetalker = 99;
        }
    }
    if (obj_board_camera.con == 0)
    {
        if (suwalk == 0)
        {
            if (obj_board_inventory.ninfriendo == true && obj_board_inventory.b2drawninfriendo == true)
            {
                ralsei.follow = false;
                scr_pathfind_to_point("ralsei", 5, 6, 2);
                scr_pathfind_to_point("susie", 6, 6, 2);
            }
            else
            {
                ralsei.follow = true;
                scr_pathfind_to_point("susie", choose(5, 6), irandom_range(2, 6), 0);
                susie.sleepy = true;
            }
            suwalk = 1;
        }
    }
    if (con == 0 && obj_board_camera.con == 0)
    {
        var triggered = false;
        if (global.interact == 0)
        {
            if (kris.canfreemove == true)
            {
                if (obj_board_inventory.ninfriendo == true)
                {
                    with (obj_board_trigger)
                    {
                        if (extflag == "b2lovershallway")
                        {
                            if (place_meeting(x, y, obj_mainchara_board))
                                triggered = true;
                        }
                    }
                }
            }
        }
        if (triggered)
        {
            with (obj_board_playercamera)
                instance_destroy();
            with (obj_board_grayregion)
                instance_destroy();
            with (obj_mainchara_board)
            {
                if (name == "kris")
                    canfreemove = 0;
            }
            con = 1;
            timer = 0;
        }
    }
    if (con == 1)
    {
        for (var i = 0; i < 2; i++)
        {
            block[i] = instance_create_board(5 + i, 7, obj_board_solid);
            scr_darksize(block[i]);
            block[i].sprite_index = spr_board_tennastatueblocker;
            with (block[i])
                scr_depth_board();
            block[i].visible = true;
            var puff = instance_create_board(5 + i, 7, obj_board_smokepuff);
            puff.image_blend = #CE6951;
            puff.depth = block[i].depth - 1;
        }
        with (obj_mainchara_board)
        {
            if (y > board_tiley(7))
                y = board_tiley(7);
        }
        snd_free_all();
        snd_play_x(snd_board_splash, 0.7, 0.7);
        snd_play_x(snd_board_bomb, 0.7, 1.2);
        unfavored = scr_dark_marker(camerax() - 128, 254, spr_lanino_eyesclosed_right_nowand);
        favored = scr_dark_marker(camerax() + 640 + 128, 264, spr_elnina_eyesclosed_left_nowand);
        if (global.flag[1017] == 1)
        {
            unfavored.sprite_index = spr_elnina_eyesclosed_right_nowand;
            unfavored.y = 264;
            favored.sprite_index = spr_lanino_eyesclosed_left_nowand;
            favored.y = 254;
        }
        tenna.bounce = true;
        scr_speaker("tenna");
        msgsetloc(0, "* Alright^1, this is it folks!/", "obj_b2lovershallway_slash_Step_0_gml_111_0");
        msgnextloc("* Come out^1, you two!/%", "obj_b2lovershallway_slash_Step_0_gml_112_0");
        d_make();
        con = 2;
    }
    if (con == 2 && !d_ex())
    {
        timer++;
        if (timer == 1)
        {
            obj_board_inventory.b2drawninfriendo = false;
            var idle = 1544;
            if (global.flag[1017] == 1)
                idle = 4193;
            var desigx = obj_board_inventory.x + 8;
            var desigy = obj_board_inventory.y + 174;
            boardunfavored = scr_board_marker(desigx, desigy, idle, 0, 0, 2);
            with (favored)
            {
                scr_lerpvar("x", x, 542, 30);
                scr_depth();
            }
            with (unfavored)
            {
                scr_lerpvar("x", x, 14, 30);
                scr_depth();
            }
            with (instance_create(x, y, obj_b2_ninfriendo_wiremanagement))
            {
                favored = other.favored;
                unfavored = other.unfavored;
                con = 1;
            }
        }
        var jumptime = 24;
        if (timer == 2)
        {
            var xloc = 5.5;
            snd_play(snd_board_throw);
            with (boardunfavored)
                scr_jump_to_point(board_tilex(xloc), board_tiley(4), 15, jumptime);
        }
        if (timer == (2 + jumptime + 1))
        {
            boardunfavored.sprite_index = spr_board_lanino_eyesclosed;
            with (boardunfavored)
            {
                if (global.flag[1017] == 0)
                {
                    image_xscale = -2;
                    x += 32;
                }
                if (global.flag[1017] == 1)
                    sprite_index = spr_board_elnina_eyesclosed;
            }
        }
        if (timer == 4)
            boardunfavored.autodepth = true;
        if (timer == 45)
        {
            tenna.bounce = true;
            scr_speaker("tenna");
            msgsetloc(0, "* Alright^1, open your eyes!/%", "obj_b2lovershallway_slash_Step_0_gml_165_0");
            d_make();
            timer = 0;
            con = 3;
        }
    }
    if (con == 3 && !d_ex())
    {
        timer++;
        if (timer == 1)
        {
            unfavored.sprite_index = spr_lanino_idle_right_nowand;
            favored.sprite_index = spr_elnina_idle_left_nowand;
            if (global.flag[1017] == 1)
            {
                unfavored.sprite_index = spr_elnina_idle_right_nowand;
                favored.sprite_index = spr_lanino_idle_left_nowand;
            }
        }
        if (timer == 15)
        {
            unfavored.sprite_index = spr_lanino_shocked_right_nowand;
            favored.sprite_index = spr_elnina_shocked_left_nowand;
            if (global.flag[1017] == 1)
            {
                unfavored.sprite_index = spr_elnina_shocked_right_nowand;
                favored.sprite_index = spr_lanino_shocked_left_nowand;
            }
            with (boardunfavored)
            {
                sprite_index = spr_board_lanino_sad;
                if (global.flag[1017] == 1)
                    sprite_index = spr_board_elnina_sad;
            }
            scr_shakeobj(favored);
            scr_shakeobj(unfavored);
            snd_play(snd_wing);
        }
        if (timer == 20)
        {
            debug_print(string(global.flag[1017]));
            var loc1 = [62, 238];
            var loc2 = [580, 228];
            if (global.flag[1017] == 0)
            {
                loc1 = [52, 228];
                loc2 = [578, 238];
            }
            exc1 = scr_dark_marker(loc1[0], loc1[1], spr_exc);
            exc2 = scr_dark_marker(loc2[0], loc2[1], spr_exc);
            with (exc1)
            {
                gravity = 1;
                vspeed = -4;
                scr_limitval_upper(id, "y", y);
                scr_doom(id, 30);
            }
            with (exc2)
            {
                gravity = 1;
                vspeed = -4;
                scr_limitval_upper(id, "y", y);
                scr_doom(id, 30);
            }
        }
        if (timer == 50)
        {
            tenna.bounce = true;
            scr_speaker("tenna");
            msgsetloc(0, "* Wow^1, looks like your game characters are just about to meet.../", "obj_b2lovershallway_slash_Step_0_gml_220_0");
            msgnextloc("* ..^1. At Lover's Peak!!!/%", "obj_b2lovershallway_slash_Step_0_gml_221_0");
            d_make();
            timer = 0;
            con = 3.1;
        }
    }
    if (con == 3.1)
    {
        scr_var_set_boxwait(1, "con", 3.2);
        con = -3.2;
    }
    if (con == 3.2)
    {
        tenna.bounce = true;
        mus_play_ext("tvromance.ogg", 1);
        snd_play_delay(snd_audience_aww, 30);
        con = 4;
        timer = 0;
    }
    if (con == 4 && !d_ex())
    {
        timer++;
        if (timer == 30)
        {
            scr_speaker("no_name");
            if (favname == "elnina")
            {
                msgsetloc(0, "* La..^1. Lanino..^1. I..^1. I'm sorry.../", "obj_b2lovershallway_slash_Step_0_gml_248_0");
                msgnextloc("* Elnina^1, I..^1. I'm sorry too^1, I.../", "obj_b2lovershallway_slash_Step_0_gml_249_0");
            }
            else
            {
                msgsetloc(0, "* El..^1. Elnina..^1. I..^1. I'm sorry.../", "obj_b2lovershallway_slash_Step_0_gml_253_0");
                msgnextloc("* Lanino^1, I..^1. I'm sorry too^1, I.../", "obj_b2lovershallway_slash_Step_0_gml_254_0");
            }
            if (favflag == 0)
            {
                msgnextloc("* It's okay^1, we still love each other^1, right!?/", "obj_b2lovershallway_slash_Step_0_gml_256_0");
                msgnextloc("* Of^1, of course^1! I'm just..^1. sorry I.../%", "obj_b2lovershallway_slash_Step_0_gml_257_0");
            }
            else
            {
                msgnextloc("* It's okay^1, we still love each other^1, right!?/", "obj_b2lovershallway_slash_Step_0_gml_278_0");
                msgnextloc("* Of^1, of course^1! I'm just..^1. sorry I.../%", "obj_b2lovershallway_slash_Step_0_gml_279_0");
            }
            d = d_make();
            con++;
            timer = 0;
        }
    }
    if (con == 5 && i_ex(d))
    {
        if (i_ex(d.writer))
        {
            if (txtseq == 0 && d.writer.msgno == 0)
            {
                txtseq = 1;
                unfavored.sprite_index = spr_lanino_sadconfused_right_nowand;
                if (global.flag[1017] == 1)
                    unfavored.sprite_index = spr_elnina_sadconfused_right_nowand;
            }
            if (txtseq == 1 && d.writer.msgno == 1)
            {
                txtseq = 2;
                favored.sprite_index = spr_elnina_sadconfused_left_nowand;
                if (global.flag[1017] == 1)
                    favored.sprite_index = spr_lanino_sadconfused_left_nowand;
            }
            if (txtseq == 2 && d.writer.msgno == 2)
            {
                txtseq = 3;
                unfavored.sprite_index = spr_lanino_smileembarassed_right_nowand;
                if (global.flag[1017] == 1)
                    unfavored.sprite_index = spr_elnina_smileembarassed_right_nowand;
            }
            if (txtseq == 3 && d.writer.msgno == 3)
            {
                txtseq = 0;
                favored.sprite_index = spr_elnina_smileembarassed_left_nowand;
                if (global.flag[1017] == 1)
                    favored.sprite_index = spr_lanino_smileembarassed_left_nowand;
            }
        }
    }
    if (con == 5 && !d_ex())
    {
        timer++;
        if (timer == 1)
        {
            scr_shakeobj(tenna, 20);
            tenna.communication = 1;
        }
        if (timer == 30)
        {
            scr_speaker("tenna");
            msgsetloc(0, "* Oops^1! Duty calls^1! Gotta go^1, kids!/", "obj_b2lovershallway_slash_Step_0_gml_321_0");
            msgnextloc("* (I'll give them a little alone time...)/%", "obj_b2lovershallway_slash_Step_0_gml_322_0");
            d_make();
            timer = 0;
            con++;
        }
    }
    if (con == 6 && !d_ex())
    {
        timer++;
        if (timer == 1)
        {
            with (tenna)
            {
                communication = 0;
                scr_lerpvar("x", x, camerax() + 784, 30, -1, "in");
                snd_play(snd_slidewhistle);
                global.flag[1022] = 1;
            }
        }
        if (timer == 45)
        {
            scr_shakeobj_ext(unfavored, 0, 6);
            unfavored.sprite_index = spr_lanino_idle_right_nowand;
            if (global.flag[1017] == 1)
                unfavored.sprite_index = spr_elnina_idle_right_nowand;
            snd_play_x(snd_noise, 0.65, 1.2);
            snd_play_x(snd_wing, 0.65, 1.1);
        }
        if (timer == 55)
        {
            unfavored.sprite_index = spr_lanino_gloat_right_nowand;
            boardunfavored.sprite_index = spr_board_lanino_gloat;
            if (global.flag[1017] == 1)
            {
                boardunfavored.sprite_index = spr_board_elnina_gloat;
                unfavored.sprite_index = spr_elnina_gloat_right_nowand;
            }
            unfavored.image_speed = 0.25;
            boardunfavored.image_speed = 0.25;
            scr_speaker("no_name");
            if (favflag == 0)
                msgsetloc(0, "* I can't wait^1! I'm going to the next room!/%", "obj_b2lovershallway_slash_Step_0_gml_363_0");
            else
                msgsetloc(0, "* I can't wait^1! I'm going to the next room!/%", "obj_b2lovershallway_slash_Step_0_gml_391_0");
            d_make();
            timer = 0;
            con++;
        }
    }
    if (con == 7 && !d_ex())
    {
        timer++;
        if (timer == 5)
        {
            boardunfavored.vspeed = -4;
            scr_doom(boardunfavored, 60);
        }
        if (timer == 30)
        {
            favored.sprite_index = spr_elnina_shocked_left_nowand;
            if (global.flag[1017] == 1)
                favored.sprite_index = spr_lanino_shocked_left_nowand;
            scr_speaker("no_name");
            if (global.flag[1017] == 1)
                msgsetloc(0, "* Oh^1, Elnina^1, I--/%", "obj_b2lovershallway_slash_Step_0_gml_385_0");
            else
                msgsetloc(0, "* Oh^1, Lanino^1, I--/%", "obj_b2lovershallway_slash_Step_0_gml_389_0");
            d_make();
            con++;
            timer = 0;
        }
    }
    if (con == 8 && !d_ex())
    {
        with (obj_mainchara_board)
            canfreemove = true;
        kris.facing = 2;
        scr_pathfind_to_point("susie", 6, 1, 0);
        scr_board_caterpillar_interpolate_ralsei();
        ralsei.follow = true;
        obj_b2loverscliff.favored = favored;
        obj_b2loverscliff.unfavored = unfavored;
        obj_b2loverscliff.ready = true;
        con = 9;
    }
}
else
{
    if (tetalker == 1)
        tetalker = 99;
    tetimer = 0;
    suwalk = 0;
}
