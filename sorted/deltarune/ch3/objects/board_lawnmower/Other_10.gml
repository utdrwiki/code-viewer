if (myinteract < 3 && speed == 0)
{
    var player = 0;
    with (obj_mainchara_board)
    {
        if (controlled == 1)
            player = id;
    }
    direction = (player.facing - 1) * 90;
    speed = 2;
    friction = -0.2;
    snd_play(snd_board_torch_low);
    myinteract = 3;
    if (room == room_dw_teevie_shadow_guys)
    {
        safe_delete(mysolid);
        if (global.flag[654] == -1)
        {
            with (obj_dw_teevie_shadow_guys)
                crblock = 1;
            global.flag[1147] = 20;
        }
    }
}
