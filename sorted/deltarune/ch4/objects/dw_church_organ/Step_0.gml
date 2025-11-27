var kractor = -4;
with (obj_actor)
{
    if (name == "kris")
        kractor = id;
}
if (scr_debug())
{
    if (keyboard_check_pressed(ord("B")))
    {
        solved = !solved;
        printval("solved");
    }
    if (keyboard_check_pressed(ord("N")))
        endlessplaylog = "";
}
var usedsheetmusic = global.flag[847];
var diffroom = false;
if (instance_exists(obj_dw_church_organpuzzle))
    diffroom = true;
var roomoffset = 0;
if (diffroom)
    roomoffset = 560;
playloganswer = "aoamcdbaaoaebcdeeeeeacbnaaocdeeeeefghgfecaoamcdbaklji";
if (buffer > -10)
    buffer--;
if (engaged == true)
{
    if ((button2_h() && buffer < 0) || forceend == 1)
    {
        kractor.auto_walk = true;
        endtimer++;
        if (i_ex(obj_dw_church_organpuzzle))
        {
            if (obj_dw_church_organpuzzle.con != 0)
                endtimer = 0;
        }
        if (endtimer >= endtime || forceend)
        {
            endlessplaylog = "";
            forceend = false;
            engaged = false;
            endtimer = 0;
            var quittype = 0;
            if (global.plot < 175)
                quittype = 1;
            if (global.plot >= 180 && !solved)
                quittype = 10;
            switch (quittype)
            {
                case 0:
                    play_cancel();
                    break;
                case 1:
                    con = 40;
                    global.interact = 0;
                    break;
                case 10:
                    global.interact = 1;
                    con = 50;
                    kractor.sprite_index = spr_krisu_dark;
                    break;
            }
        }
    }
    else
    {
        endtimer = 0;
    }
    soundtoplay = 0;
    if (left_h() && !down_h() && !right_h() && !up_h())
        soundtoplay = 1;
    if ((left_h() && down_h()) && !up_h() && !right_h())
        soundtoplay = 2;
    if (down_h() && !left_h() && !right_h() && !up_h())
        soundtoplay = 3;
    if ((down_h() && right_h()) && !left_h() && !up_h())
        soundtoplay = 4;
    if (right_h() && !left_h() && !down_h() && !up_h())
        soundtoplay = 5;
    if ((up_h() && right_h()) && !down_h() && !left_h())
        soundtoplay = 7;
    if (up_h() && !left_h() && !down_h() && !right_h())
        soundtoplay = 7;
    if ((up_h() && left_h()) && !down_h() && !right_h())
        soundtoplay = 8;
    makenote = false;
    if (buffer < 0 && con == 0)
    {
        kractor.auto_walk = false;
        kractor.sprite_index = spr_kris_piano_loop_1;
        kractor.image_index = 3;
        if (button1_p() && !button2_h())
        {
            makenote = true;
            var mysound = 0;
            var myinstrument = 13;
            var myinstrument2 = 338;
            var lowpitch = 0;
            if (button3_h())
                lowpitch = -6;
            var thispitch = power(2, (lowpitch + soundtoplay) / 12);
            thispitch = 1;
            var passentry = "";
            switch (soundtoplay)
            {
                case 0:
                    if (!button3_h())
                    {
                        thispitch = 1;
                        passentry = "a";
                    }
                    else
                    {
                        thispitch = 0.5;
                        passentry = "i";
                    }
                    break;
                case 5:
                    if (!button3_h())
                    {
                        thispitch = 1.125;
                        passentry = "b";
                    }
                    else
                    {
                        thispitch = 0.5625;
                        passentry = "j";
                    }
                    break;
                case 4:
                    if (!button3_h())
                    {
                        thispitch = 1.25;
                        passentry = "c";
                    }
                    else
                    {
                        thispitch = 0.625;
                        passentry = "k";
                    }
                    break;
                case 3:
                    if (!button3_h())
                    {
                        thispitch = 4/3;
                        passentry = "d";
                    }
                    else
                    {
                        thispitch = 2/3;
                        passentry = "l";
                    }
                    break;
                case 2:
                    if (!button3_h())
                    {
                        thispitch = 1.5;
                        passentry = "e";
                    }
                    else
                    {
                        thispitch = 0.75;
                        passentry = "m";
                    }
                    break;
                case 1:
                    if (!button3_h())
                    {
                        thispitch = 1.6666666666666667;
                        passentry = "f";
                    }
                    else
                    {
                        thispitch = 0.8333333333333334;
                        passentry = "n";
                    }
                    break;
                case 8:
                    if (!button3_h())
                    {
                        thispitch = 1.875;
                        passentry = "g";
                    }
                    else
                    {
                        thispitch = 0.9375;
                        passentry = "o";
                    }
                    break;
                case 7:
                    if (!button3_h())
                    {
                        thispitch = 2;
                        passentry = "h";
                    }
                    else
                    {
                        thispitch = 1;
                        passentry = "a";
                    }
                    break;
            }
            snd_play(myinstrument, 0.8, thispitch);
            buffer = 0;
            endlessplaylog += passentry;
            if (!solved)
            {
                var checkcorrect = false;
                if (string_length(endlessplaylog) > 2)
                    checkcorrect = true;
                if (checkcorrect == true)
                {
                    var checkstring = string_copy(playloganswer, 0, string_length(endlessplaylog));
                    var killstring = string_copy(playloganswer, 0, string_length(playloganswer));
                    if (checkstring != endlessplaylog || endlessplaylog == killstring)
                    {
                        forceend = true;
                        checkcorrect = false;
                        snd_stop(myinstrument);
                        snd_stop(myinstrument2);
                        snd_play(snd_pianonoise);
                        if (endlessplaylog == killstring)
                        {
                            snd_stop(snd_pianonoise);
                            snd_play(snd_pianonoise, undefined, 0.8);
                            debug_print("correct but not allowed");
                        }
                        endlessplaylog = "";
                    }
                }
            }
            else
            {
                var checkstrings = [];
                array_push(checkstrings, "mbamooamamooa");
                array_push(checkstrings, "ccdecddebm");
                array_push(checkstrings, "adefddcdbadedcdd");
                array_push(checkstrings, "nachgebc");
                array_push(checkstrings, "cdeeeeeacbbbbbbcbaaaaaaghgec");
                array_push(checkstrings, "nacghecfoaeoa");
                array_push(checkstrings, "caonnfedcbabc");
                array_push(checkstrings, "edbcab");
                array_push(checkstrings, "naoannoaec");
                array_push(checkstrings, "cecfeafhfhe");
                array_push(checkstrings, "ddddddddccccccccgggggfghhhhgf");
                array_push(checkstrings, "aaaaonoabccccbabcd");
                array_push(checkstrings, "mebaem");
                array_push(checkstrings, "naebababebab");
                array_push(checkstrings, "nnfc");
                array_push(checkstrings, "aoamcdbaaoaebcdeeeeeacbnaaocdeeeeefghgfecaoamcdbaklji");
                array_push(checkstrings, "agaecdbaagaebcdeeeeeacbfaagcdeeeeefghgfecagaecdbacdba");
                for (var i = 0; i < array_length(checkstrings); i++)
                {
                    var checkstring = checkstrings[i];
                    if (string_pos(checkstring, endlessplaylog))
                    {
                        endlessplaylog = "";
                        obj_dw_church_organpuzzle.con = 1;
                        obj_dw_church_organpuzzle.playedfun = i + 1;
                        con = 999;
                    }
                }
            }
        }
    }
}
if (is_canceled)
{
    if (!i_ex(obj_cutscene_master))
    {
        is_canceled = false;
        con = 0;
        global.interact = 0;
        global.facing = 0;
        with (obj_mainchara)
            cutscene = 0;
    }
}
if (con == 1)
{
    obj_mainchara.fun = false;
    engaged = false;
    global.facing = 0;
    buffer = 4;
    con = 2;
}
if (con == 2)
{
    timer++;
    if (timer == 15)
    {
        con = 40;
        global.interact = 0;
        timer = 0;
        playlog[0] = 0;
        playindex = -1;
    }
}
if (con == 99)
{
    snd_play(snd_wing);
    engaged = false;
    baselight = 0;
    global.facing = 3;
    con = 51;
    customcon = 1;
    scr_flag_set(848, 1);
    if (scr_flag_get(847) == 0)
        scr_flag_set(848, 2);
}
var conthirtytrig = 0;
if (con == 30 && global.interact == 0 && !d_ex())
{
    if (scr_trigcheck("conthirtytrig"))
        conthirtytrig = 1;
}
if (conthirtytrig)
{
    con = 35;
    global.interact = 1;
    scr_speaker("susie");
    msgsetloc(0, "\\E2* Alright Kris^1, with this^1, we got it in the bag./%", "obj_dw_church_organ_slash_Step_0_gml_415_0");
    var d = d_make(undefined, undefined, undefined, 1);
    d.stay = 5;
}
if (con == 35 && !d_ex())
{
    con = 41;
    scr_keyitemget(30);
    snd_play(snd_item);
    scr_speaker("no_name");
    msgsetloc(0, "* (SheetMusic was added to your KEY ITEMS.)/%", "obj_dw_church_organ_slash_Step_0_gml_428_0");
    d_make();
}
if (con == 40 && global.interact == 0 && !d_ex())
{
    con = -1;
    global.interact = 1;
    if (scr_flag_get(847) == 0)
    {
        if (global.plot < 175)
        {
            global.plot = 175;
            con = 42;
            with (obj_caterpillarchara)
                facing[target] = 2;
            scr_speaker("susie");
            msgsetloc(0, "\\E0* ..^1. hm^1, we don't know the notes you've gotta play^1, right?/", "obj_dw_church_organ_slash_Step_0_gml_454_0");
            msgnextloc("\\E1* Maybe the answer's somewhere around here...?/%", "obj_dw_church_organ_slash_Step_0_gml_455_0");
            var d = d_make();
            d.runcheck = 1;
            d.preventcskip = 1;
            d.side = 0;
        }
        else
        {
            play_cancel();
        }
    }
    else if (global.plot < 185)
    {
        con = 50;
    }
    else
    {
        play_cancel();
    }
}
if (con == 41 && !d_ex())
{
    con = 0;
    global.interact = 0;
    global.facing = 0;
}
if (con == 42 && !d_ex())
{
    con = 0;
    play_cancel();
}
if (con == 50 && !d_ex() && customcon == 1)
{
    con = 51;
    customcon = 0;
    c_waitcustom_end();
    c_wait(30);
    c_msgside("top");
    c_speaker("susie");
    c_msgsetloc(0, "\\E0* .../", "obj_dw_church_organ_slash_Step_0_gml_532_0");
    c_facenext("ralsei", 26);
    c_msgnextloc("\\EQ* Umm^1, Kris^1, maybe I could give it a try? I think I.../", "obj_dw_church_organ_slash_Step_0_gml_534_0");
    c_facenext("susie", 1);
    c_msgnextloc("\\E1* Ralsei^1, wait a sec./%", "obj_dw_church_organ_slash_Step_0_gml_536_0");
    c_talk();
    c_wait_box(2);
    c_sel(ra);
    c_walk("u", 2, 6);
    c_wait_box(4);
    c_sel(su);
    c_facing("l");
    c_wait_talk();
    c_sel(ra);
    c_autowalk(0);
    c_imagespeed(0.2);
    c_walk("d", 2, 6);
    c_delaycmd(7, "imagespeed", 0);
    c_sel(su);
    c_facing("u");
    c_wait(30);
    c_speaker("susie");
    c_msgsetloc(0, "\\E0* Kris..^1. today in church^1, when you were asleep.../", "obj_dw_church_organ_slash_Step_0_gml_562_0");
    c_msgnextloc("\\ED* Your mom..^1. said you used to play good./", "obj_dw_church_organ_slash_Step_0_gml_563_0");
    c_msgnextloc("\\ED* I dunno why you're pretending you can't now./", "obj_dw_church_organ_slash_Step_0_gml_564_0");
    c_msgnextloc("\\ES* Maybe you're like..^1. embarrassed or something?/", "obj_dw_church_organ_slash_Step_0_gml_565_0");
    c_msgnextloc("\\ED* But like..^1. y'know.../%", "obj_dw_church_organ_slash_Step_0_gml_566_0");
    c_talk();
    c_wait_box(1);
    c_sel(su);
    c_facing("r");
    c_wait_box(2);
    c_sel(su);
    c_autowalk(0);
    c_sprite(spr_susie_head_scratch_dw);
    c_imagespeed(0.2);
    c_addxy(0, -6);
    c_wait_box(4);
    c_sel(su);
    c_halt();
    c_facing("u");
    c_addxy(0, 6);
    c_wait_talk();
    c_wait(30);
    c_speaker("susie");
    c_msgsetloc(0, "\\ED* .../", "obj_dw_church_organ_slash_Step_0_gml_591_0");
    c_msgnextloc("\\E2* Kris^1, you should play./%", "obj_dw_church_organ_slash_Step_0_gml_592_0");
    c_talk();
    c_wait_box(1);
    c_sel(su);
    c_autowalk(1);
    c_walk("u", 2, 6);
    c_wait_talk();
    c_wait(30);
    c_sel(su);
    c_autowalk(0);
    c_imagespeed(0.2);
    c_walk("d", 2, 6);
    c_delaycmd(7, "imagespeed", 0);
    c_sel(kr);
    c_facing("u");
    c_wait(60);
    c_autowalk(0);
    c_sprite(spr_kris_piano_sit);
    c_halt();
    c_snd_play(snd_wing);
    c_var_lerp("image_index", 0, 4, 20);
    c_wait_if(kr_actor, "image_index", ">=", 2);
    c_autodepth(0);
    c_depth(90000);
    c_wait(30);
    c_speaker("no_name");
    c_msgsetloc(0, "* (You thought about Susie's words and took a deep breath.)/%", "obj_dw_church_organ_slash_Step_0_gml_634_0");
    c_talk_wait();
    c_wait(15);
    c_var_lerp("image_index", 5, 9, 30);
    c_wait(45);
    c_speaker("no_name");
    c_msgsetloc(0, "* (Your hands began to move on their own...)/%", "obj_dw_church_organ_slash_Step_0_gml_644_0");
    c_talk_wait();
    c_wait(15);
    c_var_instance(id, "kris_play", true);
    c_wait(30);
    c_sel(kr);
    c_autowalk(0);
    c_sprite(spr_kris_piano_full);
    c_imageindex(524);
    c_wait_if(id, "kris_play", "=", false);
    c_waitcustom();
}
if (con == 51 && !d_ex() && customcon == 1)
{
    con = 55;
    customcon = 0;
    blackall = scr_dark_marker(-10, -100, spr_pixel_white);
    blackall.image_xscale = room_width;
    blackall.image_yscale = room_height;
    blackall.depth = 100;
    blackall.image_alpha = 0;
    blackall.image_blend = c_black;
    c_waitcustom_end();
    c_pannable(1);
    c_panspeed(0, -4, 120);
    c_mus2("volume", 0, 90);
    c_var_lerp_instance(blackall, "image_alpha", 0, 1, 60);
    c_customfunc(function()
    {
        with (obj_border_controller)
            hide_border(0.025);
    });
    c_wait(60);
    c_mus2("initloop", "pianpian.ogg", 0);
    c_wait(130);
    c_waitcustom();
}
if (con == 55 && customcon == 1)
{
    con = 60;
    global.tempflag[94] = 1;
    room_persistent = true;
    room_goto(room_dw_church_gersonstudy);
    exit;
}
if (con == 60 && customcon == 1 && !d_ex())
{
    con = 70;
    global.tempflag[94] = 0;
    if (scr_flag_get(847) == 3)
        con = 72;
    customcon = 0;
    room_persistent = false;
    c_waitcustom_end();
    c_pan(roomoffset, 0, 1);
    c_wait(1);
    c_waitcustom();
}
if (con == 70 && customcon == 1)
{
    con = 71;
    customcon = 0;
    c_waitcustom_end();
    c_wait(90);
    c_sel(kr);
    c_autodepth(1);
    c_autowalk(1);
    c_facing("u");
    c_wait(60);
    c_waitcustom();
}
if (con == 71 && customcon == 1)
    con = 72;
