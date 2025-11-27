function scr_sort_by_distance(arg0, arg1, arg2, arg3)
{
    var _array = arg2;
    var _array_length = array_length_1d(_array);
    var _distance_array = [];
    for (var _i = 0; _i < _array_length; _i++)
        _array[_i].sort_value = point_distance(arg0, arg1, _array[_i].x, _array[_i].y);
    
    var _ascending = function(arg0, arg1)
    {
        return arg0.sort_value - arg1.sort_value;
    };
    
    var _descending = function(arg0, arg1)
    {
        return arg1.sort_value - arg0.sort_value;
    };
    
    if (arg3)
        array_sort(_array, _ascending);
    else
        array_sort(_array, _descending);
    return _array;
}
