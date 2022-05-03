scr_sort_by_distance = function(argument0, argument1, argument2, argument3) //gml_Script_scr_sort_by_distance
{
    var _array = argument2
    var _ascending = argument3
    var _array_length = array_length_1d(argument0)
    for (i = 0; i < _array_length; i++)
        _distance_array[i] = point_distance(argument0, argument1, _array[i].x, _array[i].y)
    var _tempValue = 0
    var _loopAgain = 1
    var _emergencyStop = 0
    while (_loopAgain == 1 && _emergencyStop < 100)
    {
        _loopAgain = 0
        _emergencyStop++
        for (i = 1; i < _array_length; i++)
        {
            if (_distance_array[i] == _distance_array[(i - 1)])
            {
            }
            else if (_ascending == (_distance_array[i] < _distance_array[(i - 1)]))
            {
                _loopAgain = 1
                _tempValue = _distance_array[(i - 1)]
                _distance_array[(i - 1)] = _distance_array[i]
                _distance_array[i] = _tempValue
                _tempValue = _array[(i - 1)]
                _array[(i - 1)] = _array[i]
                _array[i] = _tempValue
            }
        }
    }
    if (_emergencyStop >= 100)
        scr_debug_print("")
    return _array;
}

