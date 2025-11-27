if (myinteract == 3 && con == 0)
{
    global.interact = 1;
    con = 1;
    scr_speaker("no_name");
    msgsetloc(0, "USED THE \\cYSHELTER KEY\\cW./%", "obj_board_warptopreshadowmantle_slash_Step_0_gml_8_0");
    bw_make();
    global.flag[1055] = 5;
    timer = 0;
    with (obj_board_screenColorChanger)
        instance_destroy();
}
if (con == 1 && !bw_ex())
{
    timer++;
    var dooropentime = 25;
    if (timer == (dooropentime * 1))
    {
        doorindex = 1;
        snd_play_pitch(snd_board_torch_low, 0.9);
    }
    if (timer == (dooropentime * 2))
    {
        doorindex = 2;
        snd_play_pitch(snd_board_torch_low, 0.8);
    }
    if (timer == (dooropentime * 3))
    {
        doorindex = 3;
        snd_play(snd_board_door_close);
    }
    if (timer == (dooropentime * 6))
        con = 2;
}
if (con == 2)
{
    global.interact = 1;
    transition = instance_create(x, y, obj_board_transition);
    snd_play_pitch(snd_board_escaped, 0.8);
    con = 3;
}
if (con == 3)
{
    if (transition.con == 2 && transition.timer == 2)
    {
        room_goto(room_board_preshadowmantle);
        global.flag[1055] = 5;
        instance_destroy();
        con = 4;
    }
}
