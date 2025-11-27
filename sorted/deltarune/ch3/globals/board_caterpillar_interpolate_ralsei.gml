function scr_board_caterpillar_interpolate_ralsei()
{
    var _ralsei = obj_board_controller.ralsei_object;
    if (_ralsei != -1)
    {
        with (_ralsei)
        {
            for (i = 0; i < 75; i += 1)
            {
                remx[i] = x;
                remy[i] = y;
                facing[i] = 0;
            }
        }
        var _a = 0;
        var _dir = point_direction(_ralsei.x, _ralsei.y, x, y);
        repeat (_ralsei.ralsei_target)
        {
            _ralsei.remx[_a] = lerp(obj_board_controller.kris_object.x, _ralsei.x, _a / _ralsei.ralsei_target);
            _ralsei.remy[_a] = lerp(obj_board_controller.kris_object.y, _ralsei.y, _a / _ralsei.ralsei_target);
            if (_dir >= 45 && _dir < 135)
                _ralsei.facingdir[_a] = 2;
            else if (_dir >= 135 && _dir < 225)
                _ralsei.facingdir[_a] = 3;
            else if (_dir >= 225 && _dir < 315)
                _ralsei.facingdir[_a] = 0;
            else if (_dir >= 315 || _dir < 45)
                _ralsei.facingdir[_a] = 1;
            _a++;
        }
    }
}
