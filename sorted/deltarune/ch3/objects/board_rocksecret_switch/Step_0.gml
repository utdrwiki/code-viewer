if (active)
{
    if (con == -1)
    {
        if (!place_meeting(x, y, obj_pushable_block))
        {
            con = 1;
            timer = 0;
        }
    }
    if (con == 1)
    {
        image_index = 1;
        snd_play_pitch(snd_coin, 1.4);
        maildoor = instance_create_board(10, 2, obj_board_warptouch);
        maildoor.warpx = 2048;
        maildoor.warpy = 64;
        maildoor.playerX = 2224;
        maildoor.playerY = 288;
        maildoor.sprite_index = spr_board_downstairs;
        maildoor.visible = true;
        maildoor.image_alpha = 1;
        maildoor.depth = depth;
        scr_darksize(maildoor);
        rocksecretSwitchString = stringsetloc("Oh! What was#that sound?", "obj_board_rocksecret_switch_slash_Step_0_gml_33_0");
        scr_couchtalk(rocksecretSwitchString, "ralsei", 1, 120);
        con = 2;
    }
}
