if (maus_action == 0 && !console_version)
{
    if (obj_mainchara.y < 364)
        maus_action = 1;
}
if (console_version)
{
    with (obj_mike_controller)
        __usable = i_ex(obj_mike_minigame_controller);
}
if (maus_action == 1)
{
    cutscene_master = scr_cutscene_make();
    c_var_instance(id, "maus_transform", true);
    c_wait_if(id, "maus_transform", "=", false);
    c_customfunc(function()
    {
        mike_controller = instance_create(0, 0, obj_mike_controller);
        mike_controller.hand_wait = 15;
        with (obj_mike_hand)
        {
            visible = 0;
            hand_wait = 15;
        }
    });
    c_wait(5);
    c_customfunc(function()
    {
        var hand_x = 0;
        var hand_y = 0;
        var angle = 0;
        with (obj_mike_controller)
        {
            angle = point_direction(mx, my, x, y) + 90 + hand_angle;
            hand_x = mx + msx;
            hand_y = my + msy;
        }
        with (hand_marker)
        {
            scr_move_to_point_over_time(hand_x, hand_y, 10);
            scr_lerpvar("image_angle", 0, angle, 10);
        }
    });
    c_wait(10);
    c_customfunc(function()
    {
        with (obj_mike_hand)
            visible = 1;
        with (hand_marker)
            visible = 0;
    });
    c_terminatekillactors();
    maus_action = 2;
}
if (maus_transform)
{
    maus_transform_timer++;
    if (maus_transform_timer == 1)
    {
        maus_flash = instance_create(maus_marker.x, maus_marker.y, obj_whiteout);
        var _target = maus_marker;
        with (maus_flash)
            start_whiteout(4, _target, true);
        hand_marker = scr_marker(maus_marker.x, maus_marker.y, spr_mike_hand);
        with (hand_marker)
        {
            image_xscale = 0;
            image_yscale = 0;
        }
        hand_flash = instance_create(hand_marker.x, hand_marker.y, obj_whiteout);
        _target = hand_marker;
        with (hand_flash)
            start_whiteout(4, _target, true);
    }
    if (maus_transform_timer == 6)
    {
        snd_play(snd_hypnosis);
        scr_lerp_var_instance(hand_marker, "image_xscale", 0, 0.5, 4);
        scr_lerp_var_instance(hand_marker, "image_yscale", 0, 0.5, 4);
        scr_lerp_var_instance(maus_marker, "image_xscale", 2, 0, 4);
        scr_lerp_var_instance(maus_marker, "image_yscale", 2, 0, 4);
    }
    if (maus_transform_timer == 11)
    {
        with (hand_flash)
            stop_whiteout(4);
        with (maus_flash)
            stop_whiteout(4);
    }
    if (maus_transform_timer == 15)
    {
        maus_transform = false;
        maus_transform_timer = 0;
    }
}
if (instance_number(obj_mike_minigame_controller) > 0)
{
    var minigame_end = false;
    with (obj_mike_minigame_controller)
    {
        if (finished)
        {
            minigame_end = true;
            scr_endcombat();
        }
    }
    if (minigame_end)
    {
        with (obj_mike_minigame_controller)
            instance_destroy();
        with (obj_mike_controller)
            reset_control();
        with (obj_mike_battle)
            instance_destroy();
        with (obj_mike_slot)
            act = 0;
        con = 101;
        global.interact = 1;
        timer = 0;
    }
}
if (con < 0)
    exit;
