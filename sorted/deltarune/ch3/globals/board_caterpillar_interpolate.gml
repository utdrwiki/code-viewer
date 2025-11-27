function scr_board_caterpillar_interpolate()
{
    var _____kris = 0;
    with (obj_mainchara_board)
    {
        if (name == "kris")
            _____kris = id;
    }
    if (_____kris != 0)
    {
        remx[0] = _____kris.x;
        remy[0] = _____kris.y;
        for (var __rempos = 75; __rempos > 0; __rempos -= 1)
        {
            remx[__rempos] = lerp(_____kris.x, x, __rempos / 75);
            remy[__rempos] = lerp(_____kris.y, y + 6, __rempos / 75);
        }
    }
}
