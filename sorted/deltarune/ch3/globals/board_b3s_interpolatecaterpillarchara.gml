function scr_board_b3s_interpolatecaterpillarchara()
{
    if (i_ex(obj_mainchara_board))
    {
        var xpos = obj_mainchara_board.x;
        var ypos = obj_mainchara_board.y;
        for (var i = 0; i < 75; i += 1)
        {
            remx[i] = x;
            remy[i] = y;
            facing[i] = 0;
        }
        var _newfacing;
        if (x != xpos && y != ypos)
            _newfacing = scr_facing_letter_to_number(scr_get_cardinal_direction(point_direction(x, y, obj_mainchara_board.x, obj_mainchara_board.y)));
        else
            _newfacing = obj_mainchara_board.facing;
        remx[0] = xpos;
        remy[0] = ypos;
        facing[0] = _newfacing;
        for (var _iaia = target; _iaia > 0; _iaia -= 1)
        {
            remx[_iaia] = lerp(xpos, x, _iaia / target);
            remy[_iaia] = lerp(ypos, y, _iaia / target);
            facing[_iaia] = _newfacing;
        }
    }
    else
    {
        return 0;
    }
}
