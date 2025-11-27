siner++;
if (con == 1)
{
    var hasjokesleft = true;
    if (array_length(jokes) == 0)
        hasjokesleft = false;
    global.interact = 1;
    global.msc = -99;
    global.choice = -1;
    global.choicemsg[0] = stringsetloc("#Tell a Joke", "obj_dw_church_jackenstein_pumpkinNPC_slash_Step_0_gml_15_0");
    global.choicemsg[1] = stringsetloc("#Tell a Story", "obj_dw_church_jackenstein_pumpkinNPC_slash_Step_0_gml_16_0");
    if (hasjokesleft == false)
    {
        global.choicemsg[0] = global.choicemsg[1];
        global.choicemsg[1] = stringsetloc("#Don't", "obj_dw_church_jackenstein_pumpkinNPC_slash_Step_0_gml_20_0");
    }
    global.choicemsg[2] = stringset("");
    global.choicemsg[3] = stringset("");
    scr_speaker("no_name");
    msgsetloc(0, "* (...)/", "obj_dw_church_jackenstein_pumpkinNPC_slash_Step_0_gml_26_0");
    msgnext("\\C2 ");
    d_make();
    con = 2;
    if (hasjokesleft == false)
        con = 40;
}
if (con == 40 && global.choice != -1)
{
    if (global.choice == 0)
    {
        k_d(1);
        con = 20;
    }
    if (global.choice == 1)
    {
        con = 0;
        k_d();
        global.interact = 0;
    }
}
if (con == 2 && global.choice != -1)
{
    k_d(1);
    if (global.choice == 0)
        con = 10;
    if (global.choice == 1)
        con = 20;
}
if (con == 10)
{
    var pickjoke = irandom(array_length(jokes) - 1);
    var jokeind = jokes[pickjoke];
    array_delete(jokes, pickjoke, 1);
    debug_message(jokes);
    switch (jokeind)
    {
        case 0:
            scr_speaker("ralsei");
            msgsetloc(0, "\\EJ* Why shouldn't you fight with a broken pencil?/%", "obj_dw_church_jackenstein_pumpkinNPC_slash_Step_0_gml_75_0");
            break;
        case 1:
            scr_speaker("susie");
            msgsetloc(0, "\\EY* What's worse than Ralsei in a trash can?/%", "obj_dw_church_jackenstein_pumpkinNPC_slash_Step_0_gml_79_0");
            break;
        case 2:
            scr_speaker("susie");
            msgsetloc(0, "\\EK* Hey^1, wanna donut? I mean^1, a hurtz one?/%", "obj_dw_church_jackenstein_pumpkinNPC_slash_Step_0_gml_83_0");
            break;
        case 3:
            scr_speaker("ralsei");
            msgsetloc(0, "\\E2* Ummm^1, knock knock!/%", "obj_dw_church_jackenstein_pumpkinNPC_slash_Step_0_gml_87_0");
            break;
    }
    d_make();
    con = 11;
}
if (con == 11 && !d_ex())
{
    laughing = true;
    imgind = 0;
    laughingtime = 0;
    snd_play(snd_jackolantern_laugh);
    con = 12;
    scr_delay_var("con", 13, 64);
}
if (con == 13)
{
    laughing = false;
    if (global.flag[1637] == 1)
    {
        con = 14;
    }
    else
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (It laughed before the punchline...)/%", "obj_dw_church_jackenstein_pumpkinNPC_slash_Step_0_gml_113_0");
        d_make();
        con = 14;
        global.flag[1637] = 1;
    }
}
if (con == 14 && !d_ex())
{
    con = 0;
    global.interact = 0;
}
if (con == 20)
{
    scr_speaker("ralsei");
    msgsetloc(0, "\\E2* Well^1, once upon a time^1, there was a lonely kingdom./", "obj_dw_church_jackenstein_pumpkinNPC_slash_Step_0_gml_129_0");
    msgnextloc("\\Ed* And in it^1, there lived a prince.../", "obj_dw_church_jackenstein_pumpkinNPC_slash_Step_0_gml_130_0");
    msgnextloc("\\EJ* ..^1. who had scarcely known anyone else. Until one day.../", "obj_dw_church_jackenstein_pumpkinNPC_slash_Step_0_gml_131_0");
    d_make();
    con = 21;
}
if (con == 21)
{
    if (instance_exists(obj_writer))
    {
        if (scr_getmsgno() == 3)
        {
            k_d();
            con = 22;
            timer = 0;
        }
    }
}
if (con == 22)
{
    timer++;
    if (timer == 1)
        scr_lerpvar("mouthangle", 0, 180, 15, -1, "out");
    if (timer == 15)
    {
        var loc = [x - 266, y - 144];
        if (global.lang == "ja")
            loc = [x - 266 - 26, (y - 144) + 40];
        instance_create(loc[0], loc[1], obj_takingtoolong);
        var snd = 525;
        if (global.lang == "ja")
            snd = 150;
        snd_play(snd, 0.7);
    }
    if (timer == 90)
    {
        scr_lerpvar("mouthangle", 180, 0, 6, -2, "out");
        snd_play(snd_noise);
        vspeed = -8;
        gravity = 1;
        hspeed = 16;
        friction = 0.125;
    }
    if (timer == 135)
    {
        gravity = 0;
        vspeed = 0;
        hspeed = 0;
        scr_speaker("ralsei");
        msgsetloc(0, "\\EK* Okay.../%", "obj_dw_church_jackenstein_pumpkinNPC_slash_Step_0_gml_176_0");
        d_make();
        con = 23;
    }
}
if (con == 23 && !d_ex())
{
    global.interact = 0;
    global.flag[1637] = 2;
    instance_destroy();
}
if (laughing)
{
    laughingtime++;
    if (laughingtime == round(1.26))
        imgindex = 1.2;
    if (laughingtime == round(5.67))
        imgindex = 0;
    if (laughingtime == round(8.67))
        imgindex = 1.1;
    if (laughingtime == round(10.95))
        imgindex = 0;
    if (laughingtime == round(12.78))
        imgindex = 1.05;
    if (laughingtime == round(15.36))
        imgindex = 0;
    if (laughingtime == round(17.22))
        imgindex = 1;
    if (laughingtime == round(20.220000000000002))
        imgindex = 0;
    if (laughingtime == round(23.25))
        imgindex = 0.95;
    if (laughingtime == round(26.19))
        imgindex = 0;
    if (laughingtime == round(28.919999999999998))
        imgindex = 0.95;
    if (laughingtime == round(32.04))
        imgindex = 0;
    if (laughingtime == round(35.94))
        imgindex = 0.8;
    if (laughingtime == round(40.65))
        imgindex = 0;
    if (laughingtime == round(44.790000000000006))
        imgindex = 0.7;
    if (laughingtime == round(49.26))
        imgindex = 0;
}
