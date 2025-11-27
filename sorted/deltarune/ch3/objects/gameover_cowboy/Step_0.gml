if (tenna == -4)
{
    if (i_ex(obj_actor_tenna))
    {
        tenna = instance_find(obj_actor_tenna, 0);
        tenna.sprite_index = spr_tenna_grasp;
        gameover_parent.tenna_arrive = true;
        init = true;
        alarm[0] = 30;
    }
}
if (!init)
    exit;
if (con == 0)
{
    con = 1;
    alarm[0] = 30;
    tenna.preset = 0;
    tenna.sprite_index = spr_tenna_grasp;
    with (tenna)
        scr_shakeobj();
    scr_speaker("tenna");
    msgsetloc(0, "* Kris!^1! Susie!^1! Ralsei!^1! What did I say about holding onto your HATS!!/%", "obj_gameover_cowboy_slash_Step_0_gml_29_0");
    var d = d_make();
    d.stay = 5;
    d.side = 0;
}
if (con == 2 && !d_ex())
{
    con = 3;
    alarm[0] = 30;
    tenna.bounce = 1;
    tenna.sprite_index = spr_tenna_laugh_pose;
    scr_speaker("tenna");
    msgsetloc(0, "* A cowboy without a cowboy hat^1, why^1, it might as well be --/%", "obj_gameover_cowboy_slash_Step_0_gml_45_0");
    var d = d_make();
    d.stay = 5;
    d.side = 0;
}
if (con == 4 && !d_ex())
{
    con = 5;
    alarm[0] = 30;
    tenna.preset = 0;
    tenna.sprite_index = spr_tenna_grasp;
    with (tenna)
        scr_shakeobj();
    scr_speaker("tenna");
    msgsetloc(0, "* Just a boy!^1! Or a cow!!/%", "obj_gameover_cowboy_slash_Step_0_gml_62_0");
    var d = d_make();
    d.stay = 5;
    d.side = 0;
}
if (con == 6 && !d_ex())
{
    con = 7;
    alarm[0] = 30;
    tenna.preset = 0;
    tenna.bounce = 1;
    tenna.sprite_index = spr_tenna_whisper;
    tenna.image_index = 0;
    scr_speaker("tenna");
    msgsetloc(0, "* And I can't say those descriptors totally match all of you./%", "obj_gameover_cowboy_slash_Step_0_gml_80_0");
    var d = d_make();
    d.stay = 5;
    d.side = 0;
}
if (con == 8 && !d_ex())
{
    con = 9;
    alarm[0] = 30;
    tenna.preset = 2;
    tenna.sprite_index = spr_tenna_point_up;
    scr_speaker("tenna");
    msgsetloc(0, "* But DON'T WORRY!^1! Mike^1, lovely man that he is^1, pre-ordered a BACKUP shipment of headwear --/%", "obj_gameover_cowboy_slash_Step_0_gml_96_0");
    var d = d_make();
    d.stay = 5;
    d.side = 0;
}
if (con == 10 && !d_ex())
{
    con = 11;
    alarm[0] = 30;
    tenna.sprite_index = spr_tenna_point_left;
    with (tenna)
        scr_flip("x");
    tenna.x += 40;
    scr_speaker("tenna");
    msgsetloc(0, "* And that max-size mack truck is pulling in the back right now!!/%", "obj_gameover_cowboy_slash_Step_0_gml_113_0");
    var d = d_make();
    d.stay = 5;
    d.side = 0;
}
if (con == 12 && !d_ex())
{
    con = 13;
    alarm[0] = 30;
    tenna.preset = 0;
    tenna.bounce = 1;
    tenna.sprite_index = spr_tenna_whisper;
    tenna.image_index = 0;
    scr_speaker("tenna");
    msgsetloc(0, "* ..^1. Unfortunately^1, it only contains 3 hats./%", "obj_gameover_cowboy_slash_Step_0_gml_131_0");
    var d = d_make();
    d.stay = 5;
    d.side = 0;
}
if (con == 14 && !d_ex())
{
    con = 15;
    alarm[0] = 30;
    tenna.bounce = 1;
    tenna.sprite_index = spr_tenna_laugh_pose;
    scr_speaker("tenna");
    msgsetloc(0, "* So make 'em count!^1! Hold onto your head and don't let go!!/", "obj_gameover_cowboy_slash_Step_0_gml_147_0");
    msgnextloc("* LET'S CHALLENGE AGAIN!!/%", "obj_gameover_cowboy_slash_Step_0_gml_148_0");
    var d = d_make();
    d.stay = 5;
    d.side = 0;
}
if (con == 16 && !d_ex())
{
    con = 17;
    alarm[0] = 30;
    gameover_parent.con = 1;
    gameover_parent.timer = 0;
}
if (con == 16 && !d_ex())
{
    con = 99;
    instance_destroy();
}
