function scr_board_sword_repeat()
{
    timer++;
    if (timer == 1)
    {
        with (obj_board_squaretransition)
            instance_destroy();
        obj_mainchara_board.facing = 2;
        global.interact = 1;
        with (instance_create(board_tilex(0), board_tiley(-1), obj_puzzlecloset_tvturnon))
        {
            width = 384;
            height = 288;
        }
    }
    if (timer == 15)
    {
        if (room == room_board_1_sword || room == room_board_2_sword || room == room_board_3_sword)
            scr_musicer("board_ocean.ogg", 1, undefined, undefined, 60);
        with (obj_puzzlecloset_tvturnon)
            turnon = true;
        snd = snd_play_x(snd_tv_poweron, 0.4, 0.5);
        snd_volume(snd, 0, 15);
        snd = snd_play_x(snd_tv_poweron, 0.6, 2);
        snd_volume(snd, 0, 15);
    }
    if (timer == 18)
    {
        with (obj_board_screenColorChanger)
        {
            if (x >= 128 && x <= 512 && y >= 64 && y <= 320)
            {
                init = 0;
                force = 8;
                active = 1;
                roomstart = 60;
            }
        }
    }
    if (timer < 30)
        global.interact = 1;
    if (timer == 30)
    {
        global.swordboardeath = 0;
        global.interact = 0;
        con++;
    }
}
