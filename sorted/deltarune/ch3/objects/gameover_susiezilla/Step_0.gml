if (tenna == -4)
{
    if (i_ex(obj_actor_tenna))
    {
        tenna = instance_find(obj_actor_tenna, 0);
        tenna.sprite_index = spr_tenna_point_at_screen;
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
    tenna.sprite_index = spr_tenna_point_at_screen;
    with (tenna)
        scr_shakeobj();
    global.msc = 1395;
    scr_text(global.msc);
    var d = d_make();
    d.stay = 5;
    d.side = 0;
}
if (con == 5 && !d_ex())
{
    if (global.choice == 0)
    {
        con = 12;
        tenna.bounce = 1;
        tenna.sprite_index = spr_tenna_point_up;
        scr_speaker("tenna");
        msgsetloc(0, "* Okay! Well then what were you LOSING for!? Get OUT THERE!/%", "obj_gameover_susiezilla_slash_Step_0_gml_52_0_b");
        var d = d_make();
        d.side = 0;
    }
    else
    {
        con = 8;
        tenna.bounce = 1;
        tenna.sprite_index = spr_tenna_laugh_pose;
        scr_speaker("tenna");
        msgsetloc(0, "* That's it^1, then!/%", "obj_gameover_susiezilla_slash_Step_0_gml_63_0");
        var d = d_make();
        d.side = 0;
    }
}
if (con == 8 && !d_ex())
{
    con = 9;
    alarm[0] = 60;
    with (tenna)
        gravity = 1.5;
    with (gameover_parent)
        scr_lerpvar("blackalpha", 0, 1, 30);
}
if (con == 10 && !d_ex())
{
    con = -1;
    snd_free_all();
    inst = instance_create(0, 0, obj_persistentfadein);
    global.interact = 3;
    global.facing = 0;
    global.entrance = 2;
    room_goto(room_dw_ranking_a);
}
if (con == 12 && !d_ex())
{
    con = 13;
    alarm[0] = 30;
    gameover_parent.con = 1;
    gameover_parent.timer = 0;
    gameover_parent.quitcon = -1;
    gameover_parent.replayversion = false;
}
if (con == 14 && !d_ex())
{
    con = -1;
    instance_destroy();
}