if (con == 72 && customcon == 1)
{
    con = 75;
    customcon = 0;
    c_waitcustom_end();
    c_customfunc(function()
    {
        with (obj_border_controller)
            show_border(1);
    });
    c_wait(1);
    c_mus("free_all");
    c_sound_play(snd_pianonoise);
    c_var_instance(blackall, "image_alpha", 0);
    c_wait(30);
    c_sel(su);
    c_autowalk(0);
    c_imagespeed(0.2);
    c_sprite(spr_susie_head_scratch_dw);
    c_addxy(0, -6);
    c_msgside("top");
    c_speaker("susie");
    c_msgsetloc(0, "\\E6* Hey^1, why'd you stop? That was cool./", "obj_dw_church_organ_slash_Step_0_gml_790_0");
    c_msgnextloc("\\EN* ..^1. You should^1, uh^1, play more./%", "obj_dw_church_organ_slash_Step_0_gml_791_0");
    c_talk();
    c_wait_box(1);
    c_sel(su);
    c_autowalk(1);
    c_facing("u");
    c_halt();
    c_addxy(0, 6);
    c_wait_talk();
    c_wait(30);
    c_sel(su);
    c_sprite(spr_susie_hand_up);
    c_addxy(0, -4);
    c_speaker("susie");
    c_msgsetloc(0, "\\EM* Seriously^1, you're an idiot if you quit playing./", "obj_dw_church_organ_slash_Step_0_gml_811_0");
    c_facenext("ralsei", 2);
    c_msgnextloc("\\E2* (..^1. Susie..^1. is nice^1, isn't she^1, Kris.)/%", "obj_dw_church_organ_slash_Step_0_gml_813_0");
    c_talk();
    c_wait_box(2);
    c_sel(su);
    c_autowalk(1);
    c_facing("u");
    c_halt();
    c_addxy(0, 4);
    c_sel(ra);
    c_sprite(spr_ralsei_turn_right_subtle);
    c_wait_talk();
    c_sel(ra);
    c_facing("u");
    c_wait(15);
    c_var_instance(id, "solved", true);
    c_waitcustom();
}
if (con == 72 && customcon == 1 && !d_ex())
{
    con = 75;
    customcon = 0;
    c_waitcustom_end();
    c_var_lerp_instance(blackall, "image_alpha", 1, 0, 30);
    c_wait(30);
    c_waitcustom();
}
if (con == 75 && customcon == 1 && !d_ex())
{
    con = 80;
    customcon = 0;
    c_waitcustom_end();
    c_sel(kr);
    c_walkdirect(kr_actor.x - 50, kr_actor.y, 12);
    c_delaywalkdirect(13, kr_actor.x - 50, kr_actor.y + 40, 12);
    c_delaywalkdirect(26, kr_actor.x, kr_actor.y + 40, 12);
    c_delayfacing(39, "d");
    c_wait(44);
    c_var_instance(id, "set_party", true);
    c_mus("free_all");
    c_mus2("initloop", "bell_ambience.ogg", 0);
    c_mus2("volume", 0, 0);
    c_mus2("volume", 1, 120);
    c_panobj(kr_actor, 30);
    c_wait(31);
    c_pannable(0);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 80 && !i_ex(obj_cutscene_master))
{
    con = 0;
    global.interact = 0;
    global.facing = 0;
    global.plot = 185;
    event_user(1);
    doalpha = 0;
    realpha = 0;
    mialpha = 0;
    faalpha = 0;
    soalpha = 0;
    laalpha = 0;
    tialpha = 0;
    doaalpha = 0;
    playalpha = 0;
    pitchalpha = 0;
    playlog = [];
    playlog[0] = 0;
    playindex = -1;
    timer = 0;
    buffer = 0;
    soundtoplay = 0;
    with (obj_caterpillarchara)
    {
        follow = 1;
        fun = 0;
        scr_caterpillar_interpolate();
    }
    global.currentroom = room;
    scr_tempsave();
}
if (con == 1000 && !button3_h())
    con = 1001;
