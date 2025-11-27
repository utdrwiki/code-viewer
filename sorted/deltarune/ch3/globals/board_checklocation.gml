function scr_board_checklocation()
{
    var _name = argument0;
    var _xloc = argument1;
    var _yloc = argument2;
    if (_xloc < 12)
        _xloc = board_tilex(_xloc);
    if (_yloc < 12)
        _yloc = board_tiley(_yloc);
    var _tol = 4;
    if (argument_count == 4)
        _tol = argument3;
    var targ = 0;
    with (obj_mainchara_board)
    {
        if (name == _name)
            targ = id;
    }
    if (!i_ex(targ))
    {
        debug_message("target does not exist");
        return false;
    }
    if (abs(targ.x - _xloc) < _tol && abs(targ.y - _yloc) < _tol)
        return true;
}
