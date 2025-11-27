scr_board_populatevars();
if (tenna == 0)
{
    with (obj_actor_tenna)
        other.tenna = id;
}
if (susiereal == 0)
{
    with (obj_caterpillarchara)
    {
        if (name == "susie")
            other.susiereal = id;
    }
}
if (ralseireal == 0)
{
    with (obj_caterpillarchara)
    {
        if (name == "ralsei")
            other.ralseireal = id;
    }
}
if (krisreal == 0)
{
    with (obj_mainchara)
        other.krisreal = id;
}
if (global.flag[1001] == 1)
{
    for (var i = 0; i < 4; i++)
    {
        with (southblock[i])
            setxy(room_width, room_height);
    }
}
if (active == 1)
{
    if (obj_board_camera.con == 0 && con == 0)
    {
        timer++;
        if (timer == 1)
        {
            ralsei.follow = false;
            scr_pathfind_to_point("susie", 7, 1, 0);
            suwalk = 1;
        }
        if (timer == 15)
            scr_pathfind_to_point("ralsei", 4, 1, 0);
    }
    if (global.flag[1001] == 2 && obj_board_camera.con == 0)
    {
        with (obj_mainchara_board)
        {
            if (y > 256)
                y = 256;
        }
        global.flag[1001] = 3;
        snd_play(snd_board_door_close);
        resetblocks = true;
        instance_create_board(5, 7, obj_board_smokepuff);
        instance_create_board(6, 7, obj_board_smokepuff);
    }
}
else
{
    suwalk = 0;
    timer = 0;
}
if (resetblocks == true)
{
    resetblocks = false;
    for (var i = 0; i < 4; i++)
    {
        southblock[i].x = x + (32 * (3 + i));
        southblock[i].y = y + 192;
    }
}
