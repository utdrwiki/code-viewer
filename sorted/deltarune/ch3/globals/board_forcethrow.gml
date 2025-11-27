function scr_board_forcethrow()
{
    var delivered = false;
    var _mysusie = 0;
    with (obj_mainchara_board)
    {
        if (name == "susie")
            _mysusie = id;
    }
    if (!i_ex(_mysusie))
    {
        debug_print("NO SUSIE FOUND");
        return 0;
    }
    if (i_ex(obj_board_grabobject))
    {
        var realsux = round((_mysusie.x - 128) / 32);
        var realsuy = round((_mysusie.y - 64) / 32);
        realsux = clamp(realsux, 1, 10);
        realsuy = clamp(realsuy, 1, 6);
        if (!i_ex(instance_place(board_tilex(realsux - 1), board_tiley(realsuy), obj_board_solid)))
        {
            delivered = true;
            _mysusie.facing = 3;
            with (obj_board_grabobject)
            {
                aimx = board_tilex(realsux - 1);
                aimy = board_tiley(realsuy);
                snd_play(snd_board_throw);
                grabdaddy.xx = aimx;
                grabdaddy.yy = aimy;
                con = 1;
            }
        }
        else
        {
        }
        if (!delivered)
        {
            if (!i_ex(instance_place(board_tilex(realsux + 1), board_tiley(realsuy), obj_board_solid)))
            {
                _mysusie.facing = 1;
                delivered = true;
                with (obj_board_grabobject)
                {
                    aimx = board_tilex(realsux + 1);
                    aimy = board_tiley(realsuy);
                    snd_play(snd_board_throw);
                    grabdaddy.xx = aimx;
                    grabdaddy.yy = aimy;
                    con = 1;
                }
            }
            else
            {
            }
        }
        if (!delivered)
        {
            if (!i_ex(instance_place(board_tilex(realsux), board_tiley(realsuy - 1), obj_board_solid)))
            {
                _mysusie.facing = 2;
                delivered = true;
                with (obj_board_grabobject)
                {
                    aimx = board_tilex(realsux);
                    aimy = board_tiley(realsuy - 1);
                    snd_play(snd_board_throw);
                    grabdaddy.xx = aimx;
                    grabdaddy.yy = aimy;
                    con = 1;
                }
            }
            else
            {
            }
        }
        if (!delivered)
        {
            if (!i_ex(instance_place(board_tilex(realsux), board_tiley(realsuy - 1), obj_board_solid)))
            {
                _mysusie.facing = 0;
                delivered = true;
            }
            else
            {
            }
        }
        if (delivered == false)
        {
            _mysusie.facing = 2;
            with (obj_board_grabobject)
            {
                aimx = grabdaddy.x;
                aimy = grabdaddy.y;
                snd_play(snd_board_throw);
                grabdaddy.xx = aimx;
                grabdaddy.yy = aimy;
                con = 1;
            }
        }
    }
}
