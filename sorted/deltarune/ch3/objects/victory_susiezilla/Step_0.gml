if (con < 0)
    exit;
if (con == 0)
{
    if (writer.reachedend == 1)
    {
        con = 1;
        alarm[0] = 120;
    }
}
if (con == 2)
{
    con = 7;
    alarm[0] = 30;
    with (writer)
        instance_destroy();
}
if (con == 4)
    con = 5;
if (con == 6 && !d_ex())
{
    con = 7;
    alarm[0] = 30;
}
if (con == 8)
{
    con = -1;
    with (writer)
        instance_destroy();
    if (scr_flag_get(1220) == 0)
    {
        scr_flag_set(1220, 1);
        with (obj_event_manager)
            trigger_event(UnknownEnum.Value_0, UnknownEnum.Value_22);
    }
    inst = instance_create_depth(0, 0, 0, obj_gameover_minigame);
    inst.replayversion = 1;
    inst.replaywin = 1;
}

enum UnknownEnum
{
    Value_0,
    Value_22 = 22
}
