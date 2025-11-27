if (!i_ex(obj_battlecontroller))
    instance_destroy();
if (global.firstboardbattle == 1 && room == room_board_1)
{
    talktimer++;
    if (introcon == 0)
    {
        global.charturn = 3;
        global.fc = 22;
        global.typer = 80;
        msgsetloc(0, "* That's right!!! It's a battle scene, folks!!!", "obj_tennabattleconvo_controller_slash_Step_0_gml_13_0");
        scr_battletext();
        introcon = 0.1;
    }
    if (introcon == 0.1 && talktimer > 1 && i_ex(obj_writer) && obj_writer.reachedend == true && (button1_p() || button3_h()))
    {
        with (obj_writer)
            instance_destroy();
        global.fc = 22;
        global.typer = 80;
        msgsetloc(0, "* And our boys backstage have been begging to beat you down!", "obj_tennabattleconvo_controller_slash_Step_0_gml_23_0");
        scr_battletext();
        talktimer = 0;
        introcon = 0.2;
    }
    if (introcon == 0.2 && talktimer > 1 && i_ex(obj_writer) && obj_writer.reachedend == true && (button1_p() || button3_h()))
    {
        with (obj_writer)
            instance_destroy();
        global.fc = 22;
        global.typer = 80;
        msgsetloc(0, "* But this ain't your normal Saturday night slam fest!!", "obj_tennabattleconvo_controller_slash_Step_0_gml_34_0");
        scr_battletext();
        talktimer = 0;
        introcon = 0.3;
    }
    if (introcon == 0.3 && talktimer > 1 && i_ex(obj_writer) && obj_writer.reachedend == true && (button1_p() || button3_h()))
    {
        with (obj_writer)
            instance_destroy();
        global.fc = 22;
        global.typer = 80;
        msgsetloc(0, "* Perform well, and you'll get extra points!!!", "obj_tennabattleconvo_controller_slash_Step_0_gml_45_0");
        scr_battletext();
        talktimer = 0;
        introcon = 0.4;
    }
    if (introcon == 0.4 && talktimer > 1 && i_ex(obj_writer) && obj_writer.reachedend == true && (button1_p() || button3_h()))
    {
        with (obj_writer)
            instance_destroy();
        global.fc = 22;
        global.typer = 80;
        msgsetloc(0, "* For best \"results\", take no damage, win fast, and get gobs of TP!!!", "obj_tennabattleconvo_controller_slash_Step_0_gml_56_0");
        scr_battletext();
        talktimer = 0;
        introcon = 1;
    }
    if (introcon == 1 && talktimer > 1 && i_ex(obj_writer) && obj_writer.reachedend == true && (button1_p() || button3_h()))
    {
        with (obj_writer)
            instance_destroy();
        introcon = 2;
        talktimer = 0;
        global.charturn = 0;
    }
    if (scr_debug())
    {
        if (keyboard_check_pressed(vk_f5))
        {
            with (obj_writer)
                instance_destroy();
            introcon = 2;
        }
    }
    if (introcon < 2)
        exit;
}
if (scr_isphase("enemytalk"))
{
    con = 0;
    introcon = 3;
    with (obj_face)
    {
        if (global.fc == 22)
            instance_destroy();
    }
}
if (scr_isphase("bullets") && con == 0)
{
    timer++;
    if (timer == 13)
    {
        timer = 0;
        con = 1;
        chattedduringbulletphase = false;
        rr = choose(0, 2, 3, 4, 5, 6, 7, 8, 9);
        if (irandom(99) == 1)
            rr = 10;
        if (rr == 0)
            statustext = stringsetloc("* This is gonna be a heck of a slugfest, folks!", "obj_tennabattleconvo_controller_slash_Step_0_gml_95_0");
        if (rr == 2)
            statustext = stringsetloc("* Get your VHS players, this is gonna be one to tape!", "obj_tennabattleconvo_controller_slash_Step_0_gml_96_0");
        if (rr == 3)
            statustext = stringsetloc("* Don't adjust your set!! This battle is real, folks!!", "obj_tennabattleconvo_controller_slash_Step_0_gml_97_0");
        if (rr == 4)
            statustext = stringsetloc("* This is gonna be all out, folks! Get ready!!!", "obj_tennabattleconvo_controller_slash_Step_0_gml_98_0");
        if (rr == 5)
            statustext = stringsetloc("* What will our heroes do next!?", "obj_tennabattleconvo_controller_slash_Step_0_gml_99_0");
        if (rr == 6)
            statustext = stringsetloc("* You can only get this on cable TV, folks!!!", "obj_tennabattleconvo_controller_slash_Step_0_gml_100_0");
        if (rr == 7)
            statustext = stringsetloc("* Refreshments are available in the green room!", "obj_tennabattleconvo_controller_slash_Step_0_gml_101_0");
        if (rr == 8)
            statustext = stringsetloc("* Miss something!? The battle will be available on laserdisc!", "obj_tennabattleconvo_controller_slash_Step_0_gml_102_0");
        if (rr == 9)
            statustext = stringsetloc("* My nose is tingling from the excitement, folks!!!", "obj_tennabattleconvo_controller_slash_Step_0_gml_103_0");
        if (rr == 10)
            statustext = stringsetloc("* Hey you! Stop selling tickets made of toilet paper!", "obj_tennabattleconvo_controller_slash_Step_0_gml_105_0");
        if (enemyspared == true)
        {
            rr = choose(0, 1, 2, 3);
            if (rr == 0)
                statustext = stringsetloc("* Wow!! A spare!! Love blooms in the battlefield, folks!!", "obj_tennabattleconvo_controller_slash_Step_0_gml_110_0");
            if (rr == 1)
                statustext = stringsetloc("* Our heroes score a pacifist knockdown!!", "obj_tennabattleconvo_controller_slash_Step_0_gml_111_0");
            if (rr == 2)
                statustext = stringsetloc("* A brutal pacifist sparing from our heroes!!!", "obj_tennabattleconvo_controller_slash_Step_0_gml_112_0");
            if (rr == 3)
                statustext = stringsetloc("* Our heroes score a spare!! But where's the strike!?", "obj_tennabattleconvo_controller_slash_Step_0_gml_113_0");
        }
        if (enemydefeated == true)
        {
            rr = choose(0, 1, 2, 3);
            if (rr == 0)
                statustext = stringsetloc("* Ouch for the enemies!! Too bad they don't get healthcare, folks!!", "obj_tennabattleconvo_controller_slash_Step_0_gml_119_0");
            if (rr == 1)
                statustext = stringsetloc("* Beat so easily!? The enemies are looking at a pay cut!", "obj_tennabattleconvo_controller_slash_Step_0_gml_120_0");
            if (rr == 2)
                statustext = stringsetloc("* A brutal smack-down from our heroes!!!", "obj_tennabattleconvo_controller_slash_Step_0_gml_121_0");
            if (rr == 3)
                statustext = stringsetloc("* KO!! The heel is coming out from our heroes, folks!!", "obj_tennabattleconvo_controller_slash_Step_0_gml_122_0");
        }
    }
}
if (global.turntimer < 2 && !i_ex(obj_heart) && con == 1)
{
    if (grazed10bullets == true && damagecountthisturn == 0)
    {
        grazed10bullets = false;
        rr = choose(0, 1, 2);
        if (rr == 0)
            statustext = stringsetloc("* Wow!! Our heroes are grazing like goats!!!", "obj_tennabattleconvo_controller_slash_Step_0_gml_134_0");
        if (rr == 1)
            statustext = stringsetloc("* No damage!? What amazing skill!! Can we even show this!?", "obj_tennabattleconvo_controller_slash_Step_0_gml_135_0");
        if (rr == 2)
            statustext = stringsetloc("* Incredible dodging!! And best of all, it's on TV!!!", "obj_tennabattleconvo_controller_slash_Step_0_gml_136_0");
    }
    if (herodowned == true)
    {
        herodowned = false;
        rr = choose(0, 1, 2, 3);
        if (rr == 0)
            statustext = stringsetloc("* A brutal smackdown! Can our heroes survive!?", "obj_tennabattleconvo_controller_slash_Step_0_gml_143_0");
        if (rr == 1)
            statustext = stringsetloc("* That was rough!! Can our heroes mount a comeback!?", "obj_tennabattleconvo_controller_slash_Step_0_gml_144_0");
        if (rr == 2)
            statustext = stringsetloc("* Don't give up, heroes!! Think of the ratings!!!", "obj_tennabattleconvo_controller_slash_Step_0_gml_145_0");
        if (rr == 3)
            statustext = stringsetloc("* Downed!? Down't worry!!! We'll edit that out in post!!!", "obj_tennabattleconvo_controller_slash_Step_0_gml_146_0");
    }
    with (obj_writer)
        instance_destroy();
    if (chattedduringbulletphase == false)
    {
        with (obj_face)
            instance_destroy();
    }
    scr_speaker("tenna");
    global.fc = 22;
    global.battlemsg[0] = statustext;
    con = 2;
    damagecountthisturn = 0;
    enemyspared = false;
    enemydefeated = false;
}
if (global.turntimer > 120)
{
    if (damagecount == 1 && damagecountthisturn > 0)
    {
        damagecount = 2;
        rr = choose(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
        if (rr == -1 || krisdowned || susiedowned || ralseidowned)
        {
        }
        else
        {
            with (obj_writer)
                instance_destroy();
            with (obj_face)
                instance_destroy();
            global.fc = 22;
            global.typer = 80;
            if (rr == 0)
                msgsetloc(0, "* Kris!! Oh no!! Toriel, don't look!!", "obj_tennabattleconvo_controller_slash_Step_0_gml_178_0");
            if (rr == 1)
                msgsetloc(0, "* That's gotta hurt, folks!", "obj_tennabattleconvo_controller_slash_Step_0_gml_179_0");
            if (rr == 2)
                msgsetloc(0, "* Slam for the bad guys!!", "obj_tennabattleconvo_controller_slash_Step_0_gml_180_0");
            if (rr == 3)
                msgsetloc(0, "* Call the IQ police, that's gotta smart!!", "obj_tennabattleconvo_controller_slash_Step_0_gml_181_0");
            if (rr == 4)
                msgsetloc(0, "* Just watching it hurts, folks!!", "obj_tennabattleconvo_controller_slash_Step_0_gml_182_0");
            if (rr == 5)
                msgsetloc(0, "* Ouch! Cover your nose, kids!!!", "obj_tennabattleconvo_controller_slash_Step_0_gml_183_0");
            if (rr == 6)
                msgsetloc(0, "* Watch out for the splash zone!!", "obj_tennabattleconvo_controller_slash_Step_0_gml_184_0");
            if (rr == 7)
                msgsetloc(0, "* It's carnage out there, folks!!", "obj_tennabattleconvo_controller_slash_Step_0_gml_185_0");
            if (rr == 8)
                msgsetloc(0, "* Alert!! The curtains are on fire!!", "obj_tennabattleconvo_controller_slash_Step_0_gml_186_0");
            if (rr == 9)
                msgsetloc(0, "* Oh no!! Mike, don't look!!", "obj_tennabattleconvo_controller_slash_Step_0_gml_187_0");
            if (rr == 10)
                msgsetloc(0, "* Boo boo for bozos!", "obj_tennabattleconvo_controller_slash_Step_0_gml_188_0");
            scr_battletext();
            if (rr == 10)
                snd_play(snd_crowd_laughter_single);
            else
                snd_play(snd_crowd_gasp);
            chattedduringbulletphase = true;
        }
    }
    if (damagecount == 4 && damagecountthisturn > 0)
    {
        damagecount = 5;
        rr = choose(0, 1, 2, 3);
        if (rr == 0 || rr == 1)
        {
            with (obj_writer)
                instance_destroy();
            with (obj_face)
                instance_destroy();
            global.fc = 22;
            global.typer = 80;
            if (rr == 0)
                msgsetloc(0, "* Ever heard of dodging!?", "obj_tennabattleconvo_controller_slash_Step_0_gml_209_0");
            if (rr == 1)
                msgsetloc(0, "* Dan called! He wants his maku back!!", "obj_tennabattleconvo_controller_slash_Step_0_gml_210_0");
            scr_battletext();
            snd_play(snd_crowd_laughter_single);
            chattedduringbulletphase = true;
        }
    }
    if (krisdowned)
    {
        krisdowned = false;
        with (obj_writer)
            instance_destroy();
        with (obj_face)
            instance_destroy();
        global.fc = 22;
        global.typer = 80;
        msgsetloc(0, "* Kris!! Oh no!! Toriel, don't look!!", "obj_tennabattleconvo_controller_slash_Step_0_gml_225_0");
        scr_battletext_default();
        chattedduringbulletphase = true;
    }
    if (susiedowned)
    {
        susiedowned = false;
        with (obj_writer)
            instance_destroy();
        with (obj_face)
            instance_destroy();
        global.fc = 22;
        global.typer = 80;
        msgsetloc(0, "* Monster girl down!!! No way!!!", "obj_tennabattleconvo_controller_slash_Step_0_gml_238_0");
        scr_battletext_default();
        chattedduringbulletphase = true;
    }
    if (ralseidowned)
    {
        ralseidowned = false;
        with (obj_writer)
            instance_destroy();
        with (obj_face)
            instance_destroy();
        global.fc = 22;
        global.typer = 80;
        msgsetloc(0, "* Fluffy boy down!!! Oh no!!!", "obj_tennabattleconvo_controller_slash_Step_0_gml_251_0");
        scr_battletext_default();
        chattedduringbulletphase = true;
    }
}
