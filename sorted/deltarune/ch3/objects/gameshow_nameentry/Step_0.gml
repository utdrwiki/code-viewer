var controller_connected = global.is_console || obj_gamecontroller.gamepad_active;
if (!controller_connected && controller_active)
{
    controls_init = true;
    controller_active = false;
}
if (controller_connected && !controller_active)
{
    controls_init = true;
    controller_active = true;
}
if (controls_init)
{
    controls_init = false;
    strbut1 = scr_get_input_name(4);
    strbut2 = scr_get_input_name(5);
    strdown = scr_get_input_name(0);
    strup = scr_get_input_name(2);
}
if (init == 0)
{
    scr_lerpvar("tutprog", 1, 0, 20, 4, "out");
    init = 1;
}
if (tenna == 0)
{
    with (obj_actor_tenna)
        other.tenna = id;
}
if (susie == 0)
{
    with (obj_actor)
    {
        if (name == "susie")
        {
            other.susie = id;
            other.susmemsprite = sprite_index;
            sprite_index = spr_susie_quiz_down;
            auto_walk = 0;
        }
    }
}
if (ralsei == 0)
{
    with (obj_actor)
    {
        if (name == "ralsei")
        {
            other.ralsei = id;
            other.ralmemsprite = sprite_index;
            sprite_index = spr_ralsei_quiz_down;
            auto_walk = 0;
        }
    }
}
if (kris == 0)
{
    with (obj_actor)
    {
        if (name == "kris")
        {
            other.kris = id;
            other.krismemsprite = sprite_index;
            sprite_index = spr_kris_quiz_down;
            auto_walk = 0;
        }
    }
}
ibuff--;
if (con == 0 || con == 1 || con == 2)
{
    if (down_h() || up_h() || button1_h())
        kris.image_index = 1;
    else
        kris.image_index = 0;
    if (down_h())
    {
        dholdbuff++;
        presscount = 1;
    }
    else
    {
        dholdbuff = -1;
    }
    if (up_h())
    {
        uholdbuff++;
        presscount = 1;
    }
    else
    {
        uholdbuff = -1;
    }
    if (up_h() && down_h())
    {
        dholdbuff = -1;
        uholdbuff = -1;
    }
    buffmodrate = 5;
    if ((uholdbuff % buffmodrate) == 0)
    {
        snd_play_pitch(snd_menumove, 0.9);
        letter[con]--;
        if (con == 2)
        {
            var nextletter = scr_nameentrybadcheck();
            if (nextletter)
                letter[con]--;
        }
    }
    else if ((dholdbuff % buffmodrate) == 0)
    {
        snd_play_pitch(snd_menumove, 1);
        letter[con]++;
        if (con == 2)
        {
            var nextletter = scr_nameentrybadcheck();
            if (nextletter)
                letter[con]++;
        }
    }
    if (letter[con] > maxletter)
        letter[con] = 0;
    if (letter[con] < 0)
        letter[con] = maxletter;
    if (global.lang == "ja")
        letter[1] = scr_ja_alphanumericarray_check("ソ");
    if (ibuff <= 0)
    {
        if (button1_p())
        {
            snd_play_pitch(snd_menumove, 1.2);
            ibuff = 3;
            con++;
            if (con == 1 && global.lang == "ja")
                con = 2;
            if (con == 2)
            {
                var nextletter = scr_nameentrybadcheck();
                if (nextletter)
                    letter[2] = letter[1];
            }
        }
        if (button2_p())
        {
            ibuff = 3;
            if (con > 0)
            {
                snd_play_pitch(snd_menumove, 0.8);
                con--;
                if (con == 1 && global.lang == "ja")
                    con = 0;
            }
        }
    }
}
if (con == 3)
{
    timer = 0;
    con = 4;
    global.flag[1012] = letter[0];
    global.flag[1013] = letter[1];
    global.flag[1014] = letter[2];
    debug_message("scr_gameshowname()=" + scr_gameshowname());
    var lang = 0;
    if (global.lang == "ja")
        lang = 1;
    var isbadword = false;
    if (scr_gameshowname() == "PEE" || scr_gameshowname() == "POO" || scr_gameshowname() == "ウソチ")
    {
        debug_print("bad word!");
        isbadword = true;
    }
    if (isbadword)
    {
        if (badwordcon == 0)
        {
            con = 0;
            badwordcon = 1;
            global.flag[1012] = 0;
            global.flag[1013] = 0;
            global.flag[1014] = 0;
            letter[0] = 0;
            letter[1] = 0;
            letter[2] = 0;
        }
        else
        {
            scr_shakeobj(id, 10);
            scr_shakeobj(mydad, 10);
            snd_play(snd_error);
            letter[0] = 1;
            letter[1] = 0;
            letter[2] = 3;
            global.flag[1012] = 1;
            global.flag[1013] = 0;
            global.flag[1014] = 3;
            if (global.lang == "ja")
            {
                letter[0] = scr_ja_alphanumericarray_check("ダ");
                letter[1] = scr_ja_alphanumericarray_check("メ");
                letter[2] = scr_ja_alphanumericarray_check("ヨ");
                global.flag[1012] = letter[0];
                global.flag[1013] = letter[1];
                global.flag[1014] = letter[2];
            }
        }
    }
}
var talklength;
if (con < 4)
{
    var tenposx = 340;
    var tenposy = 98;
    var tentailx = 444;
    var tentaily = 115;
    tennatalktimer++;
    talklength = 110;
    if (tennatalktimer == 30)
    {
        if (i_ex(tenna))
            tenna.bounce = 1;
        var tetalk = stringsetloc("Sorry, you've#only got 3 letters#to work with!!", "obj_gameshow_nameentry_slash_Step_0_gml_175_0");
        scr_tennabubble_xytail(tetalk, tenposx, tenposy, tentailx, tentaily, talklength);
    }
    if (tennatalktimer == (30 + talklength + 20))
    {
        if (i_ex(tenna))
            tenna.bounce = 1;
        var tetalk = stringsetloc("I'd give you 4,#but the censors#would kill me!", "obj_gameshow_nameentry_slash_Step_0_gml_181_0");
        scr_tennabubble_xytail(tetalk, tenposx, tenposy, tentailx, tentaily, talklength);
    }
    if (tennatalktimer == (30 + talklength + 20 + talklength + 150) && presscount == 0)
    {
        if (i_ex(tenna))
            tenna.bounce = 1;
        var tetalk = stringsetloc("Hey! You can#select your name#using the buttons#on your podium,#ya know!", "obj_gameshow_nameentry_slash_Step_0_gml_188_0");
        scr_tennabubble_xytail(tetalk, tenposx, tenposy, tentailx, tentaily, talklength);
    }
    if (tennatalktimer == (30 + talklength + 20 + talklength + 150 + talklength + 300) && con == 0)
    {
        if (i_ex(tenna))
            tenna.bounce = 1;
        var tetalk = stringsetloc("We aren't even#to the quiz first#question yet, folks!", "obj_gameshow_nameentry_slash_Step_0_gml_194_0");
        scr_tennabubble_xytail(tetalk, tenposx, tenposy, tentailx, tentaily, talklength);
        snd_play_delay(snd_laughtrack_short_temp, 15);
    }
}
if (con == 4)
{
    timer++;
    if (timer == 1)
    {
        kris.sprite_index = krismemsprite;
        kris.image_index = 0;
        scr_lerpvar("tutprog", 0, 1, 20, 4, "in");
    }
    if (timer == 15)
    {
        snd_play(snd_bell);
        mycolor = c_yellow;
    }
    if (timer == 25 && susdone == 0)
        susdone = 1;
    if (timer == 40 && raldone == 0)
        raldone = 1;
    if (timer == 60)
    {
        visible = false;
        mydad.mystring = "???";
        with (obj_tennatalkbubble)
            instance_destroy();
        instance_destroy();
    }
}
if (badwordcon == 1)
{
    badwordtimer++;
    if (badwordtimer == 1)
    {
        snd_play(snd_error);
        scr_shakeobj(id, 10);
        scr_shakeobj(mydad, 10);
    }
    if (badwordtimer == 15)
    {
        var tenposx = 240;
        var tenposy = 98;
        var tentailx = 384;
        var tentaily = 115;
        tenna.bounce = 1;
        var tetalk = stringsetloc("Uh oh, a no no word!#Good thing our parental#controls are installed!", "obj_gameshow_nameentry_slash_Step_0_gml_258_0");
        scr_tennabubble_xytail(tetalk, tenposx, tenposy, tentailx, tentaily, talklength);
        if (susdone == 0)
            susie.sprite_index = spr_susie_quiz_lookleft;
    }
}
if (raldone == 0)
{
    ralsei.sprite_index = spr_ralsei_quiz_down;
    ralentrytimer++;
    if (ralentrytimer > 10)
        ralsei.image_index = 0;
    if (ralentrytimer >= ralreset)
    {
        snd_play_x(snd_menumove, 0.5, choose(0.9, 1));
        ralsei.image_index = 1;
        ralentrytimer = 0;
        ralreset = irandom(30) + 20;
    }
}
if (susdone == 0)
{
    susentrytimer++;
    if (susentrytimer > 10)
        susie.image_index = 0;
    if (susentrytimer >= susreset)
    {
        snd_play_x(snd_menumove, 0.5, choose(0.9, 1));
        susie.image_index = 1;
        susentrytimer = 0;
        susreset = irandom(30) + 20;
        if (susie.sprite_index == spr_susie_quiz_lookleft)
        {
            var resetlook = choose(0, 0, 0, 1);
            if (resetlook == 1)
                susie.sprite_index = spr_susie_quiz_down;
        }
    }
}
overalltimer++;
if (overalltimer == 1800 || susdone == 1)
{
    susdone = 2;
    susie.sprite_index = susmemsprite;
    susie.image_index = 0;
    snd_stop(snd_menumove);
    snd_play_x(snd_menumove, 0.5, 1.2);
}
if (overalltimer == 3600 || raldone == 1)
{
    raldone = 2;
    ralsei.sprite_index = ralmemsprite;
    ralsei.image_index = 0;
    snd_stop(snd_menumove);
    snd_play_x(snd_menumove, 0.5, 1.2);
}
