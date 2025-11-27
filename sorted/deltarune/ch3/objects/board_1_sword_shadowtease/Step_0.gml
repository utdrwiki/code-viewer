if (active)
{
    if (con == 0 && obj_board_camera.con == 0)
    {
        if (place_meeting(x, y, obj_mainchara_board))
        {
            global.flag[1008] = 1;
            snd_play(snd_board_mantle_move);
            vspeed = -8;
            con = 1;
            with (obj_mainchara_board)
                cantleave = true;
        }
    }
    if (con == 1)
    {
        shadowtimer++;
        if ((shadowtimer % 4) == 0)
            scr_board_afterimage(0, 4, 2);
        if (y < 32)
        {
            depth = 999999;
            image_alpha = 0;
            shopwriter = instance_create(x, y, obj_board_shopwriter);
            shopwriter.shopstring = mystring;
            shopwriter.textcol = 0;
            shopwriter.depth = 100000;
            setxy(board_tilex(1), board_tiley(1));
            made = true;
            with (obj_mainchara_board)
                cantleave = false;
            with (obj_board_b1_shadowteaseentrance)
                instance_destroy();
            con = 2;
        }
    }
    if (con == 2)
        drawtext = true;
}
else
{
    if (made == true)
    {
        made = false;
        safe_delete(shopwriter);
    }
    timer = 0;
    texttimer = 0;
    drawtext = false;
}