if (con == 1001 && !d_ex())
{
    play_cancel();
    con = 0;
}
if (set_party)
{
    set_party = false;
    scr_setparty(1, 1, 0);
    var sus_x = su_actor.x;
    var sus_y = su_actor.y;
    var ral_x = ra_actor.x;
    var ral_y = ra_actor.y;
    with (obj_caterpillarchara)
    {
        follow = 0;
        fun = 1;
        if (name == "susie")
        {
            x = sus_x;
            y = sus_y;
        }
        else
        {
            x = ral_x;
            y = ral_y;
        }
        visible = 1;
        sprite_index = usprite;
    }
}
if (kris_play)
{
    if (piano_player == -4)
    {
        piano_player = instance_create(kr_actor.x, kr_actor.y, obj_ch4_DCA09_piano);
        kr_actor.visible = 0;
    }
    else if (piano_player.piano_finish)
    {
        kris_play = false;
        with (piano_player)
        {
            with (kris_marker)
                instance_destroy();
            instance_destroy();
        }
        kr_actor.visible = 1;
    }
    else
    {
    }
}
if (scr_debug())
{
    if (keyboard_check_pressed(vk_backspace))
        endlessplaylog = "";
    if (keyboard_check_pressed(ord("O")))
        clipboard_set_text(endlessplaylog);
    if (keyboard_check(vk_up))
    {
        if (keyboard_check_pressed(ord("H")))
        {
            var inp = "";
            var answer = "";
            var hint = get_string("Insert String, Receive Combo", "");
            debug_print("stringLength=" + string(string_length(hint)));
            for (var i = 1; i < (string_length(hint) + 1); i++)
            {
                var curcode = string_char_at(hint, i);
                var newcode = "";
                switch (curcode)
                {
                    case "a":
                        newcode = "⚪";
                        break;
                    case "i":
                        newcode = "ⓞ";
                        break;
                    case "b":
                        newcode = "→";
                        break;
                    case "j":
                        newcode = "⇨";
                        break;
                    case "c":
                        newcode = "↘";
                        break;
                    case "k":
                        newcode = "⇘";
                        break;
                    case "d":
                        newcode = "↓";
                        break;
                    case "l":
                        newcode = "⇩";
                        break;
                    case "e":
                        newcode = "↙";
                        break;
                    case "m":
                        newcode = "⇙";
                        break;
                    case "f":
                        newcode = "←";
                        break;
                    case "n":
                        newcode = "⇦";
                        break;
                    case "g":
                        newcode = "↖";
                        break;
                    case "o":
                        newcode = "⇖";
                        break;
                    case "h":
                        newcode = "↑";
                        break;
                    default:
                        newcode = "invalid answer: " + string_char_at(hint, i) + ",";
                        break;
                }
                inp = inp + newcode;
            }
            debug_message(inp);
            clipboard_set_text(hint + "=" + inp);
        }
    }
}
