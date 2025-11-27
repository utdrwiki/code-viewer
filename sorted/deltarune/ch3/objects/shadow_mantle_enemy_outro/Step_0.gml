var dside = 1;
if (con == 0)
{
    if (timer == 1)
        global.interact = 1;
    if (timer == 172)
    {
        global.flag[1050] = 1;
        global.currentsong[0] = snd_init("nightmare_nes.ogg");
        global.currentsong[1] = mus_loop(global.currentsong[0]);
    }
    if (timer == 242)
    {
        con++;
        scr_speaker("no_name");
        msgsetloc(0, "There^1! That's what I wanted to see!/", "obj_shadow_mantle_enemy_outro_slash_Step_0_gml_21_0");
        msgnextloc("Flickering red^1, like pretty little flames.../", "obj_shadow_mantle_enemy_outro_slash_Step_0_gml_22_0");
        msgnextloc("Your eyes can't hide it^1, Kris. Without play.../", "obj_shadow_mantle_enemy_outro_slash_Step_0_gml_23_0");
        msgnextloc("The knife grows dull./", "obj_shadow_mantle_enemy_outro_slash_Step_0_gml_24_0");
        msgnextloc("Haha..^1. well^1, enough of that^1! We both have work to do!/%", "obj_shadow_mantle_enemy_outro_slash_Step_0_gml_25_0");
        var d = bw_make();
        d.side = dside;
    }
}
if (con == 1 && !bw_ex())
{
    scr_lerpvar("x", x, board_tilex(1.5), 15, 2, "out");
    scr_lerpvar("y", y, board_tiley(1.5), 15, 2, "out");
    con = -999;
    scr_delay_var("con", 2, 15);
}
if (con == 2)
{
    scr_speaker("no_name");
    msgsetloc(0, "So if you want this MANTLE^1, hurry up and take it.../%", "obj_shadow_mantle_enemy_outro_slash_Step_0_gml_42_0");
    var d = bw_make();
    d.side = dside;
    d.stay = 30;
    con = 3;
}
if (con == 3 && !bw_ex())
{
    scr_var_delay("gravity", -2, 30);
    for (var i = 0; i < 10; i++)
        scr_var_delay("afterimage", 1, 30 + (5 * i));
    var warpsnd = 107;
    snd_play_delay(warpsnd, 30);
    scr_speaker("no_name");
    msgsetloc(0, "If you can reach it!/%", "obj_shadow_mantle_enemy_outro_slash_Step_0_gml_60_0");
    var d = bw_make();
    d.side = dside;
    con = 4;
    global.flag[1055] = 6;
}
if (con == 4 && !bw_ex())
{
    if (y < -32)
    {
        con = 5;
        kris = 544;
        global.interact = 0;
        snd_stop(snd_board_door_close);
        snd_play_pitch(snd_board_door_close, 1.2);
        scr_board_instawarp(128, 320, kris.x, kris.y + 224 + 32, "none", 119);
        mus_fade(global.currentsong[1], 30);
        instance_destroy();
    }
}
if (afterimage == 1)
{
    afterimage = 0;
    scr_board_afterimage(0, 10);
}
scr_depth_board();
