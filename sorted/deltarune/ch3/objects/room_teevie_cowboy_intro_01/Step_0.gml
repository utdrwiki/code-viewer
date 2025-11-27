if (con < 0)
    exit;
if (con == 0)
{
    if (obj_mainchara.y < 315 && obj_mainchara.x >= 320)
    {
        con = 1;
        global.interact = 1;
    }
}
if (con == 1)
{
    con = 2;
    alarm[0] = 8;
}
if (con == 3)
{
    con = 4;
    scr_speaker("no_name");
    msgsetloc(0, "* Oh^1, you're here for the next CHALLENGE^1, aren't you?/", "obj_room_teevie_cowboy_intro_01_slash_Step_0_gml_33_0");
    msgnextloc("* Hurry^1, put these on and get on stage!/%", "obj_room_teevie_cowboy_intro_01_slash_Step_0_gml_34_0");
    d_make();
}
if (con == 4 && !d_ex())
{
    con = -1;
    scr_flag_set(1125, 1);
    var screen_wipe = instance_create(0, 0, obj_ch3_screen_wipe);
    screen_wipe.depth = -200;
    screen_wipe.target_room = room_shootout;
    screen_wipe.start = true;
}
