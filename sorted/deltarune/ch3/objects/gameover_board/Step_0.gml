global.interact = 1;
if (tenna == -4)
{
    if (i_ex(obj_actor_tenna))
    {
        tenna = instance_find(obj_actor_tenna, 0);
        if (times_lost > 1)
        {
            with (obj_actor_tenna)
                sprite_index = spr_tenna_grasp;
        }
        gameover_parent.tenna_arrive = true;
        printval("inbattle");
        init = true;
    }
}
with (obj_couchwriter)
    instance_destroy();
if (!init)
    exit;
var canthavethatontv = stringsetloc("* We can't have THAT on TV!^1! The SHOW MUST GO ON!!/", "obj_gameover_board_slash_Step_0_gml_34_0");
var continuewhere = stringsetloc("* You're gonna continue RIGHT where you left off!/", "obj_gameover_board_slash_Step_0_gml_35_0");
var littlepunishment = stringsetloc("* ..^1. Well^1, except for a LITTLE punishment./", "obj_gameover_board_slash_Step_0_gml_36_0");
if (con == 0 && init)
{
    timer++;
    if (timer == 30)
        con = 1;
}
if (con == 1)
{
    timer = 0;
    con = 8;
    scr_speaker("tenna");
    msgsetloc(0, "* What the...!? You actually LOST!?/", "obj_gameover_board_slash_Step_0_gml_33_0");
    var points = global.flag[1044];
    puntype = 0;
    if (points > 200)
        puntype = 0;
    if (points <= 200 && points > 20)
        puntype = 1;
    if (points < 1)
        puntype = 3;
    if (points < 20)
    {
        if (scr_inventoryspace() >= 2)
        {
            if (!scr_itemcheck(34))
                puntype = 2;
        }
    }
    msgnext(canthavethatontv);
    msgnext(continuewhere);
    if (puntype != 2)
        msgnext(littlepunishment);
    if (times_lost > 1)
        msgsetloc(0, "* GAME OVER!!^1! Another LOSS^1, another PUNISHMENT!!!/", "obj_gameover_board_slash_Step_0_gml_43_0");
    if (global.flag[1022] == 1)
    {
        msgsetloc(0, "* HEY^1! I was just out of the room and I heard you got a GAME OVER!!/", "obj_gameover_board_slash_Step_0_gml_47_0");
        if (times_lost <= 1)
        {
            msgnext(canthavethatontv);
            msgnext(continuewhere);
            if (puntype != 2)
                msgnext(littlepunishment);
        }
        else
        {
            msgnextloc("* Another LOSS^1, another PUNISHMENT!!!/", "obj_gameover_board_slash_Step_0_gml_57_0");
        }
        con = 7.1;
    }
    punishment = floor(global.flag[1044] / 3);
    if (punishment <= 0)
    {
        if (global.flag[1044] < 3 && global.flag[1044] > 0)
            punishment = 1;
        if (puntype == 0)
        {
            if (global.flag[1044] == 1)
                puntype = 1;
        }
    }
    if (puntype == 0)
        msgnextloc("* I WILL be taking some of your POINTs!/%", "obj_gameover_board_slash_Step_0_gml_69_0");
    if (puntype == 1)
    {
        msgnextloc("* I WILL be taking ALL of your POINTs!/%", "obj_gameover_board_slash_Step_0_gml_73_0");
        punishment = points;
    }
    if (puntype == 2)
    {
        punishment = 0;
        msgnextloc("* Well^1, actually I would punish you^1, but you look so pathetic and hungry!/", "obj_gameover_board_slash_Step_0_gml_107_0");
        msgnextloc("* Here^1! Take two \\cYTV Dinners\\cW and call me in the morning!/%", "obj_gameover_board_slash_Step_0_gml_108_0");
        con = 4.1;
    }
    if (puntype == 3)
    {
        punishment = 0;
        scr_delay_var("makeangry", 1, 5);
        msgnextloc("* Punishment for ME to have to watch you TANK THESE RATINGS losing at 0 POINTs!!!/%", "obj_gameover_board_slash_Step_0_gml_79_0");
    }
    var d = d_make();
    d.side = 0;
    if (global.flag[1022] == 1)
        d.stay = 5;
}
if (con == 4.1)
{
    timer++;
    if (timer > 5)
    {
        if ((times_lost == 1 && scr_msgno_end(4)) || (times_lost > 1 && scr_msgno_end(2)))
        {
            snd_play(snd_item);
            scr_itemget(34);
            scr_itemget(34);
            con = 8;
        }
    }
}
if (makeangry == 1)
{
    if ((times_lost == 1 && scr_getmsgno_d(4)) || (times_lost > 1 && scr_getmsgno_d(1)))
    {
        with (obj_actor_tenna)
        {
            bounce = 1;
            sprite_index = spr_tenna_sad;
        }
        makeangry = 2;
    }
}
if (makeangry == 2)
{
    if ((times_lost == 1 && scr_msgno_end(4)) || (times_lost > 1 && scr_msgno_end(1)))
    {
        snd_play(snd_crowd_laughter_single);
        makeangry = 0;
    }
}
if (con == 8.1 && !d_ex())
{
    scr_speaker("tenna");
    msgsetloc(0, "* Now I've gotta get back out of here^1, so don't lose again^1, OK!?/%", "obj_gameover_board_slash_Step_0_gml_94_0");
    d_make();
    con = 8;
}
if (con == 7.1)
    con = 8;
if (con == 8 && !d_ex())
{
    con = 9;
    alarm[0] = 41;
    with (obj_actor_tenna)
    {
        sprite_index = spr_tenna_hooray_armsup;
        bounce = 1;
        scr_lerpvar("x", x, camerax() + 480 + 320, 30, 4, "in");
    }
    gameover_parent.con = 1;
    gameover_parent.timer = 0;
}
if (con == 10 && !d_ex())
{
    con = 99;
    if (punishment > 0)
        scr_board_score(-punishment);
    global.interact = 0;
    with (obj_mainchara_board)
        myhealth = maxhealth;
    instance_destroy();
}