if (con == 1)
{
    if (console_version)
    {
        obj_mike_minigame_tv.minigame = 1;
        obj_mike_minigame_tv.lastmike = 1;
    }
    con = 1.1;
    global.interact = 1;
    global.msc = -99;
    global.choice = -1;
    global.choicemsg[0] = stringsetloc("#Why", "obj_room_castle_tv_zone_minigame_slash_Step_0_gml_134_0");
    global.choicemsg[1] = stringsetloc("#Nothing", "obj_room_castle_tv_zone_minigame_slash_Step_0_gml_135_0");
    global.choicemsg[2] = stringsetloc("Instructions", "obj_room_castle_tv_zone_minigame_slash_Step_0_gml_136_0");
    global.choicemsg[3] = stringsetloc("Who's Mike", "obj_room_castle_tv_zone_minigame_slash_Step_0_gml_137_0");
    scr_speaker("no_name");
    msgsetloc(0, "* Mi-hi-hi-hi-hyike! What's up!? It's me, the REAL Mike!/", "obj_room_castle_tv_zone_minigame_slash_Step_0_gml_149_0");
    msgnext("\\C4 ");
    d_make();
}
if (con == 1.1 && global.choice != -1)
{
    k_d(1);
    var _i = 0;
    con = 100;
    scr_speaker("no_name");
    if (global.choice == 0)
    {
        global.msg[_i] = stringsetloc("* A few minutes outta this room... and we all decided we couldn't take it!!/", "obj_room_castle_tv_zone_minigame_slash_Step_0_gml_151_0");
        _i++;
        global.msg[_i] = stringsetloc("* There CAN'T be no MIKE!! And there CAN'T be more than ONE Mike!!/", "obj_room_castle_tv_zone_minigame_slash_Step_0_gml_152_0");
        _i++;
        global.msg[_i] = stringsetloc("* So which one of us the REAL one!?/", "obj_room_castle_tv_zone_minigame_slash_Step_0_gml_153_0");
        _i++;
        global.msg[_i] = stringsetloc("* ... that's where YOU come in, see?/", "obj_room_castle_tv_zone_minigame_slash_Step_0_gml_154_0");
        _i++;
        global.msg[_i] = stringsetloc("* See, the REAL Mike would be the STRONGEST, right!?/", "obj_room_castle_tv_zone_minigame_slash_Step_0_gml_155_0");
        _i++;
        global.msg[_i] = stringsetloc("* So each of us is ready to fight you again... MINI-GAME STYLE!/", "obj_room_castle_tv_zone_minigame_slash_Step_0_gml_156_0");
        _i++;
        global.msg[_i] = stringsetloc("* The one who you get the most points against, has got to be the REAL MIKE!/%", "obj_room_castle_tv_zone_minigame_slash_Step_0_gml_157_0");
        _i++;
    }
    else if (global.choice == 1)
    {
        global.msg[_i] = stringsetloc("* Tenna always said \"Mike acted different\" after the other guy left./", "obj_room_castle_tv_zone_minigame_slash_Step_0_gml_160_0");
        _i++;
        global.msg[_i] = stringsetloc("* WHAT other guy!?^2 WHAT different!?/%", "obj_room_castle_tv_zone_minigame_slash_Step_0_gml_161_0");
        _i++;
    }
    else if (global.choice == 2)
    {
        if (console_version)
        {
            global.msg[_i] = stringsetloc("* Talk to the MAUS in the center to play! Here's the games.../", "obj_room_castle_tv_zone_minigame_slash_Step_0_gml_176_0");
            _i++;
        }
        else
        {
            global.msg[_i] = stringsetloc("* Pick us up with MAUS and put us in the center to play! Here's the games.../", "obj_room_castle_tv_zone_minigame_slash_Step_0_gml_164_0");
            _i++;
        }
        if (os_type == os_psvita)
        {
            global.msg[_i] = stringsetloc("* SMALL MIKE - Pluey - Bring the cat to the basket, and don't touch the rain!/", "obj_room_castle_tv_zone_minigame_slash_Step_0_gml_165_0");
            _i++;
            global.msg[_i] = stringsetloc("* COWBOY HAT MIKE -  Air Waves - Block the fuzzballs as long as possible!/", "obj_room_castle_tv_zone_minigame_slash_Step_0_gml_166_0");
            _i++;
            global.msg[_i] = stringsetloc("* CAT MIKE - Main Performance - Match the poses in time! CLICK to extend arms!/%", "obj_room_castle_tv_zone_minigame_slash_Step_0_gml_167_0");
            _i++;
        }
        else
        {
            global.msg[_i] = stringsetloc("* SMALL MIKE - BATTAT - Use MAUS to avoid dangerous BATTAT^1. VOL to SPEED UP!/", "obj_room_castle_tv_zone_minigame_slash_Step_0_gml_173_0");
            _i++;
            global.msg[_i] = stringsetloc("* COWBOY HAT MIKE - JONGLER - Use VOL and MAUS to JONGLE falling toys into the hoop!/", "obj_room_castle_tv_zone_minigame_slash_Step_0_gml_174_0");
            _i++;
            global.msg[_i] = stringsetloc("* CAT MIKE - PLUEY - Avoid rain^1! Click + Hold with MAUS to bring CATs to the BASKET!/%", "obj_room_castle_tv_zone_minigame_slash_Step_0_gml_175_0");
            _i++;
        }
    }
    else if (global.choice == 3)
    {
        var _max_index = 0;
        var _max_value = obj_mike_minigame_tv.hiscore[0];
        var _tie = false;
        for (var _ii = 1; _ii < 4; _ii++)
        {
            if (obj_mike_minigame_tv.hiscore[_ii] > _max_value)
            {
                _max_value = obj_mike_minigame_tv.hiscore[_ii];
                _max_index = _ii;
                _tie = false;
            }
            else if (obj_mike_minigame_tv.hiscore[_ii] == _max_value)
            {
                _tie = true;
            }
        }
        if (_tie)
        {
            global.msg[_i] = stringsetloc("* Who KNOWS!? It's a TIE! Hurry up and get a HIGH SCORE, kid!/%", "obj_room_castle_tv_zone_minigame_slash_Step_0_gml_187_0");
            _i++;
        }
        else
        {
            switch (_max_index)
            {
                case 1:
                    var _rand = [stringsetloc("give Tenna an antenna massage", "obj_room_castle_tv_zone_minigame_slash_Step_0_gml_193_0"), stringsetloc("have Tenna's shock therapy", "obj_room_castle_tv_zone_minigame_slash_Step_0_gml_194_0"), stringsetloc("sing rock-a-bye biiby to Tenna's cupboard", "obj_room_castle_tv_zone_minigame_slash_Step_0_gml_195_0"), stringsetloc("organize Tenna's nose drawer", "obj_room_castle_tv_zone_minigame_slash_Step_0_gml_196_0")];
                    var _choice = irandom(3);
                    while (_choice == last_num)
                        _choice = irandom(3);
                    last_num = _choice;
                    global.msg[_i] = stringsetloc("* Haha! It's ME, SMALL MIKE!!! I'm the REAL Mike!! Finally!!!/", "obj_room_castle_tv_zone_minigame_slash_Step_0_gml_206_0");
                    _i++;
                    global.msg[_i] = stringsetsubloc("* Now I'll get to ~1 all by myself.../", string(_rand[_choice]), "obj_room_castle_tv_zone_minigame_slash_Step_0_gml_207_0");
                    _i++;
                    global.msg[_i] = stringsetloc("* W-wait! That's not what I WANT!! Let somebody ELSE win!!/%", "obj_room_castle_tv_zone_minigame_slash_Step_0_gml_208_0");
                    _i++;
                    break;
                case 2:
                    global.msg[_i] = stringsetloc("* What!? COWBOY HAT MIKE has the highest score!?/", "obj_room_castle_tv_zone_minigame_slash_Step_0_gml_212_0");
                    _i++;
                    global.msg[_i] = stringsetloc("* What's wrong with you, making people think Mike is a cowboy!?/", "obj_room_castle_tv_zone_minigame_slash_Step_0_gml_213_0");
                    _i++;
                    global.msg[_i] = stringsetloc("* I'll make you pay!! I've got connections!! I've got friends on the inside!!/", "obj_room_castle_tv_zone_minigame_slash_Step_0_gml_214_0");
                    _i++;
                    global.msg[_i] = stringsetloc("* ... though, that friend is, just that cowboy guy over there./%", "obj_room_castle_tv_zone_minigame_slash_Step_0_gml_215_0");
                    _i++;
                    break;
                case 3:
                    global.msg[_i] = stringsetloc("* What!? CAT MIKE has the highest score!?/", "obj_room_castle_tv_zone_minigame_slash_Step_0_gml_219_0");
                    _i++;
                    global.msg[_i] = stringsetloc("* What's wrong with you, making people think MIKE is a CAT!?/", "obj_room_castle_tv_zone_minigame_slash_Step_0_gml_220_0");
                    _i++;
                    global.msg[_i] = stringsetloc("* I swear, you people see PINK and YELLOW and think, oh, a FRIEND!!/", "obj_room_castle_tv_zone_minigame_slash_Step_0_gml_221_0");
                    _i++;
                    global.msg[_i] = stringsetloc("* Being a friend doesn't make you them YOURS! Those teeth, they BITE!/%", "obj_room_castle_tv_zone_minigame_slash_Step_0_gml_222_0");
                    _i++;
                    break;
            }
        }
    }
    d_make();
}
if (con == 2 && !d_ex() && global.interact == 0)
{
    if (console_version)
    {
        obj_mike_minigame_tv.minigame = 2;
        obj_mike_minigame_tv.lastmike = 2;
    }
    con = 100;
    global.interact = 1;
    var _max_index = 0;
    var _max_value = obj_mike_minigame_tv.hiscore[0];
    var _tie = false;
    for (var _ii = 1; _ii < 4; _ii++)
    {
        if (obj_mike_minigame_tv.hiscore[_ii] > _max_value)
        {
            _max_value = obj_mike_minigame_tv.hiscore[_ii];
            _max_index = _ii;
            _tie = false;
        }
        else if (obj_mike_minigame_tv.hiscore[_ii] == _max_value)
        {
            _tie = true;
        }
    }
    scr_speaker("no_name");
    if (!_tie && obj_mike_minigame_tv.hiscore[2] == _max_value)
    {
        msgsetloc(0, "* Hey, boss.^3 I got the highest scores./", "obj_room_castle_tv_zone_minigame_slash_Step_0_gml_162_0");
        msgnextloc("* Does dat mean I can finally say whatever lines I wanna say?/%", "obj_room_castle_tv_zone_minigame_slash_Step_0_gml_263_0");
    }
    else
    {
        msgsetloc(0, "* Hey, boss.^3 Talk to the little guys.^3 I dunno what's up./%", "obj_room_castle_tv_zone_minigame_slash_Step_0_gml_265_0");
    }
    d_make();
}
if (con == 3 && !d_ex() && global.interact == 0)
{
    if (console_version)
    {
        obj_mike_minigame_tv.minigame = 3;
        obj_mike_minigame_tv.lastmike = 3;
    }
    con = 100;
    global.interact = 1;
    var _max_index = 0;
    var _max_value = obj_mike_minigame_tv.hiscore[0];
    var _tie = false;
    for (var _ii = 1; _ii < 4; _ii++)
    {
        if (obj_mike_minigame_tv.hiscore[_ii] > _max_value)
        {
            _max_value = obj_mike_minigame_tv.hiscore[_ii];
            _max_index = _ii;
            _tie = false;
        }
        else if (obj_mike_minigame_tv.hiscore[_ii] == _max_value)
        {
            _tie = true;
        }
    }
    scr_speaker("no_name");
    if (!_tie && obj_mike_minigame_tv.hiscore[3] == _max_value)
        msgsetloc(0, "* (With the highest score, maybe the real Mike?)/%", "obj_room_castle_tv_zone_minigame_slash_Step_0_gml_295_0");
    else
        msgsetloc(0, "* (Just dancing.)/%", "obj_room_castle_tv_zone_minigame_slash_Step_0_gml_297_0");
    d_make();
}
if (con == 4 && !d_ex() && global.interact == 0)
{
    con = 4.1;
    global.interact = 1;
    global.msc = -99;
    global.choice = -1;
    global.choicemsg[0] = stringsetloc("#BATTAT", "obj_room_castle_tv_zone_minigame_slash_Step_0_gml_342_0");
    global.choicemsg[1] = stringsetloc("#PLUEY", "obj_room_castle_tv_zone_minigame_slash_Step_0_gml_343_0");
    global.choicemsg[2] = stringsetloc("JONGLER", "obj_room_castle_tv_zone_minigame_slash_Step_0_gml_344_0");
    global.choicemsg[3] = stringsetloc("No.", "obj_room_castle_tv_zone_minigame_slash_Step_0_gml_345_0");
    scr_speaker("no_name");
    msgsetloc(0, "* (The MAUS is ready to play!)/", "obj_room_castle_tv_zone_minigame_slash_Step_0_gml_347_0");
    msgnextloc("* (Play a MIKE MINIGAME?)/", "obj_room_castle_tv_zone_minigame_slash_Step_0_gml_348_0");
    msgnext("\\C4 ");
    var _d = d_make();
    _d.side = 1;
}
if (con == 4.1 && i_ex(obj_choicer_neo))
{
    if (obj_choicer_neo.mychoice == 0)
    {
        obj_mike_minigame_tv.minigame = 1;
        obj_mike_minigame_tv.lastmike = 1;
    }
    if (obj_choicer_neo.mychoice == 1)
    {
        obj_mike_minigame_tv.minigame = 3;
        obj_mike_minigame_tv.lastmike = 3;
    }
    if (obj_choicer_neo.mychoice == 2)
    {
        obj_mike_minigame_tv.minigame = 2;
        obj_mike_minigame_tv.lastmike = 2;
    }
}
if (con == 4.1 && global.choice != -1)
{
    k_d(1);
    var _i = 0;
    con = -1;
    global.interact = 0;
    if (global.choice == 3)
    {
    }
    else
    {
        global.flag[9] = 2;
        if (global.choice == 0)
        {
            global.batmusic[0] = snd_init("spamton_dance.ogg");
            obj_mike_minigame_tv.minigame = 1;
            obj_mike_minigame_tv.lastmike = 1;
        }
        else if (global.choice == 1)
        {
            global.batmusic[0] = snd_init("muffled_rain.ogg");
            obj_mike_minigame_tv.minigame = 3;
            obj_mike_minigame_tv.lastmike = 3;
        }
        else if (global.choice == 2)
        {
            global.batmusic[0] = snd_init("mike.ogg");
            obj_mike_minigame_tv.minigame = 2;
            obj_mike_minigame_tv.lastmike = 2;
        }
        instance_create_depth(0, 0, 1000, obj_mike_minigame_bg);
        instance_create_depth(0, 0, 0, obj_mike_minigame_start);
        snd_volume(global.currentsong[1], 0, 20);
        with (obj_mike_controller)
            hand_type = 0;
    }
}
if (con == 5 && !d_ex() && global.interact == 0)
{
    con = 5.1;
    global.interact = 1;
    global.msc = -99;
    global.choice = -1;
    global.choicemsg[0] = stringsetloc("Explode#and#reset#scores", "obj_room_castle_tv_zone_minigame_slash_Step_0_gml_416_0");
    global.choicemsg[1] = stringsetloc("#Don't", "obj_room_castle_tv_zone_minigame_slash_Step_0_gml_417_0");
    global.choicemsg[2] = "";
    global.choicemsg[3] = "";
    scr_speaker("no_name");
    msgsetloc(0, "* (It's the MichaelBomb.)/", "obj_room_castle_tv_zone_minigame_slash_Step_0_gml_421_0");
    msgnextloc("* (It resets the High Score of all Michaels to 0.)/", "obj_room_castle_tv_zone_minigame_slash_Step_0_gml_422_0");
    msgnext("\\C2 ");
    var _d = d_make();
    _d.side = 0;
}
if (con == 5.1 && global.choice != -1)
{
    k_d(1);
    bomb_marker.image_speed = 0.25;
    var _i = 0;
    con = -1;
    global.interact = 0;
    if (global.choice == 1)
    {
        global.interact = 1;
        msgsetloc(0, "* (Resisted the temptation of Michael.)/%", "obj_room_castle_tv_zone_minigame_slash_Step_0_gml_436_0");
        var _d = d_make();
        _d.side = 0;
        con = 5.5;
    }
    else
    {
        con = 5.2;
        global.interact = 1;
        global.msc = -99;
        global.choice = -1;
        global.choicemsg[0] = stringsetloc("#I'm#serious", "obj_room_castle_tv_zone_minigame_slash_Step_0_gml_446_0");
        global.choicemsg[1] = stringsetloc("#Don't#do it", "obj_room_castle_tv_zone_minigame_slash_Step_0_gml_447_0");
        global.choicemsg[2] = "";
        global.choicemsg[3] = "";
        scr_speaker("no_name");
        msgsetloc(0, "* (You hesitated.)/", "obj_room_castle_tv_zone_minigame_slash_Step_0_gml_451_0");
        msgnextloc("* (MichaelBomb will really set all High Scores to 0!)/", "obj_room_castle_tv_zone_minigame_slash_Step_0_gml_452_0");
        msgnext("\\C2 ");
        var _d = d_make();
        _d.side = 0;
    }
}
if (con == 5.2 && global.choice != -1)
{
    k_d(1);
    var _i = 0;
    con = -1;
    global.interact = 0;
    if (global.choice == 1)
    {
        global.interact = 1;
        msgsetloc(0, "* (Resisted the temptation of Michael.)/%", "obj_room_castle_tv_zone_minigame_slash_Step_0_gml_466_0");
        var _d = d_make();
        _d.side = 0;
        con = 5.5;
    }
    else
    {
        con = 5.3;
        global.interact = 1;
        msgsetloc(0, "* (You pressed in the letters&M I C H A E L !)/%", "obj_room_castle_tv_zone_minigame_slash_Step_0_gml_474_0");
        var _d = d_make();
        _d.side = 0;
    }
}
if (con == 5.3 && !i_ex(obj_dialoguer))
{
    k_d(1);
    var _i = 0;
    con = 5.4;
    global.interact = 1;
    snd_pause(global.currentsong[1]);
    scr_fadeout(1);
    timer = 0;
}
if (con == 5.4)
{
    timer++;
    var bombdelay = 60;
    var resetdelay = 60;
    if (timer == bombdelay)
    {
        var expl = instance_create(camerax() + 320, cameray() + 240, obj_animation);
        with (expl)
        {
            image_xscale = 0.5;
            image_yscale = 0.5;
            sprite_index = spr_realisticexplosion;
        }
        snd_play(snd_explosion_firework_bc);
    }
    if (timer == (bombdelay + resetdelay))
    {
        snd_play(snd_mike_reset);
        reset_blend = 1;
        with (obj_mike_minigame_tv)
        {
            latestscore[1] = 0;
            latestscore[2] = 0;
            latestscore[3] = 0;
            global.flag[1698] = 0;
            global.flag[1699] = 0;
            global.flag[1700] = 0;
            hiscore[1] = global.flag[1698];
            hiscore[2] = global.flag[1699];
            hiscore[3] = global.flag[1700];
        }
    }
    if (timer == (bombdelay + resetdelay + 150))
    {
        reset_blend = 0;
        bomb_marker.image_speed = 0.1;
        snd_volume(global.currentsong[1], 0, 0);
        with (obj_fadeout)
            instance_destroy();
        scr_fadein(30);
    }
    if (timer == (bombdelay + resetdelay + 180))
    {
        snd_resume(global.currentsong[1]);
        snd_volume(global.currentsong[1], 1, 30);
        timer = 0;
        con = -1;
        global.interact = 0;
    }
}
if (con == 5.5 && !i_ex(obj_dialoguer))
{
    global.interact = 0;
    bomb_marker.image_speed = 0.1;
    con = -1;
}
if (con == 100 && !d_ex())
{
    con = -1;
    global.interact = 0;
}
if (con == 101)
{
    global.interact = 1;
    timer++;
    if (timer >= 15)
    {
        global.interact = 0;
        con = -1;
    }
}
