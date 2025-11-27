function scr_sort_by_depth(arg0, arg1)
{
    if (arg1)
    {
        array_sort(arg0, function(arg0, arg1)
        {
            return arg0.depth - arg1.depth;
        });
    }
    else
    {
        array_sort(arg0, function(arg0, arg1)
        {
            return arg1.depth - arg0.depth;
        });
    }
    return arg0;
}

function scr_sort_by_depth_old(arg0, arg1)
{
    var _array = arg0;
    var _ascending = arg1;
    var _array_length = array_length(arg0);
    var _loopStart = 1;
    var _depth_array;
    for (i = 0; i < _array_length; i++)
        _depth_array[i] = _array[i].depth;
    var _tempValue = 0;
    var _loopAgain = true;
    while (_loopAgain == true)
    {
        _loopAgain = false;
        for (i = _loopStart; i < _array_length; i++)
        {
            if (i == _loopStart)
                _loopStart = _array_length - 1;
            if (_depth_array[i] == _depth_array[i - 1])
            {
                if (_ascending == (real(_array[i].id) > real(_array[i - 1].id)))
                    continue;
            }
            if (_ascending == (_depth_array[i] < _depth_array[i - 1]) || _depth_array[i] == _depth_array[i - 1])
            {
                _loopAgain = true;
                _tempValue = _depth_array[i - 1];
                _depth_array[i - 1] = _depth_array[i];
                _depth_array[i] = _tempValue;
                _tempValue = _array[i - 1];
                _loopStart = min(_loopStart, max(i - 1, 1));
                _array[i - 1] = _array[i];
                _array[i] = _tempValue;
            }
        }
    }
    return _array;
}
