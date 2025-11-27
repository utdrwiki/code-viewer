if (init == 0)
{
    lilkris.nocamtransition = true;
    lilkris.ignoredepth = true;
    lilkris.facing = 2;
    init = 1;
    if (prefire == 1)
    {
        prefire = 0;
        with (obj_treasure_room)
            global.flag[itemflag] = 1;
        scr_armorget(23);
        scare = 0;
        creepcon = 0;
        creeptoolate = 0;
        endcreep = 0;
        makelilkrisleave = 0;
        sodamake = 0;
        darkenblend = true;
        posCorrect = 0;
        creepinpuit = 0;
        cantgoback = true;
        krisandsusie = 0;
        grayblend = 0.5;
        con = 18;
        creeptimer = 0;
        inthetvcon = 3;
        hidekris = false;
        controller = scr_dark_marker(344, 362, spr_ch3_controller);
        controller.depth = 99800;
        controller.image_blend = merge_color(c_white, c_black, 0.5);
        with (obj_mainchara)
        {
            cutscene = 1;
            x = 256;
            y = 300;
            direction = 180;
            image_blend = c_gray;
            depth = 96250;
            fun = 0;
            freeze = 0;
        }
        with (obj_mainchara_board)
        {
            x = 871;
            y = 467;
            depth = 10000;
            walktimer = 9.5;
            wspeed = 2;
            walk = 1;
            walkbuffer = 5.25;
            controlled = 0;
            sword = true;
            nocamtransition = true;
            caninteract = false;
            swordlv = 5;
            xp = 0;
            cantleave = false;
        }
        with (obj_gameshow_swordroute)
        {
            skip = false;
            skiponce = false;
            disableshadow = false;
            debugdraw = 0;
            screencolor = #001DFF;
            newcolor = 16719104;
            screenalpha = 0;
            drawshadow = true;
            shadowfade = 1;
            drawui = true;
            colorchange = 0;
        }
    }
}
if (con == 0)
{
    if (cantgoback == false)
    {
        var createblock = 0;
        with (lilkris)
        {
            if (x >= 508)
            {
                depth = 10000;
                createblock = 1;
            }
        }
        if (createblock == 1)
        {
            cantgoback = true;
            instance_create_board(11, 4, obj_board_solid);
        }
    }
    with (lilkris)
    {
        if (place_meeting(x, y, obj_board_trigger))
        {
            var inst = instance_place(x, y, obj_board_trigger);
            if (inst.extflag == "1")
            {
                wspeed = 3;
                boardgrid = false;
                other.con = 1;
                safe_delete(inst);
            }
        }
    }
}
if (con == 1)
{
    with (lilkris)
    {
        if (place_meeting(x, y, obj_board_trigger))
        {
            var inst = instance_place(x, y, obj_board_trigger);
            if (inst.extflag == "2")
            {
                other.kris.sprite_index = spr_krisu_holdcontroller_lookright;
                other.con = 2;
                safe_delete(inst);
            }
        }
    }
}
if (con == 2)
{
    with (lilkris)
    {
        if (place_meeting(x, y, obj_board_trigger))
        {
            var inst = instance_place(x, y, obj_board_trigger);
            if (inst.extflag == "3")
            {
                wspeed = 2;
                other.con = 3;
                safe_delete(inst);
            }
        }
    }
}
if (con == 3)
{
    with (obj_gameshow_swordroute)
        scr_lerpvar("screenalpha", screenalpha, 0, 60);
    kris.sprite_index = spr_krisr_dark;
    kris.hspeed = -5;
    kris.friction = 0.45;
    controller = scr_dark_marker(kris.x + 24, kris.y + 40, spr_ch3_controller);
    controller.depth = 99800;
    controller.image_blend = merge_color(c_white, c_black, 0.5);
    with (controller)
        scr_lerpvar("y", y, (y + 20 + 8) - 4, 6, 2, "in");
    with (controller)
        scr_lerpvar("x", x, (x + 20 + 13) - 13, 6);
    snd_play_delay(snd_noise, 4);
    con = 4;
}
if (con == 4)
{
    var krisdist = abs(kris.x - lilkris.x);
    if (krisdist < 100)
        scare = 1;
    if (krisdist < 140 && left_h())
    {
        kris.x -= 1 + scare;
        kris.image_index += 0.25;
    }
    var skipthis = false;
    if (krisdist < 140 && lilkris.swordbuffer >= 6)
    {
        con = -999;
        skipthis = true;
        kris.hspeed = -8;
        kris.friction = 0.45;
        kris.image_speed = 0;
        kris.image_index = 0;
        kris.fun = 1;
        var _delay = 6;
        with (kris)
            scr_script_delayed(scr_var, _delay, "sprite_index", spr_kris_fallen_dark);
        snd_play_delay(snd_wing, _delay);
        scr_script_delayed(scr_var, 70, "con", 15);
        lilkris.canfreemove = 0;
        global.interact = 1;
    }
    if (lilkris.x <= 240 && !skipthis)
    {
        lilkris.x = 240;
        lilkris.canfreemove = 0;
        con = -999;
        kris.image_speed = 0;
        kris.image_index = 0;
        scr_script_delayed(scr_var, 60, "con", 15);
    }
    if (lilkris.x >= 608 && !skipthis)
    {
        lilkris.canfreemove = 0;
        con = -999;
        kris.image_speed = 0;
        kris.image_index = 0;
        lilkris.hspeed = lilkris.wspeed;
        lilkris.sprite_index = lilkris.rsprite;
        lilkris.fun = 1;
        lilkris.image_speed = 0.125;
        scr_script_delayed(scr_var, 70, "con", 15);
    }
    if (kris.x < 140)
        kris.x = 140;
}
if (con == 15)
{
    kris.image_speed = 0;
    lilkris.sprite_index = lilkris.dsprite;
    lilkris.facing = 0;
    lilkris.fun = 1;
    lilkris.image_speed = 0.125;
    lilkris.vspeed = 2;
    if (kris.sprite_index != spr_kris_fallen_dark)
    {
        with (kris)
            scr_script_delayed(scr_var, 12, "sprite_index", spr_krisd_dark);
    }
    scr_script_delayed(scr_var, 60, "con", 16);
    con = -999;
}
if (con == 16)
{
    posCorrect = 0;
    var delay = 1;
    if (kris.sprite_index == spr_kris_fallen_dark)
    {
        snd_play(snd_noise);
        posCorrect = 1;
        kris.sprite_index = spr_kris_dw_landed;
        kris.image_index = 0;
        kris.x -= 8;
        kris.y -= 4;
        with (kris)
        {
            scr_script_delayed(scr_var, 10, "image_index", 1);
            scr_script_delayed(scr_var, 20, "image_index", 2);
        }
        delay = 40;
    }
    with (obj_mainchara_board)
        controlled = 0;
    scr_script_delayed(scr_var, delay, "con", 16.1);
    con = -999;
}
if (con == 16.1)
{
    lilkris.hspeed = 0;
    lilkris.vspeed = 0;
    kris.fun = 0;
    kris.freeze = false;
    global.facing = 2;
    global.interact = 0;
    kris.y = 298;
    if (posCorrect)
        kris.x += 8;
    kris.x = round(kris.x);
    con = 17;
    with (obj_event_manager)
        trigger_event(UnknownEnum.Value_0, UnknownEnum.Value_28);
}
if (con == 18)
{
    var _play = collision_rectangle(256, 340, 384, 380, obj_mainchara, 0, 0);
    if (_play != -4)
    {
        obj_gameshow_swordroute.drawshadow = false;
        obj_gameshow_swordroute.disableshadow = true;
        global.interact = 1;
        timer = 0;
        con = 19;
    }
}
if (con == 19)
{
    global.facing = 1;
    scr_getchar("susie");
    scr_makecaterpillar(640, 282, 2, 0);
    with (obj_caterpillarchara)
        follow = 0;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    rim.visible = false;
    lil = instance_create(640, 320, obj_marker);
    with (lil)
    {
        sprite_index = spr_board_kris_walk_right;
        image_speed = 0.125;
        scr_darksize();
    }
    con = 20;
}
if (con == 20)
{
    c_var_instance(id, "hidekris", false);
    c_var_instance(lil, "x", 640);
    c_var_instance(lil, "y", 340);
    c_sel(kr);
    c_walkdirect_wait(316, 298, 32);
    c_wait(1);
    c_facing("r");
    c_wait(15);
    c_autofacing(0);
    c_imagespeed(0);
    c_imageindex(1);
    c_sprite(spr_kris_dw_landed);
    c_sndplay(snd_noise);
    c_var_instance(controller, "visible", false);
    c_wait(15);
    c_autofacing(1);
    c_wait(5);
    c_walkdirect_wait(300, 298, 12);
    c_sprite(spr_krisu_holdcontroller);
    c_wait(14);
    c_speaker("susie");
    c_msgsetloc(0, "\\E9* Hey Kris!/%", "obj_swordroute_event_leavescreen_slash_Step_0_gml_269_0");
    c_var_instance(id, "hidebar", 1);
    c_talk_wait();
    c_sel(su);
    c_walkdirect_wait(340, 282, 64);
    c_wait(8);
    c_var_instance(id, "creepcon", 1);
    c_speaker("susie");
    c_msgsetloc(0, "\\E2* What the hell are you doing?/", "obj_swordroute_event_leavescreen_slash_Step_0_gml_276_0");
    c_msgnextloc("\\EL* Being a tryhard all by yourself?/%", "obj_swordroute_event_leavescreen_slash_Step_0_gml_277_0");
    c_sel(su);
    c_facing("u");
    c_talk_wait();
    c_wait(45);
    c_sprite(spr_susieu_dark_faceleft);
    c_var_instance(1368, "fun", 1);
    c_var_instance(1368, "sprite_index", spr_susieu_dark_faceleft);
    c_var_instance(kris, "fun", 1);
    c_var_instance(kris, "sprite_index", spr_krisu_dark_slightright);
    c_wait(6);
    c_var_instance(id, "con", 21);
    c_var_instance(kris, "visible", true);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
    con = -99;
}
if (con == 21)
{
    kris.sprite_index = spr_krisu_dark_slightright;
    global.msc = 1250;
    scr_text(global.msc);
    d_make();
    con = 22;
    timer = 0;
}
if (con == 25 && !d_ex())
{
    timer++;
    if (timer == 5)
    {
        if (noturn == false)
            kris.sprite_index = spr_krisu_dark_slightright_down;
    }
    if (timer == 30)
    {
        obj_caterpillarchara.sprite_index = spr_susieu_dark_faceleft_smile;
        scr_speaker("susie");
        msgsetloc(0, "\\E0* .../", "obj_swordroute_event_leavescreen_slash_Step_0_gml_321_0");
        msgnextloc("\\EQ* If you get all sweaty playing games alone.../", "obj_swordroute_event_leavescreen_slash_Step_0_gml_322_0");
        msgnextloc("\\E9* You're gonna end up like Berdly^1, right?/%", "obj_swordroute_event_leavescreen_slash_Step_0_gml_323_0");
        d_make();
        timer = 0;
        con = 25.5;
    }
}
if (con == 25.5 && !d_ex())
{
    obj_caterpillarchara.sprite_index = spr_susieu_dark_faceleft;
    timer++;
    if (timer == 30)
    {
        var _weird = global.flag[456];
        if (_weird)
        {
            obj_caterpillarchara.sprite_index = spr_susieu_dark_faceleft_unhappy;
            msgsetloc(0, "\\E0* .../", "obj_swordroute_event_leavescreen_slash_Step_0_gml_339_0");
            msgnextloc("\\EK* Hey^1, uh^1, it's just a joke. Chill./%", "obj_swordroute_event_leavescreen_slash_Step_0_gml_340_0");
        }
        else
        {
            msgsetloc(0, "\\EK* ... Okay^1, enough bird noises. I get it./%", "obj_swordroute_event_leavescreen_slash_Step_0_gml_344_0");
        }
        d_make();
        timer = 0;
        con = 26;
        creeptoolate = 1;
    }
}
if (con == 26)
{
    if (creepcon == 3)
    {
        creepcon = -1;
        con = -999;
        if (lilkris.y > 325)
        {
            lilkris.canfreemove = 0;
            lilkris.fun = 1;
            lilkris.swordbuffer = 0;
            lilkris.vspeed = 2;
            lilkris.sprite_index = lilkris.dsprite;
            lilkris.image_speed = 0.125;
            scr_delay_var("con", 26.1, 30);
        }
        else
        {
            lilkris.canfreemove = 0;
            lilkris.fun = 1;
            lilkris.swordbuffer = 0;
            lilkris.hspeed = 2;
            if (lilkris.x < 560)
                lilkris.hspeed = 3;
            lilkris.sprite_index = lilkris.rsprite;
            lilkris.image_speed = 0.125;
            scr_delay_var("con", 26.1, 30);
        }
    }
    else
    {
        con = 26.1;
    }
}
if (con == 26.1 && !d_ex())
{
    con = -999;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    c_sel(su);
    c_walkdirect_speed(400, 282, 4);
    c_wait(30);
    c_var_instance(id, "con", 120);
    c_var_instance(1368, "fun", 1);
    c_var_instance(1368, "sprite_index", spr_susie_right_dw);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 70 && !d_ex())
{
    timer++;
    if (timer == 15)
        obj_caterpillarchara.sprite_index = spr_susieu_dark_faceleft_unhappy;
    if (timer == 30)
        con = 71;
}
if (con == 71)
{
    con = -999;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    c_speaker("susie");
    c_msgsetloc(0, "\\EV* .../", "obj_swordroute_event_leavescreen_slash_Step_0_gml_417_0");
    c_msgnextloc("\\EW* Okay^1, then here's an idea./%", "obj_swordroute_event_leavescreen_slash_Step_0_gml_418_0");
    c_talk_wait();
    c_sel(su);
    c_walk("l", 2, 34);
    c_autowalk(0);
    c_imagespeed(0.125);
    c_sprite(spr_susie_walk_left_dw_unhappy);
    c_wait(4);
    c_sel(kr);
    c_autofacing(0);
    c_sprite(spr_krisr_dark);
    c_walk("l", 2, 34);
    c_wait(30);
    c_var_instance(id, "creeptoolate", 1);
    c_sel(su);
    c_autowalk(1);
    c_wait(4);
    c_facing("u");
    c_wait(10);
    c_var_instance(controller, "visible", false);
    c_autofacing(0);
    c_sprite(spr_susieu_dark_benddown);
    c_wait(15);
    c_shakeobj();
    c_sound_play(snd_wing);
    c_var_instance(id, "endcreep", true);
    c_wait(20);
    c_sprite(spr_susie_walk_up_dw);
    c_wait(20);
    c_imageindex(0);
    c_imagespeed(0);
    c_sprite(spr_susie_sm5_holdcontroller_left);
    c_wait(30);
    c_var_instance(id, "dropcontroller", 1);
    c_sprite(spr_susie_sm5_dropcontroller_left);
    c_wait(20);
    c_speaker("susie");
    c_msgsetloc(0, "\\EY* Don't play it./%", "obj_swordroute_event_leavescreen_slash_Step_0_gml_444_0");
    c_talk_wait();
    c_wait(10);
    c_sel(su);
    c_autofacing(1);
    c_sprite(spr_susie_walk_left_dw);
    c_sel(su);
    c_walkdirect_speed(420, 282, 4);
    c_wait(30);
    c_facing("r");
    c_var_instance(id, "con", 120);
    c_var_instance(kris, "fun", 1);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
    with (obj_caterpillarchara)
    {
        fun = 1;
        sprite_index = spr_susie_walk_right_dw;
    }
}
if (con == 120)
{
    if (creepcon == 3)
    {
        creepcon = -1;
        con = -999;
        if (lilkris.y > 325)
        {
            lilkris.canfreemove = 0;
            lilkris.fun = 1;
            lilkris.swordbuffer = 0;
            lilkris.vspeed = 2;
            lilkris.sprite_index = lilkris.dsprite;
            lilkris.image_speed = 0.125;
            scr_delay_var("con", 120.1, 30);
        }
        else
        {
            lilkris.canfreemove = 0;
            lilkris.fun = 1;
            lilkris.swordbuffer = 0;
            lilkris.hspeed = 2;
            if (lilkris.x < 560)
                lilkris.hspeed = 3;
            lilkris.sprite_index = lilkris.rsprite;
            lilkris.image_speed = 0.125;
            scr_delay_var("con", 120.1, 30);
        }
    }
    else
    {
        con = 120.1;
    }
}
if (con == 120.1)
{
    creeptoolate = 1;
    global.facing = 1;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    con = -999;
    c_sel(su);
    c_facing("r");
    c_speaker("susie");
    c_msgsetloc(0, "\\E0* Anyway./", "obj_swordroute_event_leavescreen_slash_Step_0_gml_513_0");
    c_msgnextloc("\\E2* Here. Stole you a drink./", "obj_swordroute_event_leavescreen_slash_Step_0_gml_514_0");
    c_msgnextloc("\\EQ* Now stop making us wait already./%", "obj_swordroute_event_leavescreen_slash_Step_0_gml_515_0");
    c_talk_wait();
    c_facing("u");
    c_wait(10);
    c_var_instance(id, "sodamake", 1);
    c_wait(10);
    c_walk("r", 4, 60);
    c_wait(60);
    c_var_instance(id, "con", 121);
    c_var_instance(kris, "fun", 0);
    global.facing = 0;
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 121 && !i_ex(cutscene_master))
{
    global.flag[7] = 0;
    obj_gameshow_swordroute.bg.depth = 999994;
    obj_gameshow_swordroute.depth = 999980;
    obj_board_controller.depth = 999980;
    with (obj_treasure_room)
        depth = 999990;
    obj_gameshow_swordroute.gameconsole.depth = 999985;
    obj_swordroute_event_susiesoda.depth = 999985;
    global.flag[1278] = 1;
    with (obj_marker)
    {
        if (x == 0 && y == 380)
            depth = 999979;
    }
    with (obj_mainchara)
    {
        ignoredepth = 1;
        depth = 999979;
    }
    instance_create(574, 308, obj_solidblocksized);
    kris.fun = 0;
    kris.freeze = 0;
    global.interact = 0;
    scr_losechar();
    safe_delete(obj_caterpillarchara);
    with (cont2)
        depth = obj_mainchara.depth - 10;
    con++;
}
if (controllerdrop == 1)
{
    controllerdrop = 0;
    with (controller)
    {
        visible = true;
        image_angle = 0;
        setxy(300, 308);
        scr_lerpvar("y", y, 350, 8, 2, "in");
    }
    scr_script_delayed(scr_var, 8, "controllerdrop", 2);
}
if (controllerdrop == 2)
{
    with (controller)
    {
        scr_lerpvar("image_angle", image_angle, image_angle + 90, 4);
        scr_lerpvar("y", y, y + 30, 4);
        scr_lerpvar("x", x, x - 20, 4, 2, "out");
    }
    controllerdrop = 0;
}
if (i_ex(kris))
{
    with (kris)
    {
        if (other.inthetvcon == 0)
        {
            if (place_meeting(x, y, obj_bpush2_stucktrigger))
                other.inthetvcon = 1;
        }
        if (other.inthetvcon == 1)
        {
            var open = 0;
            with (obj_treasure_room)
            {
                if (image_index == 1)
                    open++;
            }
            if (open != 0)
            {
                with (obj_gameshow_swordroute)
                    shadowfade = 1;
                other.inthetvcon = 2;
            }
        }
        if (other.inthetvcon == 2)
        {
            if (!place_meeting(x, y, obj_bpush2_stucktrigger))
            {
                other.con = 18;
                other.inthetvcon = 3;
                with (obj_bpush2_stucktrigger)
                {
                    copy = instance_create(x, y, obj_solidblock);
                    copy.sprite_index = sprite_index;
                    copy.image_xscale = image_xscale;
                    copy.image_yscale = image_yscale;
                    instance_destroy();
                }
                other.darkenblend = true;
            }
        }
    }
}
if (darkenblend)
{
    grayblend = lerp(grayblend, 0.5, 0.25);
    var mygray = grayblend;
    with (obj_mainchara)
        image_blend = merge_color(c_white, c_black, mygray);
    with (obj_actor)
        color_blend = merge_color(c_white, c_black, mygray);
    with (obj_caterpillarchara)
        image_blend = merge_color(c_white, c_black, mygray);
}
if (sodamake == 1)
{
    sodamake = 2;
    var __x = 444;
    if (i_ex(obj_caterpillarchara))
        __x = obj_caterpillarchara.x + 22;
    if (i_ex(obj_actor))
    {
        with (obj_actor)
        {
            if (name == "susie")
                __x = x + 22;
        }
    }
    with (obj_mainchara_board)
        instance_destroy();
    soda = instance_create(__x, 354, obj_swordroute_event_susiesoda);
    soda.depth = 99990;
    soda.image_blend = merge_color(c_white, c_black, 0.5);
    safe_delete(exitblocker);
    global.tempflag[90] = 0;
}
if (creepcon == 1 && creeptoolate == 0)
{
    if (!left_h() && !up_h())
        creepinput = 0;
    if (left_h() || up_h())
        creepinput++;
    if (creepinput >= 10)
    {
        var _condelay = 34;
        if (up_h())
        {
            with (lilkris)
            {
                visible = true;
                setxy(520, 480);
                canfreemove = false;
                interactoverride = true;
                fun = 1;
                sprite_index = spr_board_kris_walk_up;
                image_speed = 0.125;
                scr_lerpvar("y", 481, 345, 34);
                _condelay = 34;
            }
        }
        else
        {
            with (lilkris)
            {
                visible = true;
                setxy(640, 345);
                canfreemove = false;
                interactoverride = true;
                fun = 1;
                sprite_index = spr_board_kris_walk_left;
                image_speed = 0.125;
                scr_lerpvar("x", 640, 576, 32);
                _condelay = 32;
            }
        }
        with (obj_mainchara_board)
            controlled = true;
        creepcon = -999;
        scr_script_delayed(scr_var, _condelay, "creepcon", 2);
        with (lilkris)
            scr_script_delayed(scr_var, _condelay, "image_speed", 0);
    }
}
if (creepcon == 2)
{
    tvblocker = instance_create(504, 192, obj_board_solid);
    lilkris.canfreemove = 1;
    lilkris.interactoverride = true;
    lilkris.fun = 0;
    lilkris.sword = false;
    kris.freeze = true;
    creepcon = 3;
}
fakeswordhit = 0;
if (fakeswordcon == 1)
{
    var _hit = 0;
    fakeswordcon = -999;
    var _fakeswordcondelay = 9;
    scr_delay_var("fakeswordcon", 0, _fakeswordcondelay);
    if (lilkris.x <= 424 && lilkris.facing == 3)
        _hit = 1;
    if (_hit == 0)
    {
        snd_play(choose(snd_board_sword1, snd_board_sword2, snd_board_sword3));
        lilkris.swordbuffer = 8;
        lilkris.swordfacing = lilkris.facing;
        lilkris.canfreemove = 0;
        with (lilkris)
            scr_var_delay("canfreemove", 1, _fakeswordcondelay);
    }
    else
    {
        var __delay = 2;
        with (lilkris)
        {
            canfreemove = 0;
            scr_delay_var("swordbuffer", 8, __delay);
            scr_delay_var("swordfacing", facing, __delay);
            snd_play_delay(choose(snd_board_sword1, snd_board_sword2, snd_board_sword3), __delay);
        }
        fakeswordhit = 1;
    }
}
if (creepcon == 3)
{
    with (obj_mainchara_board)
    {
        interactoverride = true;
        fun = 0;
    }
    var breakEverything = false;
    lilkrisXClamp = 406;
    with (obj_actor)
    {
        if (name == "susie")
            other.lilkrisXClamp = ((id.x + sprite_width + 24) - 24) + 6;
    }
    if (lilkris.x < lilkrisXClamp)
        lilkris.x = lilkrisXClamp;
    if (button1_p())
    {
        if (fakeswordcon == 0)
            fakeswordcon = 1;
    }
    if (endcreep)
    {
        with (lilkris)
        {
            visible = false;
            splash = instance_create(x + 16, y + 16, obj_board_enemydefeatsplash);
            splash.depth = 0;
        }
        endcreep = 2;
        creepcon = -999;
        breakEverything = false;
        with (obj_event_manager)
            trigger_event(UnknownEnum.Value_0, UnknownEnum.Value_29);
    }
    if (fakeswordhit == true)
        breakEverything = true;
    if (breakEverything == true)
        creepcon++;
}
if (creepcon == 4)
{
    con = -999;
    var krisX = 0;
    var krisY = 0;
    global.interact = 1;
    if (i_ex(obj_cutscene_master))
    {
        with (obj_actor)
        {
            if (name == "kris")
            {
                krisX = id.x;
                krisY = id.y;
            }
        }
        with (obj_mainchara_board)
        {
            interactoverride = 0;
            canfreemove = 0;
        }
        with (obj_actor)
            instance_destroy();
        with (obj_cutscene_master)
            instance_destroy();
        with (obj_dialoguer)
            instance_destroy();
        with (obj_choicer_neo)
            instance_destroy();
        with (obj_writer)
            instance_destroy();
    }
    else
    {
        krisX = obj_mainchara.x;
        krisY = obj_mainchara.y;
        with (obj_mainchara)
            visible = false;
        with (obj_caterpillarchara)
            visible = false;
    }
    with (obj_choicer_neo)
        instance_destroy();
    with (obj_writer)
        instance_destroy();
    with (obj_dialoguer)
        instance_destroy();
    with (obj_lerpvar)
        instance_destroy();
    if (subcon == 0)
    {
        subcon = 1;
        subtimer = 0;
        var susX = 340;
        var susY = 282;
        kris.visible = false;
        with (obj_actor)
        {
            if (name == "susie")
                other.susie = id;
        }
        if (!i_ex(susie))
            susie = 1368;
        susie.visible = false;
        snd_play(snd_grab);
        krisandsusie = scr_dark_marker(susX, susY, spr_dw_ch3_SM03_grab_1);
        krisandsusie.image_blend = merge_color(c_white, c_black, 0.5);
    }
}
if (subcon == 1)
{
    subtimer++;
    if (subtimer == 2)
        krisandsusie.x -= 4;
    if (subtimer == 3)
        krisandsusie.x -= 2;
    if (subtimer == 4)
        krisandsusie.x -= 2;
    if (subtimer == 5)
    {
        with (krisandsusie)
        {
            sprite_index = spr_dw_ch3_SM03_grab_2;
            image_speed = 0.125;
            hspeed = -12;
            vspeed = -3.5;
            gravity = 0.95;
        }
    }
    if (subtimer == 11)
    {
        with (krisandsusie)
        {
            sprite_index = spr_dw_ch3_SM03_grab_3;
            image_index = 0;
            image_speed = 0;
        }
    }
    if (subtimer == 12)
    {
        with (krisandsusie)
        {
            y = 282;
            friction = 1.5;
            vspeed = 0;
            gravity = 0;
        }
    }
    if (subtimer == 12)
        krisandsusie.sprite_index = spr_dw_ch3_SM03_grab_3_breathing;
    var startbreathing = 12;
    var endbreathing = 117;
    if (subtimer > startbreathing && subtimer < endbreathing)
        krisandsusie.image_speed = (1 - ((subtimer - startbreathing) / (endbreathing - startbreathing))) * 0.25;
    if (subtimer == 57)
        makelilkrisleave = true;
    var timeperframe = 6;
    if (subtimer == 129)
    {
        with (krisandsusie)
        {
            debug_print("change");
            sprite_index = spr_dw_ch3_SM03_grab_3;
            image_index = 0;
            image_speed = 0;
            for (var i = 0; i < 5; i++)
                scr_delay_var("image_index", i, i * timeperframe);
            scr_delay_var("image_index", 0, (6 * timeperframe) - 1);
            scr_delay_var("sprite_index", 3449, (6 * timeperframe) - 1);
        }
    }
    if (subtimer == 194)
    {
        creepcon = 6;
        subcon++;
        subtimer = 0;
    }
}
if (makelilkrisleave == true)
{
    makelilkrisleave = false;
    with (scr_dark_marker(obj_mainchara_board.x, obj_mainchara_board.y, spr_board_kris_walk_down))
    {
        depth = obj_mainchara_board.depth;
        image_index = 0;
        scr_delay_var("image_index", 1, 4);
        vspeed = 2;
        scr_doom(id, 64);
    }
    with (obj_mainchara_board)
        instance_destroy();
}
if (creepcon == 6)
{
    susie = 1368;
    kris.x = krisandsusie.x - 62;
    kris.y = krisandsusie.y + 16;
    susie.x = krisandsusie.x - 16;
    susie.y = krisandsusie.y;
    kris.fun = 1;
    susie.fun = 1;
    kris.sprite_index = spr_krisr_dark;
    susie.sprite_index = spr_susie_left_dw;
    creepcon = 7;
}
if (creepcon == 7)
{
    krisandsusie.sprite_index = spr_dw_ch3_SM03_together;
    krisandsusie.image_speed = 0;
    krisandsusie.image_index = 0;
    scr_speaker("susie");
    msgsetloc(0, "\\EZ* K-Kris...? What are you.../", "obj_swordroute_event_leavescreen_slash_Step_0_gml_937_0");
    msgnextloc("\\EV* .../", "obj_swordroute_event_leavescreen_slash_Step_0_gml_938_0");
    msgnextloc("\\EV* Alright^1, I..^1. I get it./", "obj_swordroute_event_leavescreen_slash_Step_0_gml_939_0");
    msgnextloc("\\EW* Well^1, if..^1. if you really want to./%", "obj_swordroute_event_leavescreen_slash_Step_0_gml_1140_0");
    d_make();
    creepcon++;
    timer = 0;
}
if (creepcon == 8 && d_ex())
{
    if (scr_getmsgno_d() == 2)
        krisandsusie.image_index = 1;
}
if (creepcon == 8 && !d_ex())
{
    timer++;
    if (timer == 30)
    {
        krisandsusie.image_index = 2;
        snd_play(snd_swallow);
        snd_play(snd_noise);
    }
    if (timer == 60)
    {
        global.flag[1268] = 1;
        scr_speaker("susie");
        msgsetloc(0, "\\EX* Go ahead./", "obj_swordroute_event_leavescreen_slash_Step_0_gml_963_0");
        msgnextloc("\\EY* I tasted your shampoo in your bathroom^1, here^1, you can taste mine./%", "obj_swordroute_event_leavescreen_slash_Step_0_gml_964_0");
        d_make();
        creepcon = 8.1;
        timer = 0;
    }
}
if (creepcon == 8.1 && d_ex())
{
    if (scr_getmsgno_d() == 1)
    {
        krisandsusie.image_index = 3;
        creepcon = 8.2;
        timer = 0;
    }
}
if (creepcon == 8.2 && !d_ex())
{
    timer++;
    if (timer == 60)
    {
        krisandsusie.image_index = 4;
        snd_play(snd_whip_crack_only);
    }
    if (timer == 90)
    {
        scr_speaker("susie");
        msgsetloc(0, "\\EH* WHAT? HOW AM I THE WEIRD ONE HERE!?/%", "obj_swordroute_event_leavescreen_slash_Step_0_gml_975_0");
        d_make();
        timer = 0;
        creepcon = 9;
    }
}
if (creepcon == 9 && !d_ex())
{
    timer++;
    if (timer == 10)
    {
        krisandsusie.visible = false;
        kris.visible = true;
        susie.sprite_index = spr_susie_walk_left_dw_unhappy;
        susie.visible = true;
        susie.hspeed = 4;
        susie.friction = 0.45;
        snd_play(snd_wing);
    }
    if (timer == 30)
    {
        scr_speaker("susie");
        msgsetloc(0, "\\EM* Jeez./%", "obj_swordroute_event_leavescreen_slash_Step_0_gml_993_0");
        d_make();
        creepcon++;
    }
}
if (creepcon == 10 && !d_ex())
{
    with (susie)
        scr_move_to_point_over_time(420, 282, 40);
    susie.sprite_index = spr_susie_walk_right_dw;
    susie.image_speed = 0.25;
    creepcon++;
    scr_script_delayed(scr_var, 40, "con", 120);
}
if (creepcon >= 3 && creepcon < 5 && i_ex(lilkris))
{
    if (lilkris.x <= 428)
    {
        with (obj_actor)
        {
            if (name == "kris")
                sprite_index = spr_kris_u_dark_lookright;
        }
        obj_mainchara.sprite_index = spr_kris_u_dark_lookright;
    }
}
if (dropcontroller == 1)
{
    with (obj_mainchara_board)
        controlled = 0;
    safe_delete(cont2);
    dropcontroller = 2;
    var suact = 0;
    with (obj_actor)
    {
        if (name == "susie")
            suact = id;
    }
    cont2 = scr_dark_marker(suact.x + 2, suact.y + 34, spr_ch3_controller);
    cont2.image_blend = merge_color(c_white, c_black, 0.5);
    cont2.limiter = scr_limitval_upper(cont2, "y", cont2.y + 37, 40);
    cont2.gravity = 1;
}
if (dropcontroller == 2)
{
    if (i_ex(cont2))
    {
        if (cont2.y >= 352)
        {
            cont2.vspeed = -2;
            cont2.y = 352;
            snd_play_x(snd_noise, 0.7, 1);
            dropcontroller = 3;
            cont2.sprite_index = spr_ch3_controller_laydown;
            with (cont2)
                scr_delay_var("vspeed", 0, 8);
            with (cont2)
                scr_delay_var("gravity", 0, 8);
        }
    }
}
if (hidebar == 1)
{
    with (obj_gameshow_swordroute)
        drawui = false;
    with (scr_marker_ext(board_tilex(0), board_tiley(-1), spr_pxwhite, 384, 32, undefined, undefined, c_black, 99999999))
        hidebar = 2;
}

enum UnknownEnum
{
    Value_0,
    Value_28 = 28,
    Value_29
}
