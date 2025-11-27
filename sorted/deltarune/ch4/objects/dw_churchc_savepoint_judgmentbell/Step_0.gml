if (myinteract == 3)
{
    global.interact = 1;
    global.msc = -99;
    global.choice = -1;
    global.choicemsg[0] = stringsetloc("#Ring", "obj_dw_churchc_savepoint_judgmentbell_slash_Step_0_gml_11_0");
    global.choicemsg[1] = stringsetloc("#Do Not", "obj_dw_churchc_savepoint_judgmentbell_slash_Step_0_gml_12_0");
    global.choicemsg[2] = stringset("");
    global.choicemsg[3] = stringset("");
    scr_speaker("no_name");
    msgsetloc(0, "* (It's a bell. Ring out judgment?)/", "obj_dw_churchc_savepoint_judgmentbell_slash_Step_0_gml_16_0");
    msgnext("\\C2 ");
    myinteract = 4;
    d_make();
    talked++;
}
if (myinteract == 4 && global.choice != -1)
{
    k_d();
    if (global.choice == 0)
        myinteract = 5;
    if (global.choice == 1)
        myinteract = 999;
}
if (myinteract == 5)
{
    timer++;
    if (timer == 1)
        snd_play(snd_bell);
    if (timer >= 20)
    {
        myinteract = 6;
        timer = 0;
    }
}
if (myinteract == 6)
{
    var bellcase = 0;
    var bad = false;
    var regrecruit = scr_enemyrecruitcheck("guei") + scr_enemyrecruitcheck("balthizard") + scr_enemyrecruitcheck("bibliox") + scr_enemyrecruitcheck("mizzle") + scr_enemyrecruitcheck("wicabel") + scr_enemyrecruitcheck("winglade") + scr_enemyrecruitcheck("organikk");
    var lostrecruit = scr_enemylostcheck("guei") + scr_enemylostcheck("balthizard") + scr_enemylostcheck("bibliox") + scr_enemylostcheck("mizzle") + scr_enemylostcheck("wicabel") + scr_enemylostcheck("winglade") + scr_enemylostcheck("organikk") + scr_enemylostcheck("miss");
    if (regrecruit < 7)
        bellcase = 1;
    if (regrecruit == 7)
        bellcase = 2;
    if (regrecruit == 7 && scr_enemyrecruitcheck("miss"))
        bellcase = 3;
    debug_print("regrecruit=" + string(regrecruit));
    debug_print("lostrecruit=" + string(lostrecruit));
    if (lostrecruit > 0)
    {
        bad = true;
        bellcase = 0;
    }
    show_debug_message_concat("Miss Mizzle Recruit=", scr_enemyrecruitcheck("miss"), "|", "regrecruit=", regrecruit, "| lostrecruit=", lostrecruit, " | bellcase=", string(bellcase));
    if (bad == false)
    {
        msgsetloc(0, "* (Judgment was decreed. You have been kind...)/", "obj_dw_churchc_savepoint_judgmentbell_slash_Step_0_gml_95_0");
    }
    else
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (..^1. but the bell rung hollow.)/%", "obj_dw_churchc_savepoint_judgmentbell_slash_Step_0_gml_100_0");
    }
    switch (bellcase)
    {
        case 1:
            msgnextloc("* (..^1. But^1, you haven't spared everyone you could yet.)/", "obj_dw_churchc_savepoint_judgmentbell_slash_Step_0_gml_106_0");
            msgnextloc("* (..^1. Should you go forward? The bell leaves it up to you.)/%", "obj_dw_churchc_savepoint_judgmentbell_slash_Step_0_gml_107_0");
            break;
        case 2:
            msgnextloc("* (..^1. But^1, there is a foe you haven't met and spared yet.)/", "obj_dw_churchc_savepoint_judgmentbell_slash_Step_0_gml_110_0");
            msgnextloc("* (It might not matter. The bell leaves it up to you.)/%", "obj_dw_churchc_savepoint_judgmentbell_slash_Step_0_gml_111_0");
            break;
        case 3:
            msgnextloc("* (..^1. It seems you have spared everyone you could.)/%", "obj_dw_churchc_savepoint_judgmentbell_slash_Step_0_gml_114_0");
            break;
    }
    d_make();
    myinteract = 999;
}
if (myinteract == 999 && !d_ex())
{
    myinteract = 0;
    global.interact = 0;
}
